class DateModel {
  final String id;
  final String day;
  final String date;
  final String? services;
  final String? events;

  DateModel({
    required this.id,
    required this.day,
    required this.date,
    this.services,
    this.events,
  });
}

class UserModel {
  final String id;
  final String userName;
  final String churchName;

  UserModel({
    required this.id,
    required this.userName,
    required this.churchName,
  });
}
