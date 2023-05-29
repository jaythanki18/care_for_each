import 'package:care_for_each/company_side/company_login.dart';
import 'package:flutter/material.dart';
import '../../widgets/round_button.dart';
import '../dashboard.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: (PassCurrentValue){
                      RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      var passNonNullValue=PassCurrentValue??"";
                      if(passNonNullValue.isEmpty){
                        return ("Password is required");
                      }
                      else if(passNonNullValue.length<6){
                        return ("Password Must be more than 5 characters");
                      }
                      else if(!regex.hasMatch(passNonNullValue)){
                        return ("Password should contain upper,lower,digit and Special character ");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      labelText: "Password",
                      suffixIcon: Icon(Icons.visibility_off),
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
                RoundButton(
                  title: "Log In",
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      // const snackBar = SnackBar(
                      //   content: Text('Submitting Form'),
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
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
          ),
    )
    );
  }
}
