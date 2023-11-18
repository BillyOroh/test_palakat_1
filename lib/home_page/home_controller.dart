import 'home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DateController {
  List<DateModel> dates = [];
  // List<DateModel> dates = [
  //   DateModel(
  //     id: '0',
  //     day: 'Sun',
  //     date: '10',
  //     services: '4 Services',
  //     events: '2 Events',
  //   ),
  //   DateModel(
  //     id: '1',
  //     day: 'Mon',
  //     date: '11',
  //     services: '4 Services',
  //     events: '2 Events',
  //   ),
  //   DateModel(
  //     id: '3',
  //     day: 'Tue',
  //     date: '12',
  //     services: '4 Services',
  //     events: '2 Events',
  //   ),
  //   DateModel(
  //     id: '4',
  //     day: 'Wed',
  //     date: '13',
  //     services: '4 Services',
  //   ),
  // ];

  // List<DateModel> getDateData() {
  //   return dates;
  // }

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

  // Future getDateData(String documentId) async {
  //   await FirebaseFirestore.instance.collection('dates').doc(documentId).get()
  // }

  CollectionReference dateCollection =
      FirebaseFirestore.instance.collection('dates');

  Future<List<DateModel>> getDateData() async {
    QuerySnapshot querySnapshot = await dateCollection.get();

    if (querySnapshot.docs.isNotEmpty) {
      dates = querySnapshot.docs.map((document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        return DateModel(
          id: document.id,
          day: data['day'],
          date: data['date'],
          events: data['events'],
          services: data['services'],
        );
      }).toList();

      return dates;

      // dates.forEach((date) {
      //   // dates.add(DateModel(id: date.id, day: date.day, date: date.date));
      //   // print('ID: ${date.id}, Tanggal: ${date.day} ${date.date}');
      // });
    } else {
      throw ArgumentError('No Collection Found');
    }
  }
}

class UserController {
  UserModel users = UserModel(
    id: '0',
    userName: 'Jhon Manembo',
    churchName: 'Riedel Wawalintouan',
  );
  UserModel getUserData() {
    return users;
  }
}
