import 'dart:io';

import 'package:care_for_each/company_side/employee_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../ui/add_visitor.dart';
import 'package:sizer/sizer.dart';

class NewEmployee extends StatefulWidget {
  const NewEmployee({Key? key}) : super(key: key);

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _name=TextEditingController();
  TextEditingController _visitors_company=TextEditingController();
  TextEditingController _contact=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _address=TextEditingController();
  TextEditingController _discussion=TextEditingController();
  TextEditingController _userimage=TextEditingController();
  var _image;
  var imagePicker;
  var type;


  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _name.dispose();
    _visitors_company.dispose();
    _contact.dispose();
    _email.dispose();
    _address.dispose();
    _discussion.dispose();
    _userimage.dispose();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(9, 31, 87, 1),
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "New Employee",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [

          IconButton(
              onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      TextFormField(controller: _userimage,);
                      var source = type == ImageSourceType.camera
                          ? ImageSource.camera
                          : ImageSource.gallery;
                      XFile image = await imagePicker.pickImage(
                          source: source,
                          imageQuality: 50,
                          preferredCameraDevice: CameraDevice.front);
                      setState(() {
                        _image = File(image.path);
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.12.w),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: _image != null
                                ? Image.file(
                              _image,
                              width: 28.460.w,
                              height: 15.63.h,
                              fit: BoxFit.fitHeight,
                            )
                                : Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Image.asset("assets/img_4.png")),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload a photo",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 15.92.sp),
                              ),
                              Icon(
                                Icons.cloud_upload,
                                color: Color.fromRGBO(12, 25, 71, 1),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: _name,
                              validator: (value){
                                if(value!.isEmpty || !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value!)){
                                  return 'Enter correct name';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Employee Name",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              controller: _visitors_company,
                              keyboardType: TextInputType.text,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter employee\'s designation';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Employee Designation",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 1.3.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Center(
                                  child: Container(
                                    height: 8.97.w,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Select Date of Birth",
                                              style: TextStyle(
                                                  color: Colors.teal, fontSize: 7.583.sp),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color: Colors.teal,
                                            )
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Container(
                                    height: 8.97.w,
                                    width: 36.92.w,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Select Join Date",
                                              style: TextStyle(
                                                  color: Colors.teal, fontSize: 7.583.sp),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color: Colors.teal,
                                            )
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              controller: _contact,
                              keyboardType: TextInputType.streetAddress,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter correct Address';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Address",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              controller: _email,
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
                                  labelText: "Email Id",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(
                            height: 5.9.h,
                            child: TextFormField(
                              controller: _contact,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty || !RegExp(r"^\+?[0-9]{10}$").hasMatch(value!)) {
                                  return 'Enter correct Number';
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Contact Number",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(
                            height: 5.9.h,
                            child: TextFormField(
                              controller: _discussion,
                              keyboardType: TextInputType.text,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your education';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Education",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 1.3.h,),
                          SizedBox(
                            // width: 79.74.w,
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
                                    fontWeight: FontWeight.bold),
                                floatingLabelStyle: const TextStyle(
                                    height: 4, color: Color.fromARGB(62, 86, 115, 1)),
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                            ),
                          ),
                          SizedBox(height: 0.59.h,),
                          SizedBox(
                            // width: 79.74.w,
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
                                labelText: "Re-Enter Password",
                                suffixIcon: Icon(Icons.visibility_off),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(62, 86, 115, 1),
                                    fontWeight: FontWeight.bold),
                                floatingLabelStyle: const TextStyle(
                                    height: 4, color: Color.fromARGB(62, 86, 115, 1)),
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.36.h),
              Container(
                child: Center(
                  child: Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeProfile()));
                          }
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor(name: _name.text, company: _visitors_company.text, phone: _contact.text, email: _email.text, address: _address.text, discussion: _discussion.text)));

                        },
                        child: Text(
                          "Add Visitor",
                          style: TextStyle(
                            fontSize: 15.16.sp,
                            color: Colors.teal,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shadowColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            ))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
