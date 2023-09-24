import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoride/features/auth/models/alert.dart';
import 'package:ecoride/features/home/screens/feature_screen.dart';
import 'package:ecoride/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green, // Customize app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome, Admin!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Guidelines for Creating Alerts:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '1. Be concise and clear in your alert messages.\n'
                '2. Specify the type and severity of the alert (e.g., Emergency, Warning, Information).\n'
                '3. Provide relevant details to guide recipients on what to do.\n'
                '4. Use appropriate colors and icons for better visibility.\n'
                '5. Preview your alert before sending it out.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the alert creation form screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAlertScreen()),
                );
              },
              child: Text('Create Alert',
                  style:
                      GoogleFonts.roboto(fontSize: 20.0, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Customize button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAlertScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Alert',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green, // Customize app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Alert Title'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Alert Description'),
              maxLines: 5,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                AlertModel model = AlertModel(
                    alertTitle: titleController.text,
                    alertDescription: descriptionController.text,
                    alertTime: DateTime.now().toString());

                FirebaseFirestore.instance
                    .collection('alerts')
                    .doc(model.alertTime + model.alertTitle)
                    .set(model.toMap());

                moveScreen(context, HomeScreen());
              },
              child: Text(
                'Send Alert',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Customize button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
