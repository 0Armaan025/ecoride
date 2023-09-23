import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AddCargoScreen(),
  ));
}

class AddCargoScreen extends StatefulWidget {
  @override
  _AddCargoScreenState createState() => _AddCargoScreenState();
}

class _AddCargoScreenState extends State<AddCargoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController cargoDescriptionController = TextEditingController();
  String consentLetter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipment Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: originController,
                decoration: InputDecoration(labelText: "Origin"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Origin is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: destinationController,
                decoration: InputDecoration(labelText: "Destination"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Destination is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: cargoDescriptionController,
                decoration: InputDecoration(labelText: "Cargo Description"),
                maxLines: 3,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Validate form fields
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed with submission
                    // You can submit the data to your backend or perform other actions here
                  }
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Implement the logic for uploading a consent letter here
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: consentLetter.isEmpty
                      ? Text(
                          "Upload Consent Letter",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "Consent Letter Uploaded",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
