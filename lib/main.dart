import 'package:care_for_each/ui/attendance.dart';
import 'package:care_for_each/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';

// Future<void>
  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await Firebase.initializeApp(
    //options: FirebaseOptions(
    // apiKey: "AIzaSyATkHlCWL_jZfdUJfNvXz3sQswQPEuY7no",
    // appId: "1:669333318828:web:470e8d2684b03f79f58309",
    // messagingSenderId: "669333318828",
    // projectId: "care-for-each-chat",
  //)
    //);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType){
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: Colors.teal,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: SplashScreen(),
        routes: {
          '/attendance': (context) => AttendanceScreen(),
        },
      );
    });
  }
}
