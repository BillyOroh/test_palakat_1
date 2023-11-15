class DateModel {
  final String day;
  final String date;
  final String? services;
  final String? events;

  DateModel({
    required this.day,
    required this.date,
    this.services,
    this.events,
  });
}

class UserModel {
  final String userName;
  final String churchName;

  UserModel({
    required this.userName,
    required this.churchName,
  });
}
