

import 'package:care_for_each/API/EmployeeSide/employee_change_password_API.dart';
import 'package:care_for_each/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/EmployeeSide/EmployeeChangePasswordModel.dart';
import '../../widgets/round_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key, required this.op}) : super(key: key);
  final String op;
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  String? getName;
  String? getCName;
  void getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getName=sharedPreferences.getString("email")!;
      getCName=sharedPreferences.getString("c_email")!;
    });
    print(getName);
    print(getCName);
  }

  final formKey=GlobalKey<FormState>();
  TextEditingController _password1=TextEditingController();
  TextEditingController _password2=TextEditingController();
  String password="";
  String password2="";
  bool obsecure=true;
  bool obsecure2=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
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
                  // width: 77.94.w,
                  // height: 5.92.h,
                  child: TextFormField(
                    controller: _password1,
                    obscureText: obsecure2,
                    onChanged: (value){
                      setState(() {
                        password=value;
                      });
                    },
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter correct password';
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
                      labelText: "Enter new password",
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          Icon(Icons.visibility);
                          obsecure2 == true ? obsecure2=false : obsecure2=true;
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
                Container(
                  // width: 77.94.w,
                  // height: 5.92.h,
                  child: TextFormField(
                    controller: _password2,
                    onChanged: (value){
                      setState(() {
                        password2=value;
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
                      labelText: "Confirm Password",
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
                  height: 2.h,
                ),
                RoundButton(
                  title: "Change Password",
                  onTap: () async{
                    EmployeeChangePasswordModel data = await EmployeeChangePasswordAPI().password(getName, widget.op, _password1.text.toString());
                    if(formKey.currentState!.validate() && _password1.text == _password2.text ){
                      print(_password1.text);
                      var snackBar = SnackBar(
                        content: Text("Login successfully!"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
