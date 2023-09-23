import 'package:flutter/material.dart';

class PoolVehicleButton extends StatelessWidget {
  final Function onPressed;

  const PoolVehicleButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
      ),
      child: Text(
        "Pool Vehicle",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
