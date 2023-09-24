import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoride/features/hackathon/create_hacathon.dart';
import 'package:ecoride/features/hackathon/hackathon_detail.dart';
import 'package:ecoride/models/hackathon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HackathonHome extends StatefulWidget {
  const HackathonHome({super.key});

  @override
  State<HackathonHome> createState() => _HackathonHomeState();
}

class _HackathonHomeState extends State<HackathonHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Eco Hacky",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => CreateHackathon()));
              },
              child: Text("Create hackathon")),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("hackathons").snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Hackathon hackathon = Hackathon.fromMap(
                        snapshot.data!.docs[index].data()
                            as Map<String, dynamic>);
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => HackathonDetail(
                                        hackathon: hackathon,
                                      )));
                        },
                        child: Column(
                          children: [
                            Image.network(
                              hackathon.image,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              hackathon.hackName,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                      ),
                    );
                  },
                )
              : Container();
        },
      ),
    );
  }
}
