import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController vehicleController = TextEditingController();
  TextEditingController totalPeople = TextEditingController();
  TextEditingController destination = TextEditingController();
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
      backgroundColor: const Color.fromARGB(255, 154, 218, 156),
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
            TextFormField(
              controller: destination,
              decoration: InputDecoration(
                labelText: "Destination",
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
              controller: totalPeople,
              decoration: InputDecoration(
                labelText: "Total number of people who can sit",
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
              controller: vehicleController,
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
                bool maskRequired = isMaskRequired;
                String vehicle = vehicleController.text;
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                Reference ref =
                    FirebaseStorage.instance.ref("rideImage/${id}.png");
                await ref.putFile(selectedImage!);
                String downloadURL = await ref.getDownloadURL();
                // Use the selectedImage file for uploading the image
                // and handle other form data as needed
                FirebaseFirestore.instance.collection("Rides").doc(id).set({
                  "name": name,
                  "description": description,
                  "carModel": vehicle,
                  "maxPeople": totalPeople.text,
                  "maskRequired": maskRequired,
                  "image": downloadURL,
                  "ID": id,
                  "publishedBy": FirebaseAuth.instance.currentUser!.uid,
                  "destination": destination.text,
                }).then((value) {
                  nameController.clear();
                  descriptionController.clear();
                  isMaskRequired = false;
                  setState(() {
                    selectedImage = null;
                  });

                  vehicleController.clear();
                  Navigator.pop(context);
                });
              },
              // Reset form fields and selectedImage if needed
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
