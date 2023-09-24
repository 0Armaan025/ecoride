import 'package:ecoride/constants/constants.dart';
import 'package:ecoride/features/admin/admin_screen.dart';
import 'package:ecoride/features/auth/loginScreen.dart';
import 'package:ecoride/features/home/screens/feature_screen.dart';
import 'package:ecoride/features/home/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
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
      // home: HomeScreen(),
      home: FirebaseAuth.instance.currentUser == null
          ? loginScreen()
          : HomeScreenNavigator(),
      // home: HomeScreenNavigator(),
    );
  }
}
