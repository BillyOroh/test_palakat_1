import 'package:flutter/material.dart';
import '../home_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
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
                    style: const TextStyle(
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
