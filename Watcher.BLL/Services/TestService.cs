using AutoMapper;
using Watcher.BLL.Models;
using Watcher.BLL.Models.Tests;
using Watcher.DAL.Database.UnitOfWork.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;
using System.Linq;

namespace Watcher.BLL.Services
{
	internal class TestService : CrudService<Test, AddTestData, ITestRepository, DAL.Database.Models.Test>, ITestService
	{
		private readonly ITestExecutionService _testExecutionService;

		public TestService(
			IMapper mapper,
			ITestRepository repository,
			ITestExecutionService testExecutionService
			) : base(mapper, repository) {
			_testExecutionService = testExecutionService;
		}

		public async Task<DefaultFetchResult> AddAsync(AddTestData entity, int userId)
		{
			entity.UserId = userId;

			var addResult = await AddAsync(entity);

			if(addResult.Error == ErrorCode.OK)
            {
				await _testExecutionService.ScheduleTest(addResult.Data);
			}

			return addResult.DefaultFetchResult;
		}

		public async Task<DefaultDataFetchResult<ICollection<Test>>> GetAllAsync(int userId)
		{
			try
			{
				var result = new DefaultDataFetchResult<ICollection<Test>>();

				var dalCities = await _repository.GetAllAsync(userId);

				return new DefaultDataFetchResult<ICollection<Test>>
				{
					Data = _mapper.Map<ICollection<Test>>(dalCities),
					Error = ErrorCode.OK
				};
			}
			catch
			{
				return new DefaultDataFetchResult<ICollection<Test>>
				{
					Error = ErrorCode.UNKNOWN
				};
			}
		}

		public async Task<DefaultFetchResult> UpdateAsync(Test entity, int userId)
		{
			var result = new DefaultFetchResult();

			var isSalonRelatedToAdmin = await IsRelatedToUser(entity.Id, userId);
			if (!isSalonRelatedToAdmin)
			{
				result.Error = ErrorCode.ACCESS_DENIED;
			}
			else
			{
				entity.UserId = userId;
				result = await UpdateAsync(entity);

				if(result.Error == ErrorCode.OK)
                {
					await _testExecutionService.UpdateScheduledJob(entity);
                }
			}

			return result;
		}

		public async Task<DefaultFetchResult> DeleteAsync(int id, int userId)
        {
			var result = new DefaultFetchResult();

			var isRelatedToUser = await IsRelatedToUser(id, userId);
			if (!isRelatedToUser)
			{
				result.Error = ErrorCode.ACCESS_DENIED;
			}
			else
			{
				result = await DeleteAsync(id);

				if (result.Error == ErrorCode.OK)
				{
					await _testExecutionService.DeleteTestSchedule(id);
				}
			}

			return result;
		}

		private Task<bool> IsRelatedToUser(int id, int userId)
		{
			return _repository.IsRelatedToUser(id, userId);
		}

		public async Task InitAsync()
		{
			DefaultDataFetchResult<ICollection<Test>> testsFetchResult;

			do
			{
				testsFetchResult = await GetAllAsync();

				if (testsFetchResult.Error != ErrorCode.OK)
				{
					await Task.Delay(TimeSpan.FromSeconds(10));
				}
			} while (testsFetchResult.Error != ErrorCode.OK);

			await Task.WhenAll(testsFetchResult.Data.Select( _testExecutionService.ScheduleTest));
		}
    }
}
