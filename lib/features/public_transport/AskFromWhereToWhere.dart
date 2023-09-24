import 'package:ecoride/features/public_transport/get_transport.dart';
import 'package:flutter/material.dart';

class AskFromWhereToWhere extends StatefulWidget {
  const AskFromWhereToWhere({super.key});

  @override
  State<AskFromWhereToWhere> createState() => _AskFromWhereToWhereState();
}

class _AskFromWhereToWhereState extends State<AskFromWhereToWhere> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get the Most Eco Freindly way"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "First tell us something about your trip 🚅",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: fromController,
              decoration: InputDecoration(hintText: "Enter Start Location"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: toController,
              decoration: InputDecoration(hintText: "Enter Destination"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (c) => GetTransport(
                //               startLocation: fromController.text,
                //               endLocation: toController.text,
                //             )));
              },
              child: Text("Let's gooo!!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      )),
    );
  }
}
