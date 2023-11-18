import 'package:flutter/material.dart';

// import 'home_model.dart';
import 'home_controller.dart';
import 'home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateController dateController;
  late UserController userController;
  List<DateModel> dates = [];
  late UserModel users;

  @override
  void initState() {
    dateController = DateController();
    userController = UserController();
    // dates = dateController.getDateData();
    users = userController.getUserData();

    // dateController.getDateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Dashboard'),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              UserWidget(
                userModel: users,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'This Week (18)',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey.shade500,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              FutureBuilder<List<DateModel>>(
                  future: DateController().getDateData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show a loading indicator if the data is still loading
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      // Show an error message if there was an error fetching the data
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData) {
                      // Show a message if there is no data available
                      return Text('No data available');
                    }
                    final dateList = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dateList.length,
                          itemBuilder: (context, index) {
                            final date = dateList[index];
                            return DateCardWidget(
                              dateModel: date,
                            );
                          }),
                    );
                  }),
            ],
          ),
        ));
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'B',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.grey.shade500,
              ),
            ),
            VerticalDivider(
              width: 20.0,
              thickness: 1,
              endIndent: 0,
              color: Colors.grey.shade500,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    userModel.churchName,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(userModel.userName),
                ],
              ),
            ),
            VerticalDivider(
              width: 20.0,
              thickness: 1,
              endIndent: 0,
              color: Colors.grey.shade500,
            ),
            Text('17',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.grey.shade500,
                )),
          ],
        ),
      ),
    );
  }
}

class DateCardWidget extends StatelessWidget {
  const DateCardWidget({
    super.key,
    required this.dateModel,
  });

  final DateModel dateModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Text(
            dateModel.day,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          Text(
            dateModel.date,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 45.0,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateModel.services != null ? dateModel.services! : '',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              Text(
                dateModel.events != null ? dateModel.events! : '',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
