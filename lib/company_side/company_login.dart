import 'dart:convert';
import 'package:care_for_each/company_side/company_dashboard.dart';
import 'package:care_for_each/company_side/company_profile.dart';
import 'package:flutter/material.dart';
import '../../widgets/round_button.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class CompanyLogin extends StatefulWidget {
  const CompanyLogin({Key? key}) : super(key: key);

  @override
  State<CompanyLogin> createState() => _CompanyLoginState();
}

class _CompanyLoginState extends State<CompanyLogin> {
  final formKey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //  signIn(String email,String password) async{
  //   Map server={
  //     'emailid':email,
  //     'pword':password
  //   };
  //   var jsonData=null;
  //   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //   var response=await http.post(Uri.parse("http://www.careforeach.com/new/company/company_api_jay/webservices/company_profile.php"),body: jsonEncode(
  //       {
  //         'emailid':email,
  //         'pword':password
  //       }));
  //   if(response.statusCode==200){
  //     jsonData=jsonDecode(response.body);
  //     print(jsonData);
  //     setState(() {
  //      // _isLoading=false;
  //      // sharedPreferences.setString("token", jsonData['token']);
  //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()), (route) => false);
  //     });
  //   }
  //   else{
  //     print(response.body);
  //   }
  // }

  Future<void> _login() async {
    final url = 'http://www.careforeach.com/new/company/company_api_jay/webservices/company_login.php';
    //final url='http://www.careforeach.com/new/company/company_api_jay/webservices/company_profile.php';
    final data = {
      'emailid': emailController.text,
      'pword': passwordController.text,
    };

    final response = await http.post(Uri.parse(url), body: data);
    final responseData = jsonDecode(response.body);

    // Handle the response as per your requirements
    if(response.statusCode==200){
      print(responseData);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (PassCurrentValue){
                    //    RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        var passNonNullValue=PassCurrentValue??"";
                        if(passNonNullValue.isEmpty){
                          return ("Password is required");
                        }
                        else if(passNonNullValue.length<6){
                          return ("Password Must be more than 5 characters");
                        }
                        // else if(!regex.hasMatch(passNonNullValue)){
                        //   return ("Password should contain upper,lower,digit and Special character ");
                        // }
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
                        _login();

                         //signIn(emailController.text,passwordController.text);

                        const snackBar = SnackBar(
                          content: Text('Submitting Form'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
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
          ),
        ));
  }
}
