import 'package:flutter/material.dart';
import '../firebase_services/splash_services.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 21.32.h,
                width: 46.66.w,
                child: Image(image: AssetImage("assets/img.png")),
              ),
              SizedBox(
                height: 2.37.h,
              ),
              Container(
                height: 5.33.h,
                width: 86.92.w,
                child: Image(image: AssetImage("assets/img_1.png")),
              ),
            ],
          ),
      )
    );
  }
}
