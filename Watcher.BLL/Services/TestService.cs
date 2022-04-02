using AutoMapper;
using Watcher.BLL.Models;
using Watcher.BLL.Models.Tests;
using Watcher.DAL.Database.UnitOfWork.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Watcher.BLL.Services
{
	internal class TestService : CrudService<Test, AddTestData, ITestRepository, DAL.Database.Models.Test>, ITestService
	{
		public TestService(IMapper mapper, ITestRepository repository) : base(mapper, repository) {}

		public Task<DefaultFetchResult> AddAsync(AddTestData entity, int adminId)
		{
			entity.UserId = adminId;

			return AddAsync(entity);
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
				return await UpdateAsync(entity);
			}

			return result;
		}

		private Task<bool> IsRelatedToUser(int id, int userId)
		{
			return _repository.IsRelatedToUser(id, userId);
		}
	}
}
