namespace Watcher.BLL.Models
{
	public class DefaultFetchResult : FetchResult<ErrorCode>
	{
		public static DefaultFetchResult UnknownErrorResult => new DefaultFetchResult
		{
			Error = ErrorCode.UNKNOWN
		};

		public static DefaultFetchResult OkResult => new DefaultFetchResult
		{
			Error = ErrorCode.OK
		};

		public static DefaultFetchResult DataValidationErrorResult => new DefaultFetchResult
		{
			Error = ErrorCode.DATA_VALIDATION
		};
	}
}
