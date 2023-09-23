import 'package:ecoride/common/pool_vehicle_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehiclePoolerScreen extends StatefulWidget {
  const VehiclePoolerScreen({super.key});

  @override
  State<VehiclePoolerScreen> createState() => _VehiclePoolerScreenState();
}

class _VehiclePoolerScreenState extends State<VehiclePoolerScreen> {
  String selectedVehicle = "Car"; // Default vehicle selection
  double selectedSpeed = 60.0; // Default speed in km/h
  String destination = ""; // Destination input

  final List<String> vehicleOptions = ["Car", "Bike", "Rickshaw"];
  final List<double> speedOptions = [20.0, 40.0, 60.0, 80.0, 100.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Hey Armaan, 👋🏻",
                style: GoogleFonts.roboto(
                  color: Colors.purple,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Would you like to\npool your vehicle?",
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: vehicleOptions.map((String vehicle) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedVehicle = vehicle;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: selectedVehicle == vehicle
                            ? Colors.blue
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        vehicle,
                        style: TextStyle(
                          color: selectedVehicle == vehicle
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: speedOptions.map((double speed) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSpeed = speed;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selectedSpeed == speed ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        speed.toStringAsFixed(0),
                        style: TextStyle(
                          color: selectedSpeed == speed
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Slider(
                value: selectedSpeed,
                min: 0,
                max: 120,
                divisions: 120,
                onChanged: (double newValue) {
                  setState(() {
                    selectedSpeed = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      destination = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "or book a ride",
                  style: GoogleFonts.roboto(
                    color: Colors.blue.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
              ),
              const SizedBox(
                height: 20,
              ),
              PoolVehicleButton(onPressed: () {}),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
