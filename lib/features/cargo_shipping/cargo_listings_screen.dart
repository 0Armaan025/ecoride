import 'package:ecoride/features/cargo_shipping/screens/add_cargo_screen.dart';
import 'package:ecoride/utils/utils.dart';
import 'package:flutter/material.dart';

import '../rideshare/screens/vehicle_pooling/vehicle_pooler_screen.dart';

class CargoListingsScreen extends StatefulWidget {
  @override
  _CargoListingsScreenState createState() => _CargoListingsScreenState();
}

class _CargoListingsScreenState extends State<CargoListingsScreen> {
  final List<String> cargoListings =
      List.generate(2, (index) => 'Cargo Listing $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              moveScreen(context, AddCargoScreen());
            }),
      ),
      appBar: AppBar(
        title: Text("Cargo Listings"),
      ),
      body: ListView.builder(
        itemCount: cargoListings.length,
        itemBuilder: (context, index) {
          final cargoListing = cargoListings[index];
          return AnimatedCargoCard(
            cargoListing: cargoListing,
            delay: index * 0.1,
          );
        },
      ),
    );
  }
}

class AnimatedCargoCard extends StatefulWidget {
  final String cargoListing;
  final double delay;

  AnimatedCargoCard({required this.cargoListing, required this.delay});

  @override
  _AnimatedCargoCardState createState() => _AnimatedCargoCardState();
}

class _AnimatedCargoCardState extends State<AnimatedCargoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(widget.delay, 1.0, curve: Curves.easeOut),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the cargo details screen on card tap
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                CargoDetailsScreen(cargoListing: widget.cargoListing),
          ),
        );
      },
      child: Hero(
        tag: 'cargoListing_${widget.cargoListing}', // Unique hero tag
        child: AnimatedBuilder(
          animation: _opacity,
          builder: (context, child) {
            return Opacity(
              opacity: _opacity.value,
              child: Transform.translate(
                offset: Offset(0.0, 50.0 * (1 - _opacity.value)),
                child: CargoCard(cargoListing: widget.cargoListing),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CargoCard extends StatelessWidget {
  final String cargoListing;

  CargoCard({required this.cargoListing});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cargoListing,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Origin: New York",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Destination: Los Angeles",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Cargo max Weight: 500 kg",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle button tap
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CargoDetailsScreen(cargoListing: cargoListing),
                  ),
                );
              },
              child: Text("View Details"),
            ),
          ],
        ),
      ),
    );
  }
}

class CargoDetailsScreen extends StatelessWidget {
  final String cargoListing;

  CargoDetailsScreen({required this.cargoListing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cargo Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Hero(
            tag:
                'cargoListing_${cargoListing}', // Use the same hero tag as in CargoListingsScreen
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      cargoListing,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Divider(
                      color: Colors.black,
                      thickness: 2.0,
                    ),
                    SizedBox(height: 16.0),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(
                        "Origin",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "New York",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(
                        "Destination",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Los Angeles",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.local_shipping),
                      title: Text(
                        "Cargo Max Weight",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "500 kg",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //make a button in flutter that says book
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the vehicle pooler screen
                      },
                      child: Text("Have a chat ☕"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
