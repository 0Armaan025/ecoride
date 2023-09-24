import 'dart:convert';
import 'dart:core';

import 'package:ecoride/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> useChatAPI(String prompt) async {
  print(prompt);
  final res = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${openAIApi}"
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": "$prompt"}
        ],
        "temperature": 0.7
      }));
  print(res.body);

  return res.body;
}

class GetTransport extends StatefulWidget {
  String? startLocation;
  String? endLocation;
  GetTransport({super.key, this.startLocation, this.endLocation});

  @override
  State<GetTransport> createState() => _GetTransportState();
}

class _GetTransportState extends State<GetTransport> {
  Map<String, dynamic>? data;
  bool loaded = false;
  void startSearching() async {
    String body = await useChatAPI(
        "Give me public transport route between ${widget.startLocation} to ${widget.endLocation} you can include autricshaw, cycle, walking, train , bus , metro etc .");
    print(jsonEncode(data));
    setState(() {
      loaded = true;
      data = jsonDecode(body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startSearching();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loaded
          ? SingleChildScrollView(
              child: Column(children: [
                Text(
                  "This is your way 🚶🏻‍♂️",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(data!["choices"][0]["message"]["content"]),
              ]),
            )
          : Center(
              child: Text(
                "Please wait!! ⏳\nFinding Best Way",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
