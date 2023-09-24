import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../methods/pickImage.dart';

class CreateHackathon extends StatefulWidget {
  const CreateHackathon({super.key});

  @override
  State<CreateHackathon> createState() => _CreateHackathonState();
}

class _CreateHackathonState extends State<CreateHackathon> {
  File? image;
  TextEditingController hackNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  Map<String, String> prizes = {};
  DateTime? startDate;
  DateTime? endDate;
  bool hasPrices = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Eco-Hacky hackathon',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        backgroundColor: Colors.green[700], // Customize the app bar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                "Create a Transport-Related Hackathon",
                style: GoogleFonts.poppins(
                  color: Colors.green[700], // Customize text color
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final tempImage = await pickImge();
                setState(() {
                  image = tempImage;
                });
              },
              child: image == null
                  ? Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: hackNameController,
              decoration: InputDecoration(
                labelText: "Hackathon Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Start Date'),
                    subtitle: TextFormField(
                      readOnly: true,
                      controller: startDateController,
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      onTap: () async {
                        startDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (startDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(startDate!);
                          startDateController.text = formattedDate;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ListTile(
                    title: Text('End Date'),
                    subtitle: TextFormField(
                      readOnly: true,
                      controller: endDateController,
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      onTap: () async {
                        endDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (endDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(endDate!);
                          endDateController.text = formattedDate;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              maxLength: 4000,
              maxLines: null,
              controller: descController,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Are you offering prizes?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green[700]), // Customize text color
                ),
                Checkbox(
                  checkColor: Colors.white,
                  value: hasPrices,
                  onChanged: (bool? value) {
                    setState(() {
                      hasPrices = value!;
                    });
                  },
                )
              ],
            ),
            if (hasPrices)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prizes:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700], // Customize text color
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: prizes.length,
                    itemBuilder: (context, index) {
                      TextEditingController textEditingController =
                          TextEditingController();
                      String key = prizes.keys.elementAt(index);
                      return Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              key,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                labelText: "Prize",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  prizes.remove(key);
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      TextEditingController titleController =
                          TextEditingController();
                      showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            title: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                labelText: "Prize Name (e.g., 1st Place)",
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    prizes[titleController.text] = "";
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Done",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Add Prize"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[700], // Customize button color
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Reference ref = FirebaseStorage.instance.ref(
                  "hackyImage/${DateTime.now().millisecondsSinceEpoch}.png",
                );
                await ref.putFile(image!);
                String downloadURL = await ref.getDownloadURL();
                FirebaseFirestore.instance
                    .collection("hackathons")
                    .doc(
                      DateTime.now().microsecondsSinceEpoch.toString(),
                    )
                    .set(
                  {
                    "hackName": hackNameController.text,
                    "startDate": startDateController.text,
                    "endDate": endDateController.text,
                    "image": downloadURL,
                    "description": descController.text,
                    "hasPrizes": hasPrices,
                    "prizes": prizes,
                  },
                );
                Navigator.pop(context);
              },
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green[700], // Customize button color
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[100], // Customize the background color
    );
  }
}
