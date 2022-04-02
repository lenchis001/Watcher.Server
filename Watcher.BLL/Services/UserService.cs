using AutoMapper;
using Watcher.BLL.Models;
using Watcher.BLL.Models.Users;
using Watcher.DAL.Database.UnitOfWork.Repositories;
using System.Threading.Tasks;

namespace Watcher.BLL.Services
{
	public class UserService : CrudService<User, AddUserData, IUserRepository, DAL.Database.Models.User>, IUserService
	{
		private readonly IHashService _hashService;

		public UserService(
			IMapper mapper,
			IUserRepository repository,
			IHashService hashService) :
			base(mapper, repository)
		{
			_hashService = hashService;
		}

		public Task<ChangePasswordErrorCode> ChangePasswordAsync(int id, string currentPassword, string newPassword)
		{
			throw new System.NotImplementedException();
		}

		public async Task<User> GetByCredsAsync(string email, string password)
		{
			var passwordHash = _hashService.MakeHash(password);

			var dalResult = await _repository.GetByCredsAsync(email, passwordHash);

			return _mapper.Map<User>(dalResult);
		}

		public async Task<DefaultDataFetchResult<User>> RegisterAsync(AddUserData registerData)
		{
			try
			{
				var isAlreadyExists = await _repository.AnyBySensitiveUserDataAsync(registerData.Email);

				if (isAlreadyExists)
				{
					return new DefaultDataFetchResult<User>
					{
						Error = ErrorCode.DATA_VALIDATION
					};
				}

				var dalUser = _mapper.Map<DAL.Database.Models.User>(registerData);
				var dalResult = await _repository.AddAsync(dalUser);
				var result = _mapper.Map<User>(dalResult);

				return new DefaultDataFetchResult<User>
				{
					Data = result,
					Error = ErrorCode.OK
				};
			}
			catch
			{
				return new DefaultDataFetchResult<User>
				{
					Error = ErrorCode.UNKNOWN
				};
			}
		}
	}
}
