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
                  color: Colors.blue),
            )),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: carModelController,
              decoration: InputDecoration(labelText: "Vehicle Model"),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Mask Required:"),
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
                          child: Text("Upload Car Image"),
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
              decoration: InputDecoration(labelText: "Diseases (if any)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                String name = nameController.text;
                String description = descriptionController.text;
                String carModel = carModelController.text;
                bool maskRequired = isMaskRequired;
                String diseases = diseasesController.text;

                // Use the selectedImage file for uploading the image
                // and handle other form data as needed

                // Reset form fields and selectedImage if needed
                nameController.clear();
                descriptionController.clear();
                carModelController.clear();
                isMaskRequired = false;
                setState(() {
                  selectedImage = null;
                });
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
