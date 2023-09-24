import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoride/features/auth/models/ride.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: AddRideScreen(),
  ));
}

class AddRideScreen extends StatefulWidget {
  @override
  _AddRideScreenState createState() => _AddRideScreenState();
}

class _AddRideScreenState extends State<AddRideScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController diseasesController = TextEditingController();

  bool isMaskRequired = false;
  File? selectedImage;

  Future<void> getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Add Ride Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              "Please Add Ride Details,\nYou're amazing! :)",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Mask Required:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Checkbox(
                  value: isMaskRequired,
                  onChanged: (value) {
                    setState(() {
                      isMaskRequired = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  selectedImage == null
                      ? ElevatedButton(
                          onPressed: () {
                            getImageFromGallery();
                          },
                          child: Text("Upload Vehicle Image"),
                        )
                      : Image.file(
                          selectedImage!,
                          height: 150,
                        ),
                  SizedBox(height: 10),
                  Text("Tap the button to select an image from your gallery."),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: diseasesController,
              decoration: InputDecoration(
                labelText: "Vehicle Model",
                labelStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Handle form submission here
                String name = nameController.text;
                String description = descriptionController.text;
                String carModel = carModelController.text;
                bool maskRequired = isMaskRequired;
                String diseases = diseasesController.text;

                nameController.clear();
                descriptionController.clear();
                carModelController.clear();
                isMaskRequired = false;
                setState(() {
                  selectedImage = null;
                });

                //store data to firebase and clear the text fields

                //making a model
                //storing the image
                Reference ref = FirebaseStorage.instance.ref(
                    "vehiclesImage/${DateTime.now().millisecondsSinceEpoch}.png");
                await ref.putFile(selectedImage!);
                String downloadURL = await ref.getDownloadURL();

                // constructing a model
                RideModel model = RideModel(
                    rideName: nameController.text.toLowerCase(),
                    rideDescription: descriptionController.text,
                    rideUploaderUid:
                        FirebaseAuth.instance.currentUser?.uid ?? '',
                    vehicleImage: downloadURL,
                    vehicleModel: carModelController.text,
                    isMaskRequired: maskRequired.toString());

                //storing into firestore

                FirebaseFirestore.instance
                    .collection('rides')
                    .doc(nameController.text.toLowerCase())
                    .set(model.toMap());

                diseasesController.clear();
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
