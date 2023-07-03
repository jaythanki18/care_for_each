import 'dart:async';

import 'package:care_for_each/company_side/company_dashboard.dart';
import 'package:care_for_each/company_side/company_login.dart';
import 'package:flutter/material.dart';
import '../firebase_services/splash_services.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();

}
var finalEmail;
class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    // getValidationData().whenComplete(() async{
    //   Timer(Duration(seconds: 3), () {
    //     Get.to(finalEmail==null ? CompanyLogin() : CompanyDashboard(c_email: finalEmail));
    //   });
    // });
    super.initState();

   splashScreen.isLogin(context);
  }
  Future getValidationData() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtainedEmail=sharedPreferences.getString('c_email');
    setState(() {
      finalEmail=obtainedEmail!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
