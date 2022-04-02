using AutoMapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Watcher.BLL.Services;
using Watcher.Models.v1.Users;
using System.Security.Claims;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Watcher.Controllers.Api.V1.Dashboard
{
	[Route("api/v1/dashboard/[controller]")]
	[ApiController]
	public class UserController : ControllerBase
	{
		private readonly IUserService _userService;
		private readonly IMapper _mapper;

		public UserController(
			IUserService userService,
			IMapper mapper)
		{
			_userService = userService;
			_mapper = mapper;
		}


		[AllowAnonymous]
		[HttpPost]
		public async Task<ActionResult<User>> Post([FromBody] AddUserData model)
		{
			var bllUser = _mapper.Map<BLL.Models.Users.AddUserData>(model);
			var bllResult = await _userService.RegisterAsync(bllUser);
			var result = _mapper.Map<ActionResult<User>>(bllResult);

			if (result.Result == null)
			{
				result = await MakeSignIn(result.Value);
			}

			return result;
		}

		[AllowAnonymous]
		[HttpPost("signIn")]
		public async Task<ActionResult<User>> SignIn([FromBody] SignInResuest body)
		{
			var user = _mapper.Map<User>(await _userService.GetByCredsAsync(body.Email, body.Password));

			return await MakeSignIn(user);
		}

		[HttpPost("signOut")]
		[Authorize(Roles = "SalonUser")]
		public Task SignOutAsync()
		{
			return HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
		}

		[HttpGet("issignedin")]
		[Authorize(Roles = "SalonUser")]
		public void IsSignedIn() { }

		//[HttpPut("changePassword")]
		//public async Task<ActionResult<User>> ChangePassword(ChangePasswordModel model)
		//{
		//	int id = this.GetUserId();

		//	var bllResult = await _userService.ChangePasswordAsync(id, model.CurrentPassword, model.NewPassword);
		//	var result = _mapper.Map<ChangePasswordResult>(bllResult);

		//	return new ChangePasswordResponseModel
		//	{
		//		ChangePasswordResult = result
		//	};
		//}

		private async Task<ActionResult<User>> MakeSignIn(User user)
		{
			if (user != null)
			{
				var claims = new Claim[]
				{
					new Claim(ClaimTypes.Name, user.Email),
					new Claim(ClaimTypes.Role, "SalonUser"),
					new Claim(ClaimTypes.NameIdentifier, user.Id.ToString())
				};

				ClaimsIdentity claimsIdentity = new ClaimsIdentity(
					claims, CookieAuthenticationDefaults.AuthenticationScheme);

				AuthenticationProperties authProperties = new AuthenticationProperties
				{
				};

				await HttpContext.SignInAsync(
					CookieAuthenticationDefaults.AuthenticationScheme,
					new ClaimsPrincipal(claimsIdentity),
					authProperties);

				return new ActionResult<User>(user);
			}
			else
			{
				return new UnauthorizedResult();
			}
		}
	}
}
