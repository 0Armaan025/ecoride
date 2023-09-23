import 'package:ecoride/features/cargo_shipping/screens/add_cargo_screen.dart';
import 'package:ecoride/features/rideshare/screens/vehicle_pooling/add_ride_screen.dart';
import 'package:ecoride/features/rideshare/screens/vehicle_pooling/home_screen.dart';
import 'package:ecoride/features/rideshare/screens/vehicle_pooling/vehicle_pooler_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddShipmentScreen(),
    );
  }
}
