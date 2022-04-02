using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Watcher.BLL.Models;

namespace Watcher.Converters
{
	public class DefaultDataFetchResultToActionResult<D, T> : ITypeConverter<DefaultDataFetchResult<D>, ActionResult<T>>
	{
		public ActionResult<T> Convert(DefaultDataFetchResult<D> source, ActionResult<T> destination, ResolutionContext context)
		{
			switch (source.Error)
			{
				case ErrorCode.OK:
					var t = context.Mapper.Map<T>(source.Data);
					return new ActionResult<T>(t);
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
