import 'package:flutter/material.dart';
import '../home_model.dart';

class DateCardWidget extends StatelessWidget {
  const DateCardWidget({
    super.key,
    required this.dateModel,
  });

  final DateModel dateModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Text(
            dateModel.day,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
          Text(
            dateModel.date,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 45.0,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateModel.services != null ? dateModel.services! : '',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              Text(
                dateModel.events != null ? dateModel.events! : '',
                textAlign: TextAlign.left,
                style: const TextStyle(
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
