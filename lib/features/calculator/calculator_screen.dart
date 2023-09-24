import 'package:flutter/material.dart';

class CarbonFootprintScreen extends StatefulWidget {
  @override
  CalculatorScreen createState() => CalculatorScreen();
}

enum DistanceUnit { km, miles }

class CalculatorScreen extends State<CarbonFootprintScreen> {
  final TextEditingController milesController = TextEditingController();

  DistanceUnit selectedUnit = DistanceUnit.km; // Default to km
  String selectedVehicle = 'Car'; // Default vehicle selection

  final List<String> vehicles = [
    'Car',
    'Bus',
    'Plane',
    'Bike',
    'Train',
    'Walking',
  ];

  double _calculateFootprint() {
    double miles = double.tryParse(milesController.text) ?? 0.0;

    // Conversion factor for km to miles
    double kmToMiles = 0.621371;

    // Placeholder emission factors for each vehicle
    Map<String, double> emissionFactors = {
      'Car': 0.24,
      'Bus': 0.36,
      'Plane': 0.21,
      'Bike': 0.02,
      'Train': 0.12,
      'Walking': 0.0,
    };

    double totalEmissions = miles *
        (selectedUnit == DistanceUnit.km ? 1 : kmToMiles) *
        emissionFactors[selectedVehicle]!;

    return totalEmissions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Footprint Calculator'),
        backgroundColor: Colors.green, // Custom green app bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Calculate Your Carbon Footprint',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Custom green text color
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedUnit = DistanceUnit.km;
                      });
                    },
                    child: Text(
                      'Km',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: selectedUnit == DistanceUnit.km
                          ? Colors.green // Custom green button color
                          : Colors.grey, // Grey button color
                      onPrimary: Colors.white, // White text color
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedUnit = DistanceUnit.miles;
                      });
                    },
                    child: Text(
                      selectedUnit == DistanceUnit.miles ? 'Miles' : "Miles",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: selectedUnit == DistanceUnit.miles
                          ? Colors.green // Custom green button color
                          : Colors.grey, // Grey button color
                      onPrimary: Colors.white, // White text color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Select a Vehicle:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Custom green text color
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedVehicle,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedVehicle = newValue!;
                  });
                },
                items: vehicles.map((String vehicle) {
                  return DropdownMenuItem<String>(
                    value: vehicle,
                    child: Text(vehicle),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              CarbonInputField(
                controller: milesController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double footprint = _calculateFootprint();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Your Carbon Footprint'),
                        content:
                            Text('Your carbon footprint is $footprint kg CO2e'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Calculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarbonInputField extends StatelessWidget {
  final TextEditingController controller;

  CarbonInputField({required this.controller});

  @override
  Widget build(BuildContext context) {
    DistanceUnit selectedUnit = DistanceUnit.km;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Miles',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green, // Custom green text color
            ),
          ),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.green), // Custom green text color
            decoration: InputDecoration(
              hintText:
                  'Enter in ${selectedUnit == DistanceUnit.km ? 'km' : 'miles'}',
              hintStyle:
                  TextStyle(color: Colors.green), // Custom green text color
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green), // Custom green border color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green), // Custom green border color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
