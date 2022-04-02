using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Watcher.BLL.Models;

namespace Watcher.Converters
{
	public class DefaultFetchResultToActionResult : ITypeConverter<DefaultFetchResult, ActionResult>
	{
		public ActionResult Convert(DefaultFetchResult source, ActionResult destination, ResolutionContext context)
		{
			switch (source.Error)
			{
				case ErrorCode.OK:
					return new OkResult();
				case ErrorCode.ACCESS_DENIED:
					return new ForbidResult();
				case ErrorCode.DATA_VALIDATION:
					return new BadRequestResult();
				case ErrorCode.UNKNOWN:
					return new StatusCodeResult(500);
				default:
					return new StatusCodeResult(501);
			}
		}
	}
}
