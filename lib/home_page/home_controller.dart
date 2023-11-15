import 'home_model.dart';

class DateController {
  List<DateModel> dates = [
    DateModel(
      day: 'Sun',
      date: '10',
      services: '4 Services',
      events: '2 Events',
    ),
    DateModel(
      day: 'Mon',
      date: '11',
      services: '4 Services',
      events: '2 Events',
    ),
    DateModel(
      day: 'Tue',
      date: '12',
      services: '4 Services',
      events: '2 Events',
    ),
    DateModel(
      day: 'Wed',
      date: '13',
      services: '4 Services',
    ),
  ];
  List<DateModel> getDateData() {
    return dates;
  }
}

class UserController {
  UserModel users = UserModel(
    userName: 'Jhon Manembo',
    churchName: 'Riedel Wawalintouan',
  );
  UserModel getUserData() {
    return users;
  }
}
