import 'package:ecoride/models/hackathon.dart';
import 'package:flutter/material.dart';

class HackathonDetail extends StatefulWidget {
  Hackathon? hackathon;
  HackathonDetail({super.key, this.hackathon});

  @override
  State<HackathonDetail> createState() => _HackathonDetailState();
}

class _HackathonDetailState extends State<HackathonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.network(
                widget.hackathon!.image,
                fit: BoxFit.fill,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.hackathon!.hackName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${widget.hackathon!.startDate} - ${widget.hackathon!.endDate}",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Text(widget.hackathon!.description),
              SizedBox(
                height: 20,
              ),
              widget.hackathon!.hasPrizes
                  ? Column(
                      children: [
                        Text(
                          "Prizes",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.hackathon!.prizes.length,
                          itemBuilder: (context, index) {
                            String key =
                                widget.hackathon!.prizes.keys.elementAt(index);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    key,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text("${widget.hackathon!.prizes[key]}")
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
