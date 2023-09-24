import 'package:ecoride/features/hackathon/create_hackathon.dart';
import 'package:ecoride/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HackathonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eco Hacky',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700], // Customize the app bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "What is a Hackathon?",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700], // Customize text color
                ),
              ),
              SizedBox(height: 10),
              Text(
                "A hackathon is a collaborative event where individuals, often from diverse backgrounds, come together to brainstorm, design, and develop innovative solutions to specific problems or challenges. It's an opportunity to create and showcase creative ideas and turn them into real-world applications.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[900]), // Customize text color
              ),
              SizedBox(height: 20),
              Text(
                "Transport-Related Problems",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700], // Customize text color
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Transport-related problems encompass a wide range of challenges in the field of transportation and logistics. These issues can include traffic congestion, public transportation inefficiencies, environmental concerns, supply chain optimization, and more. Hackathons focusing on transport aim to address these problems by developing innovative and sustainable solutions.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[900]), // Customize text color
              ),
              SizedBox(height: 20),
              Text(
                "Create a Transport-Related Themed Hackathon",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700], // Customize text color
                ),
              ),
              SizedBox(height: 10),
              Text(
                "To create a transport-related themed hackathon, follow these steps:\n\n1. Define the Problem: Identify a specific transportation problem you want to address, such as reducing traffic congestion or improving public transit.\n\n2. Set Goals: Determine the objectives and goals of your hackathon. What do you want to achieve with the solutions developed?\n\n3. Gather Participants: Invite developers, designers, and transportation enthusiasts to participate. Encourage a diverse group of participants for varied perspectives.\n\n4. Choose a Platform: Decide whether your hackathon will be held in-person or virtually. Choose a platform for collaboration and communication.\n\n5. Plan the Event: Create a schedule, set rules, and plan judging criteria. Ensure you have prizes or incentives for participants.\n\n6. Mentorship and Resources: Offer mentors or resources to help participants during the hackathon.\n\n7. Hack and Innovate: Let participants work on their ideas and solutions. Encourage creativity and teamwork.\n\n8. Present and Judge: Participants present their solutions to judges. Evaluate based on innovation, feasibility, and impact.\n\n9. Reward and Recognition: Announce winners and provide rewards or recognition to outstanding solutions.\n\n10. Follow-Up: Continue to support and promote the implementation of winning solutions.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[900]), // Customize text color
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    moveScreen(context, CreateHackathon());
                  },
                  child: Text(
                    "Create a Transport-Related Themed Hackathon",
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[700], // Customize button color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green[100], // Customize the background color
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HackathonHome(),
  ));
}
