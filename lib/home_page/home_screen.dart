import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_controller.dart';
import 'home_model.dart';
import 'widgets/date_card_widget.dart';
import 'widgets/user_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late DateController dateController;
//   late UserController userController;
//   // List<DateModel> dates = [];
//   late UserModel users;

//   @override
//   void initState() {
//     dateController = DateController();
//     userController = UserController();
//     // dates = dateController.getDateData();
//     users = userController.getUserData();

//     // dateController.getDateData();
//     super.initState();
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserController userController = UserController();
    final DateController dateController = ref.watch(dateControllerProvider);
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
                userModel: userController.getUserData(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'This Week (18)',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Row(
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
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              FutureBuilder<List<DateModel>>(
                  future: dateController.getDateData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData) {
                      return const Text('No data available');
                    }
                    final dates = snapshot.data!;
                    return SizedBox(
                      height: 150.0,
                      width: 700.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dates.length,
                          itemBuilder: (context, index) {
                            final date = dates[index];
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
