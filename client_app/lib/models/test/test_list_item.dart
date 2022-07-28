class TestListItem {
  final int id;
  final String name, script, cron;
  final bool? isSuccessful;

  TestListItem({
    required this.id,
    required this.name,
    required this.script,
    required this.cron,
    required this.isSuccessful
  });
}