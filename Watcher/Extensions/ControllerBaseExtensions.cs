using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Security.Claims;

namespace Watcher.Extensions
{
	public static class ControllerBaseExtensions
	{
		public static int GetUserId(this ControllerBase controller)
		{
			return int.Parse(controller.User.Claims.First(c => c.Type == ClaimTypes.NameIdentifier).Value);
		}

		public static int GetSalonId(this ControllerBase controller)
		{
			return int.Parse(controller.User.Claims.First(c => c.Type == ClaimTypes.UserData).Value);
		}
	}
}
