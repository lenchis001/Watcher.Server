class TestExecution {
  final int id;
  final DateTime dateTime;
  final String log;
  final int testId;
  final bool isSuccessful;

  TestExecution({
    required this.id,
    required this.dateTime,
    required this.log,
    required this.testId,
    required this.isSuccessful
  });
}
