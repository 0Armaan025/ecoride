import 'package:ecoride/features/calculator/calculator_screen.dart';
import 'package:ecoride/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final double stars;

  ProfileScreen({required this.name, required this.stars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      drawer: buildDrawer(context),
      backgroundColor: Colors.green, // Background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Futuristic green color
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // White text color
              ),
            ),
            SizedBox(height: 20),
            Text(
              FirebaseAuth.instance.currentUser?.email ??
                  'the email is supposed to be here.',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // White text color
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBarIndicator(
                  rating: stars,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.green, // Futuristic green color
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey[600],
                leading: Icon(
                  Icons.info,
                  color: Colors.white, // Futuristic green color
                ),
                title: Text(
                  'App Guide',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, // White text color
                  ),
                ),
                onTap: () {
                  // Implement guide navigation
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey[400],
                leading: Icon(
                  Icons.calculate,
                  color: Colors.white, // Futuristic green color
                ),
                title: Text(
                  'Carbon Footprint Calculator',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, // White text color
                  ),
                ),
                onTap: () {
                  moveScreen(context, CarbonFootprintScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey[700],
                leading: Icon(
                  Icons.settings,
                  color: Colors.white, // Futuristic green color
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, // White text color
                  ),
                ),
                onTap: () {
                  // Implement settings navigation
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
