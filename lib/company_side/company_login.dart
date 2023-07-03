import 'dart:convert';
import 'package:care_for_each/API/CompanyLoginAPI.dart';
import 'package:care_for_each/Models/CompanyLoginModel.dart';
import 'package:care_for_each/company_side/company_dashboard.dart';
import 'package:flutter/material.dart';
import '../../widgets/round_button.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Email{
  static TextEditingController emailController = TextEditingController();
}
class CompanyLogin extends StatefulWidget {
  const CompanyLogin({Key? key}) : super(key: key);

  @override
  State<CompanyLogin> createState() => _CompanyLoginState();
}

class _CompanyLoginState extends State<CompanyLogin> {
  final formKey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  bool obsecure=true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   String email="";
   String password="";

   @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void storeData()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setString('c_email', emailController.text);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                      "Company Log In",
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
                     //width: 77.94.w,
                    // height: 5.92.h,
                    child: TextFormField(
                      onChanged: (value){
                        email=value;
                        setState(() {

                        });
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
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
                      onChanged: (value){
                        password=value;
                        setState(() {

                        });
                      },
                      controller: passwordController,
                      obscureText: obsecure,
                      keyboardType: TextInputType.text,
                      validator: (PassCurrentValue){
                        var passNonNullValue=PassCurrentValue??"";
                        if(passNonNullValue.isEmpty){
                          return ("Password is required");
                        }
                        else if(passNonNullValue.length<6){
                          return ("Password Must be more than 5 characters");
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
                    child:  Column(
                      children: [
                        RoundButton(
                          title: "Log In",
                          onTap: () async{
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard(c_email: emailController.text,)));
                            CompanyLoginModel data=await CompanyLoginAPI().login(emailController.text, passwordController.text);
                            if(formKey.currentState!.validate() && data.server?[0].success.toString() == emailController.text){
                              var snackBar = SnackBar(
                                content: Text("Login successfully!"),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              storeData();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard(c_email: emailController.text,)));
                              debugPrint(emailController.text);
                            }
                            else if(data.server?[0].success.toString() != emailController.text){
                              var snackBar = SnackBar(
                                content: Text(data!.server![0].success.toString()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(color: Colors.grey[400],fontSize: 11.37.sp),
                                ))),
                        Container(
                          width: 77.94.w,
                          height: 5.92.h,
                          child: ElevatedButton(
                              onPressed: () {
                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyLogin()));
                              },
                              child: Text(
                                "Don't have an Account? Sign Up",
                                style: TextStyle(color: Colors.teal),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.teal,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

