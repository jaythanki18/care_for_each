import 'package:care_for_each/API/EmployeeSide/employee_profile_API.dart';
import 'package:care_for_each/ui/complaint.dart';
import 'package:care_for_each/ui/customer.dart';
import 'package:care_for_each/ui/ginnie_box.dart';
import 'package:care_for_each/ui/leave_request.dart';
import 'package:care_for_each/ui/product.dart';
import 'package:care_for_each/ui/sales.dart';
import 'package:care_for_each/ui/visitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../chat/chat_login.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  String? getEName;
  String? getCName;
  void getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getEName=sharedPreferences.getString("email")!;
      getCName=sharedPreferences.getString('c_email');
    });
    debugPrint(getEName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Profile"),
          // automaticallyImplyLeading: false,
          // shadowColor: Colors.teal,
          // toolbarHeight: 250,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(190),bottomRight: Radius.circular(190))),
          // flexibleSpace: Column(
          //   children: [
          //     Row(
          //       children: [
          //         SizedBox(height: 100,),
          //         Icon(Icons.arrow_back,color: Colors.white),
          //         SizedBox(width: 20,),
          //         Text("Profile",style: TextStyle(color: Colors.white,fontSize: 20),)
          //       ],
          //     ),
          //
          //     CircleAvatar(
          //         child: Text("AS"),
          //       backgroundImage: AssetImage("assets/cart.png"),
          //       radius: 30,
          //     )
          //   ],
          // ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 26.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/Ellipse 5 (2).png")),
                    ),
                    child: Center(
                      child :  FutureBuilder(
                            future: EmployeeProfileAPI().profile(getEName),
                            builder: (BuildContext context, snapshot){
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              else if(snapshot.hasData){
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 12.h,
                                        width: 30.77.w,
                                        child: CircleAvatar(
                                          child:  Image.network(
                                                snapshot.data!.server![0].photo.toString(),
                                              ),
                                        ),
                                      ),
                                      //child: Image.network(snapshot.data!.server![0].photo.toString(),width: 20.51.w,height: 11.25.h,errorBuilder: (context, error, stackTrace) => SizedBox(width: 20.51.w,height: 11.25.h,))
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      snapshot.data!.server![0].ename.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(13, 46, 85, 1)),
                                    ),
                                    Text(
                                      snapshot.data!.server![0].emailid.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(13, 46, 85, 1)),
                                    ),
                                    Text(
                                      snapshot.data!.server![0].designation.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(13, 46, 85, 1)),
                                    )
                                  ],
                                );
                              }
                              else{
                                return Text("No data");
                              }
                            }
                        ),

                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h,),
              Container(
                child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(2, 2)
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/calender.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/attendance');
                              },
                              child: Text(
                                "Attendance",
                                style: TextStyle(
                                    color: Color.fromRGBO(9, 31, 87, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/product.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(e_emailid: getEName!)));
                              },
                              child: Text(
                                "Products",
                                style: TextStyle(
                                    color: Color.fromRGBO(9, 31, 87, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/visitor.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor()));
                                },
                                child: Text(
                                  "Visitor",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/customer.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Customer()));
                                },
                                child: Text(
                                  "Customer",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/sales.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sales()));
                                },
                                child: Text(
                                  "Sales",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/ginnie_box.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
                                },
                                child: Text(
                                  "Ginnie Box",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/messages.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                },
                                child: Text(
                                  "Messages",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/leave_request.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveRequest()));
                                },
                                child: Text(
                                  "Leave",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/complaint.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint()));
                                },
                                child: Text(
                                  "Complaint",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/how_it_works.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "How It Works?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      height: 0.06 * (height),
                      width: 0.9 * (width),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/log_out.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () async{
                                  SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
                                  sharedPreferences.clear();
                                  sharedPreferences.remove('email');
                                  String? email = sharedPreferences.getString('email');
                                  print(email);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),)
            ],
          ),
        ),

    );
  }
}
