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
        Container(
          color: Colors.lightGreen, // Light green background color
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Text(
                "Armaan",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "armaan33000@gmail.com",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // White text color
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading:
              Icon(Icons.home, color: Colors.green), // Dark green icon color
          title: Text("Home",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Navigate to the home screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading:
              Icon(Icons.person, color: Colors.green), // Dark green icon color
          title: Text("Profile",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Navigate to the profile screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.settings,
              color: Colors.green), // Dark green icon color
          title: Text("Settings",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Navigate to the settings screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading:
              Icon(Icons.logout, color: Colors.green), // Dark green icon color
          title: Text("Logout",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Perform logout actions here
            Navigator.pop(context); // Close the drawer
          },
        ),
        Divider(), // A horizontal line to separate items
        ListTile(
          leading: Icon(Icons.local_shipping,
              color: Colors.green), // Dark green icon color
          title: Text("Cargo Listings",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Navigate to cargo listings screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading:
              Icon(Icons.add, color: Colors.green), // Dark green icon color
          title: Text("Add Cargo Listing",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Navigate to add cargo listing screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.directions_car,
              color: Colors.green), // Dark green icon color
          title: Text("Vehicle Pooling",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Navigate to vehicle pooling listings screen
            Navigator.pop(context); // Close the drawer
          },
        ),
      ],
    ),
  );
}
