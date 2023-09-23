import 'package:flutter/material.dart';

void moveScreen(BuildContext context, Widget screen,
    {bool isPushReplacement = false}) {
  if (isPushReplacement) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            "John Doe",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            "john.doe@example.com",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(
                "assets/profile_image.png"), // Replace with your profile image
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            // Navigate to the home screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
          onTap: () {
            // Navigate to the profile screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {
            // Navigate to the settings screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        Divider(), // A horizontal line to separate items
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: () {
            // Perform logout actions here
            Navigator.pop(context); // Close the drawer
          },
        ),
      ],
    ),
  );
}
