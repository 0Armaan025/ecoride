

import 'package:ecoride/features/hackathon/hackathon_home.dart';
import 'package:ecoride/features/public_transport/AskFromWhereToWhere.dart';
import 'package:ecoride/features/rideshare/screens/vehicle_pooling/rides_screen.dart';
import 'package:ecoride/models/hackathon.dart';
import 'package:ecoride/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../notifications/screens/notification_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green, // Main theme color

      scaffoldBackgroundColor: Colors.white, // Background color
    ),
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  // Placeholder data for ride history
  final List<Map<String, String>> rideHistory = [
    {
      'rideType': 'Your Car',
      'role': 'Driver',
      'description': 'Ride from Home to Office - 22/9/2023',
    },
    {
      'rideType': 'Someone Else\'s Car',
      'role': 'Rider',
      'description': 'Took a ride - 21/9/2023',
    },
  ];

  // Placeholder data for cargo shipments
  final List<Map<String, String>> cargoShipments = [
    {
      'shipmentStatus': 'In Transit',
      'currentLocation': 'City A',
      'estimatedArrival': '25/9/2023',
      'cargoType': 'Electronics',
      'weight': '500 kg',
      'sender': 'Company X',
      'receiver': 'Company Y',
    },
    {
      'shipmentStatus': 'Delivered',
      'currentLocation': 'City B',
      'estimatedArrival': '20/9/2023',
      'cargoType': 'Clothing',
      'weight': '300 kg',
      'sender': 'Company Z',
      'receiver': 'Company W',
    },
    // Add more shipments here
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMMM, yyyy - hh:mm a').format(now);

    // Placeholder images for the carousel
    final List<String> carouselImages = [
      'https://plus.unsplash.com/premium_photo-1661418491136-d6b35479d44f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FycG9vbGluZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
      'https://plus.unsplash.com/premium_photo-1677535563007-d10ba8cb423d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyZ298ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
      'https://plus.unsplash.com/premium_photo-1675670749768-77b94648a6fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dHJhbnNwb3J0fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 218, 156),
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text('TransHub'),
        actions: [
          IconButton(
              onPressed: () {
                moveScreen(context, NotificationScreen());
              },
              icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning, Armaan',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            // Carousel of random internet images with a fade animation
            CarouselSlider.builder(
              itemCount: carouselImages.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: 1.0,
                    child: Image.network(
                      carouselImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
            SizedBox(height: 16.0),
            // Horizontal scrolling feature list with neumorphism design
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFeatureBox(context, 'RideShare', Icons.directions_car,
                        Colors.green, // Change to green manually
                        () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => RidesScreen()));
                    }),
                    _buildFeatureBox(context, 'Public Transport', Icons.train,
                        Colors.green, // Change to green manually
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => AskFromWhereToWhere()));
                    }),
                    _buildFeatureBox(
                        context,
                        'Cargo',
                        Icons.local_shipping,
                        Colors.green, // Change to green manually
                        () {}),
                    _buildFeatureBox(context, 'Hackathon', Icons.code,
                        Colors.green, // Change to green manually
                        () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => HackathonHome()));
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Ride history with alternating colors and neumorphism design
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ride History',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: rideHistory.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ride = rideHistory[index];
                      final color =
                          index % 2 == 0 ? Colors.lightBlue : Colors.lightGreen;
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${ride['rideType']} - ${ride['role']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${ride['description']!}',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Cargo shipment details

            SizedBox(height: 16.0),
            // Additional cargo shipments

            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureBox(BuildContext context, String title, IconData icon,
      Color color, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: 100.0,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32.0,
                color: Colors.white,
              ),
              SizedBox(height: 4.0),
              Text(
                title,
                style: TextStyle(fontSize: 12.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
