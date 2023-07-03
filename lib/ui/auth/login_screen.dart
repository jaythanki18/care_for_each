import 'dart:convert';

import 'package:care_for_each/API/EmployeeSide/employee_login_API.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:care_for_each/User.dart';
import 'package:care_for_each/company_side/company_login.dart';
import 'package:care_for_each/company_side/new_sub_category.dart';
import 'package:care_for_each/ui/auth/forget_password.dart';
import 'package:flutter/material.dart';
import '../../widgets/round_button.dart';
import '../dashboard.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  TextEditingController email=TextEditingController();
  TextEditingController pword=TextEditingController();
  bool obsecure=true;


  String emailid="";
  String password="";

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

    }

    void storeData()async{
      SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
        sharedPreferences.setString('email', email.text);
    }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    pword.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15.h,),
                  Container(
                    height: 19.19.h,
                    width: 41.02.w,
                    child: Image(image: AssetImage("assets/img.png")),
                  ),
                  SizedBox(
                    height: 2.37.h,
                  ),
                  Container(
                    child: Text(
                      "Employee Log In",
                      style: TextStyle(
                          fontSize: 22.75.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(9, 31, 87, 1)),
                    ),
                  ),
                SizedBox(
                  height: 2.36.h,
                ),
                Container(
                  // width: 77.94.w,
                  // height: 5.92.h,
                  child: TextFormField(
                    controller: email,
                    onChanged: (value){
                      setState(() {
                        emailid=value;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter correct email';
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      labelText: "Email Id",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(62, 86, 115, 1),
                          fontSize: 11.37.sp,
                          fontWeight: FontWeight.bold),
                      floatingLabelStyle: const TextStyle(
                          height: 4, color: Color.fromARGB(62, 86, 115, 1)),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.37.h,
                ),
                Container(
                  // width: 77.94.w,
                  // height: 5.92.h,
                  child: TextFormField(
                    controller: pword,
                    onChanged: (value){
                      setState(() {
                        password=value;
                      });
                    },
                    obscureText: obsecure,
                    keyboardType: TextInputType.text,
                    validator: (PassCurrentValue){

                      var passNonNullValue=PassCurrentValue??"";
                      if(passNonNullValue.isEmpty){
                        return ("Password is required");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      labelText: "Password",
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          Icon(Icons.visibility);
                          obsecure == true ? obsecure=false : obsecure=true;
                        });
                      },
                        icon: Icon(Icons.visibility_off),
                      ),
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(62, 86, 115, 1),
                          fontSize: 11.37.sp,
                          fontWeight: FontWeight.bold),
                      floatingLabelStyle: const TextStyle(
                          height: 4, color: Color.fromARGB(62, 86, 115, 1)),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.37.h,
                ),
                  SizedBox(
                    height: 25.83.h,
                    child: Column(
                      children: [

                      RoundButton(
                      title: "Log In",
                      onTap: () async{
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(e_emailid: email.text.toString(),)));
                        EmployeeLoginModel data =await  EmployeeLoginAPI().login(email.text, pword.text);
                        if(formKey.currentState!.validate() && data.server?[0].success.toString() == email.text){
                          storeData();
                          var snackBar = SnackBar(
                            content: Text("Login successfully!"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(e_emailid: email.text.toString(),)));

                        }

                      },
                    ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword(op: pword.text.toString(),)));
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(color: Colors.grey[400],fontSize: 11.37.sp),
                                ))),
                        Container(
                          width: 77.94.w,
                          height: 5.92.h,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyLogin()));
                              },
                              child: Text(
                                "Company Log In",
                                style: TextStyle(color: Colors.teal),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.teal,
                                  )
                              )
                          ),
                        ),
                      ],
                    ),
                  ),

            ],
        ),
      ),
          ),
    )
    );
  }
}
