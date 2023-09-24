import 'package:ecoride/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            moveScreen(
                context,
                ProfileScreen(
                  name: 'Armaan',
                  stars: 10,
                ));
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
        ListTile(
          leading: Icon(Icons.directions_car,
              color: Colors.green), // Dark green icon color
          title: Text("Add Your Vehicle for Pooling",
              style: TextStyle(color: Colors.green)), // Dark green text color
          onTap: () {
            // Navigate to add your vehicle for pooling screen
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          tileColor: Colors.red,
          leading:
              Icon(Icons.sos, color: Colors.white), // Dark green icon color
          title: Text("Emergency SOS",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold)), // Dark green text color
          onTap: () {
            // Show SOS confirmation dialog
            showSOSConfirmationDialog(context);
          },
        ),
      ],
    ),
  );
}

void showSOSConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Emergency SOS"),
        content: Text("Are you sure you want to send an SOS signal?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Handle SOS action here
              Navigator.pop(context); // Close the dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Emergency SOS"),
                    content:
                        Text("Are you sure you want to send an SOS signal?"),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          // Handle SOS action here
                          Navigator.pop(context); // Close the dialog
                          Uri phoneno = Uri.parse('tel:+911');
                          if (await launchUrl(phoneno)) {
                            //dialer opened
                          } else {
                            //dailer is not opened
                          }
                        },
                        child: Text(
                          "Yes, Send SOS",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              "Yes, Send SOS",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
