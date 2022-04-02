namespace Watcher.BLL.Models
{
	public class DefaultDataFetchResult<D> : DataFetchResult<D, ErrorCode>
	{
		public static DefaultDataFetchResult<D> UnknownErrorResult => new DefaultDataFetchResult<D>
		{
			Error = ErrorCode.UNKNOWN
		};

		public static DefaultDataFetchResult<D> AccessDeniedErrorResult => new DefaultDataFetchResult<D>
		{
			Error = ErrorCode.ACCESS_DENIED
		};
	}
}
