import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../methods/pickImage.dart';

class CreateNewHackathon extends StatefulWidget {
  const CreateNewHackathon({Key? key}) : super(key: key);

  @override
  State<CreateNewHackathon> createState() => _CreateNewHackathonState();
}

class _CreateNewHackathonState extends State<CreateNewHackathon> {
  File? image;
  TextEditingController hackNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  Map<String, String> prizes = {};
  DateTime? startDate;
  DateTime? endDate;
  bool hasPrizes = false;

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
        backgroundColor: Colors.green[700],
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
                  color: Colors.green[700],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: _buildImagePreview(),
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: hackNameController,
              label: "Hackathon Name",
            ),
            SizedBox(height: 20),
            _buildDatePickers(),
            SizedBox(height: 20),
            _buildTextField(
              controller: descController,
              label: "Description",
              maxLines: null,
              maxLength: 4000,
            ),
            SizedBox(height: 20),
            _buildPrizesSection(),
            SizedBox(height: 20),
            _buildSubmitButton(),
          ],
        ),
      ),
      backgroundColor: Colors.green[100],
    );
  }

  Widget _buildImagePreview() {
    return image == null
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
          );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int? maxLines,
    int? maxLength,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildDatePickers() {
    return Row(
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
              onTap: _pickStartDate,
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
              onTap: _pickEndDate,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrizesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Are you offering prizes?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.green[700],
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              value: hasPrizes,
              onChanged: (bool? value) {
                setState(() {
                  hasPrizes = value!;
                });
              },
            )
          ],
        ),
        if (hasPrizes)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Prizes:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 10),
              _buildPrizesList(),
              ElevatedButton(
                onPressed: _addPrize,
                child: Text("Add Prize"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[700],
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildPrizesList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: prizes.length,
      itemBuilder: (context, index) {
        TextEditingController textEditingController = TextEditingController();
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
                    borderRadius: BorderRadius.all(Radius.circular(8)),
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
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submitHackathon,
      child: Text(
        "Submit",
        style: GoogleFonts.poppins(
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.green[700],
      ),
    );
  }

  Future<void> _pickImage() async {
    final tempImage = await pickImge();
    setState(() {
      image = tempImage;
    });
  }

  Future<void> _pickStartDate() async {
    startDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (startDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(startDate!);
      startDateController.text = formattedDate;
    }
  }

  Future<void> _pickEndDate() async {
    endDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (endDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(endDate!);
      endDateController.text = formattedDate;
    }
  }

  void _addPrize() {
    TextEditingController titleController = TextEditingController();
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
  }

  Future<void> _submitHackathon() async {
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
        "hasPrizes": hasPrizes,
        "prizes": prizes,
      },
    );
    Navigator.pop(context);
  }
}

