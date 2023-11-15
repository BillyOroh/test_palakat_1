import 'home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  // Future <List<DateModel>> getDateData() async {
  //   await FirebaseFirestore.instance
  //       .collection('dates')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       final data = doc.data();
  //       return DateModel(
  //         day: data['day'],
  //         date: data['date'],
  //         services: data['services'] ,
  //         events: data['events'] ,
  //       );
  //     }).toList();
  //   });
  // }
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
