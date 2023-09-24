import 'package:flutter/material.dart';
import '../widgets/notification_widget.dart'; // Import the NotificationWidget
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationScreen(),
  ));
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('alerts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          final documents = snapshot.data!.docs;

          return ListView(
            padding: EdgeInsets.all(16),
            children: documents.map((doc) {
              final userName = doc['alertTitle'] as String;
              final action = doc['alertDescription'] as String;
              final time = doc['alertTime'] as String;

              return NotificationWidget(
                userName: userName,
                action: action,
                time: time,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
