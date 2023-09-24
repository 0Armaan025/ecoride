import 'package:ecoride/features/public_transport/get_transport.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AskFromWhereToWhere extends StatefulWidget {
  const AskFromWhereToWhere({super.key});

  @override
  State<AskFromWhereToWhere> createState() => _AskFromWhereToWhereState();
}

class _AskFromWhereToWhereState extends State<AskFromWhereToWhere> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text(
          "Eco-Friendly Travel",
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700], // Customize app bar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tell us about your trip 🚅",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: fromController,
              decoration: InputDecoration(
                labelText: "Start Location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: toController,
              decoration: InputDecoration(
                labelText: "Destination",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => GetTransport(
                              startLocation: fromController.text,
                              endLocation: toController.text,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 20),
                child: Text(
                  "Let's Go!",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green[700], // Customize button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
