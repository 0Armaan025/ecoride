import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final TextEditingController shipperEmailControler = TextEditingController();
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController cargoDescriptionController =
      TextEditingController();
  final TextEditingController cargoWeightController = TextEditingController();
  bool professionalismChecked = false;
  String consentLetter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Cargo Details"),
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
              TextFormField(
                controller: cargoWeightController,
                decoration: InputDecoration(labelText: "Cargo Weight (in kg)"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Cargo Weight is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: shipperEmailControler,
                decoration: InputDecoration(labelText: "Shipper email"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'the shipper email is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: professionalismChecked,
                    onChanged: (value) {
                      setState(() {
                        professionalismChecked = value!;
                      });
                    },
                  ),
                  Text("Professionalism Check"),
                ],
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
                onTap: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    // Handle the picked image file here
                    File imageFile = File(pickedFile.path);

                    // You can save the `imageFile` and use it as needed
                  }
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
