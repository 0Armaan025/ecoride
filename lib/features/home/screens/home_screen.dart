import 'package:ecoride/features/hackathon/hackathon_home.dart';
import 'package:ecoride/features/public_transport/AskFromWhereToWhere.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MaterialApp(
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
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
      'https://example.com/image3.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('TransHub'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implement notification screen navigation here
            },
          ),
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
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Carousel of random internet images with a fade animation
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: CarouselSlider.builder(
                itemCount: carouselImages.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    width: double.infinity,
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
            ),
            SizedBox(height: 16.0),
            // Horizontal scrolling feature list with neumorphism design
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFeatureBox(context, 'RideShare', Icons.directions_car,
                      Colors.blue, () {}),
                  _buildFeatureBox(
                      context, 'Public Transport', Icons.train, Colors.green,
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => AskFromWhereToWhere()));
                  }),
                  _buildFeatureBox(context, 'Cargo', Icons.local_shipping,
                      Colors.orange, () {}),
                  _buildFeatureBox(context, 'Supply Chain', Icons.business,
                      Colors.purple, () {}),
                  _buildFeatureBox(context, 'Hackathon', Icons.code, Colors.red,
                      () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => HackathonHome()));
                  }),
                ],
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
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: rideHistory.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ride = rideHistory[index];
                      final color = index % 2 == 0
                          ? Colors.lightBlue
                          : Colors.lightGreen; // Alternating colors
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cargo Chain',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipment Status: ${cargoShipments[0]['shipmentStatus']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Current Location: ${cargoShipments[0]['currentLocation']}',
                        ),
                        Text(
                          'Estimated Arrival: ${cargoShipments[0]['estimatedArrival']}',
                        ),
                        Text(
                          'Cargo Type: ${cargoShipments[0]['cargoType']}',
                        ),
                        Text(
                          'Weight: ${cargoShipments[0]['weight']}',
                        ),
                        Text(
                          'Sender: ${cargoShipments[0]['sender']}',
                        ),
                        Text(
                          'Receiver: ${cargoShipments[0]['receiver']}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Additional cargo shipments
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Additional Cargo Shipments',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
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
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // Adjust the number of columns as needed
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cargoShipments.length,
                      itemBuilder: (BuildContext context, int index) {
                        final shipment = cargoShipments[index];
                        return _buildCargoShipmentCard(shipment);
                      },
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

  Widget _buildFeatureBox(BuildContext context, String title, IconData icon,
      Color color, void Function()? onTap) {
    return InkWell(
      onTap: onTap!,
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

  Widget _buildCargoShipmentCard(Map<String, String> shipment) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipment Status: ${shipment['shipmentStatus']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Current Location: ${shipment['currentLocation']}',
          ),
          Text(
            'Estimated Arrival: ${shipment['estimatedArrival']}',
          ),
          Text(
            'Cargo Type: ${shipment['cargoType']}',
          ),
          Text(
            'Weight: ${shipment['weight']}',
          ),
          Text(
            'Sender: ${shipment['sender']}',
          ),
          Text(
            'Receiver: ${shipment['receiver']}',
          ),
        ],
      ),
    );
  }
}
