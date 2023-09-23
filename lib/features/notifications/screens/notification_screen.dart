import 'package:flutter/material.dart';
import '../widgets/notification_widget.dart';// Import the NotificationWidget

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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Example notifications using NotificationWidget
          NotificationWidget(
            userName: "John Doe",
            action: "Assigned a role",
            time: "2 hours ago",
          ),
          NotificationWidget(
            userName: "Alice Smith",
            action: "Sent you a message",
            time: "3 hours ago",
          ),
          NotificationWidget(
            userName: "Bob Johnson",
            action: "Liked your post",
            time: "5 hours ago",
          ),
          // Add more NotificationWidgets as needed
        ],
      ),
    );
  }
}
