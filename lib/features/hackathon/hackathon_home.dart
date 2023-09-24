import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoride/features/hackathon/create_hackathon.dart';
import 'package:ecoride/models/hackathon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HackathonHome extends StatefulWidget {
  const   HackathonHome({Key? key}) : super(key: key);

  @override
  State<HackathonHome> createState() => _HackathonHomeState();
}

class _HackathonHomeState extends State<HackathonHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700], // Green app bar
        title: Text(
          "Eco Hacky",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("hackathons").snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Hackathon hackathon = Hackathon.fromMap(
                      snapshot.data!.docs[index].data() as Map<String, dynamic>,
                    );
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Image.network(
                            hackathon.image,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            hackathon.hackName,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${hackathon.startDate} - ${hackathon.endDate}",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator()); // Show loading indicator
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => CreateNewHackathon()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[700], // Green button
      ),
      backgroundColor: Colors.green[100], // Background color
    );
  }
}
