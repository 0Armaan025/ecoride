import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String userName;
  final String action;
  final String time;

  NotificationWidget({
    required this.userName,
    required this.action,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                action,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}
