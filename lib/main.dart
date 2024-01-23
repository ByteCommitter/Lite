//This version is so that the user neednt unnecessarily login again and again
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydlite/config/router.dart';
import 'package:hydlite/firebase_options.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydlite/pages/MainScreen/base_widget.dart';
import 'package:hydlite/pages/auth/signup_page.dart';

void main() async {
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
    return GetMaterialApp(
      title: 'Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.uid == null) {
              return SignupPage(); // Show login page
            } else {
              return BaseScreen(); // Show home page
            }
          }
          return CircularProgressIndicator(); // Show loading indicator while waiting for auth state to change
        },
      ),
      getPages: PageRoutes().pages, 
    );
  }
}

class HomePage {
}
//An earlier WOrking version:
/*import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydlite/config/router.dart';
import 'package:hydlite/firebase_options.dart';
import 'package:get/get.dart';


void main() async {
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
    return GetMaterialApp(
      title: 'Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Set the initial route
      getPages: PageRoutes().pages, 
      //routes: {
    //'/login': (context) => LoginPage(), // Define other routes if needed.
      //},
    );
  }
}

*/