import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;
  final int hackathonsAttended;
  final int vehiclesPooled;
  final int timesBeenCargoShipper;
  final double stars;

  ProfileScreen({
    required this.name,
    required this.email,
    required this.hackathonsAttended,
    required this.vehiclesPooled,
    required this.timesBeenCargoShipper,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: Colors.green[700],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.green[800],
                image: DecorationImage(
                  image: NetworkImage(
                    'https://source.unsplash.com/random',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.event_note,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Hackathons Attended',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '$hackathonsAttended',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.car_rental,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Vehicles Pooled',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '$vehiclesPooled',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.car_crash,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Times Been a Cargo Shipper',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '$timesBeenCargoShipper',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Stars',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: RatingBarIndicator(
                      rating: stars,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 24.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
