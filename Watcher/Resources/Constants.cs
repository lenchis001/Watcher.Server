namespace Watcher.Resources
{
	public class Constants
	{
		public const string PasswordRegex = @"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&^_-]{8,}$";

		public const string PasswordOrEmptyRegex = @"^$|^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&amp;^_-]{8,}$";

		public const string EmailRegex = "^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$";

		public const string NameRegex = @"^[\sa-zA-Zа-яА-ЯäöüÄÖÜß_-]{2,16}$";

		public const string AddressRegex = @"^[a-zA-Zа-яА-ЯäöüÄÖÜß\-\s\d]{3,16}$";

		public const string OfficeNameRegex = @"^[a-zA-Zа-яА-ЯäöüÄÖÜß\-\s]{3,16}$";

		public const string PhoneRegex = @"^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$";

		public const string NewsTitleRegex = @"^[a-zA-Zа-яА-ЯäöüÄÖÜß\-\s\d]{3,16}$";

		public const string NewsTextRegex = @"^[a-zA-Zа-яА-ЯäöüÄÖÜß\-\s\d,;-]{10,256}$";

		#region Work
		public const string WorkNameRegex = @"^[a-zA-Zа-яА-ЯäöüÄÖÜß\-\s]{3,16}$";

		public const string WorkPriceRegex = @"^(\d+\.\d+)|\d+$";

		public const string WorkDurationRegex = @"^\d+$";

		public const string WorkTextRegex = @"^[a-zA-Zа-яА-ЯäöüÄÖÜß\-\s\d,;-]{10,256}$";
		#endregion

		#region Salon
		public const string SalonNameRegex = @"^[a-zA-Zа-яА-ЯäöüÄÖÜß\-\s]{1,16}$";
		#endregion
	}
}
