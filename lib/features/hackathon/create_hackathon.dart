import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoride/methods/pickImage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  bool hasprices = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            image == null
                ? InkWell(
                    onTap: () async {
                      final tempImage = await pickImge();
                      setState(() {
                        image = tempImage;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all()),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                          child: Icon(
                        Icons.image,
                        size: 50,
                      )),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                    child: Image.file(
                      image!,
                      fit: BoxFit.fill,
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: hackNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: "Enter the name of hackathon",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Start Date'),
                    subtitle: TextFormField(
                      readOnly: true,
                      controller: startDateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '  Start Date',
                      ),
                      onTap: () async {
                        startDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100));
                        String formattedDate = DateFormat('yyyy-MM-dd').format(
                            startDate!); // format date in required form here we use yyyy-MM-dd that means time is removed
                        setState(() {
                          startDateController.text =
                              formattedDate; //set foratted date to TextField value.
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('End Date'),
                    subtitle: TextFormField(
                      readOnly: true,
                      controller: endDateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '  End Date',
                      ),
                      onTap: () async {
                        endDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100));
                        String formattedDate = DateFormat('yyyy-MM-dd').format(
                            endDate!); // format date in required form here we use yyyy-MM-dd that means time is removed
                        setState(() {
                          endDateController.text =
                              formattedDate; //set foratted date to TextField value.
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 4000,
              maxLines: null,
              controller: descController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: 'Enter description',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Are you giving prizes?",
                  style: TextStyle(fontSize: 20),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  value: hasprices,
                  onChanged: (bool? value) {
                    setState(() {
                      hasprices = value!;
                    });
                  },
                )
              ],
            ),
            if (hasprices)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Prizes are",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: prizes.length,
                    itemBuilder: (context, index) {
                      TextEditingController textEditingController =
                          TextEditingController();
                      String key = prizes.keys.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              key,
                              style: TextStyle(fontSize: 20),
                            )),
                            Expanded(
                              child: ListTile(
                                title: TextField(
                                  controller: textEditingController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    hintText: "enter prize",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      TextEditingController titleController =
                          TextEditingController();
                      showDialog(
                          context: context,
                          builder: (c) => AlertDialog(
                                title: TextField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Enter the name of prize ex. 1st place"),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.red),
                                      )),
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
                                      ))
                                ],
                              ));
                    },
                    child: Text("Add Some Prizes"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Reference ref = FirebaseStorage.instance.ref(
                          "hackyImage/${DateTime.now().millisecondsSinceEpoch}.png");
                      await ref.putFile(image!);
                      String downloadURL = await ref.getDownloadURL();
                      FirebaseFirestore.instance
                          .collection("hackathons")
                          .doc(DateTime.now().microsecondsSinceEpoch.toString())
                          .set({
                        "hackName": hackNameController.text,
                        "startDate": startDateController,
                        "endDate": endDateController,
                        "image": downloadURL,
                        "description": descController,
                        "hasPrizes": hasprices,
                        "prizes": prizes,
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              )
            else
              Container(),
          ]),
        ),
      ),
    );
  }
}
