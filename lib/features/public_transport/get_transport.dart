import 'dart:convert';
import 'dart:core';

import 'package:ecoride/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    }),
  );
  print(res.body);

  // Parse the JSON response
  final Map<String, dynamic> responseMap = json.decode(res.body);

  // Access the "choices" array
  final List<dynamic> choices = responseMap["choices"];

  // Extract the content from the first choice
  if (choices.isNotEmpty) {
    final Map<String, dynamic> firstChoice = choices[0];
    final String content = firstChoice["message"]["content"];
    return content;
  } else {
    return ""; // Handle the case when there are no choices
  }
}

class GetTransport extends StatefulWidget {
  String? startLocation;
  String? endLocation;
  GetTransport({super.key, this.startLocation, this.endLocation});

  @override
  State<GetTransport> createState() => _GetTransportState();
}

class _GetTransportState extends State<GetTransport> {
  String msg = "";

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  void getData() async {
    msg = await useChatAPI(
        "Give me public transport route between ${widget.startLocation} to ${widget.endLocation} you can include autricshaw, cycle, walking, train , bus , metro etc and also add some emojis ");
    print('response = $msg');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "The Overview: ",
                style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                msg,
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
