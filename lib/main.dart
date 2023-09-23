import 'package:ecoride/common/pool_vehicle_btn.dart';
import 'package:ecoride/features/auth/loginScreen.dart';
import 'package:ecoride/features/cargo_shipping/cargo_listings_screen.dart';
import 'package:ecoride/features/cargo_shipping/screens/add_cargo_screen.dart';
import 'package:ecoride/features/cargo_shipping/screens/cargo_approval_screen.dart';
import 'package:ecoride/features/community/screens/forum_screen.dart';
import 'package:ecoride/features/home/screens/home_screen.dart';
import 'package:ecoride/features/notifications/screens/notification_screen.dart';
import 'package:ecoride/features/public_transport/AskFromWhereToWhere.dart';
import 'package:ecoride/features/rideshare/screens/vehicle_pooling/rides_screen.dart';
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
      home: ForumScreen(),
    );
  }
}
