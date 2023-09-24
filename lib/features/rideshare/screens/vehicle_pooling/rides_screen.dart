import 'package:ecoride/features/rideshare/screens/vehicle_pooling/add_ride_screen.dart';
import 'package:ecoride/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class RidesScreen extends StatelessWidget {
  final List<String> updates = [
    "https://via.placeholder.com/300x150?text=Update1",
    "https://via.placeholder.com/300x150?text=Update2",
    "https://via.placeholder.com/300x150?text=Update3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 218, 156),
      appBar: AppBar(
        title: Text("EcoRide"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'A Ride time 🚗🔥',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: updates.map((url) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(url, fit: BoxFit.cover),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  moveScreen(context, AddRideScreen());
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Colors.green.shade800,
                ),
                child: Text(
                  "Add Your Vehicle for Carpooling",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Available Rides",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  RideListing(
                    imageUrl: "https://via.placeholder.com/100x100?text=Ride1",
                    title: "Car - ABC 123",
                    driver: "Driver: John Doe",
                    destination: "Destination: Destination",
                  ),
                  RideListing(
                    imageUrl: "https://via.placeholder.com/100x100?text=Ride2",
                    title: "Bike - XYZ 456",
                    driver: "Driver: Jane Smith",
                    destination: "Destination: Destination",
                  ),
                ]),
              ),
            ),

            // Add more ride listings as needed
          ],
        ),
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class RideListing extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String driver;
  final String destination;

  const RideListing({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.driver,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(driver,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                )),
            SizedBox(height: 10),
            Text(destination,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                )),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Register button press
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.green[600],
              ),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
