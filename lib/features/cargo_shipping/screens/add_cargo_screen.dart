import 'package:ecoride/features/cargo_shipping/screens/cargo_approval_screen.dart';
import 'package:ecoride/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: AddCargoScreen(),
  ));
}

class AddCargoScreen extends StatefulWidget {
  @override
  _AddCargoScreenState createState() => _AddCargoScreenState();
}

class _AddCargoScreenState extends State<AddCargoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController shipmentName = TextEditingController();
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController cargoDescriptionController =
      TextEditingController();
  final TextEditingController cargoWeightController = TextEditingController();
  bool professionalismChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Add Cargo and Shipment Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Add Cargo and Shipment Details",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              _buildTextField(
                label: "Shipment/Cargo Name",
                controller: shipmentName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Shipment/Cargo Name is required';
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: "Origin",
                controller: originController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Origin is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                label: "Destination",
                controller: destinationController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Destination is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                label: "Cargo Description",
                controller: cargoDescriptionController,
                maxLines: 3,
              ),
              SizedBox(height: 10),
              _buildTextField(
                label: "Cargo Weight (in kg)",
                controller: cargoWeightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Cargo Weight is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: professionalismChecked,
                    onChanged: (value) {
                      setState(() {
                        professionalismChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "Professionalism Check",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Validate form fields
                  if (_formKey.currentState!.validate()) {
                    moveScreen(context, CargoApprovalScreen());
                  }
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int? maxLines,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
