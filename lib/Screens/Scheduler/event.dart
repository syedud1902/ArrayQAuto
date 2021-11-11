class Event {
  final DateTime date;
  final String title;
  final String eventTime;

  Event(
    this.date,
    this.title,
    this.eventTime,
  );

  String toString() => this.title;
}
