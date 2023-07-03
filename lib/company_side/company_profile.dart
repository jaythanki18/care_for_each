import 'dart:convert';
import 'package:care_for_each/chat/chat_login.dart';
import 'package:care_for_each/company_side/attendance.dart';
import 'package:care_for_each/company_side/category.dart';
import 'package:care_for_each/company_side/company_dashboard.dart';
import 'package:care_for_each/company_side/complaint.dart';
import 'package:care_for_each/company_side/employee.dart';
import 'package:care_for_each/company_side/leave_detail.dart';
import 'package:care_for_each/company_side/order.dart';
import 'package:care_for_each/company_side/products.dart';
import 'package:care_for_each/company_side/profile_detail.dart';
import 'package:care_for_each/company_side/report.dart';
import 'package:care_for_each/company_side/sub_category.dart';
import 'package:care_for_each/company_side/visitor.dart';
import 'package:care_for_each/ui/dashboard.dart';
import 'package:care_for_each/ui/ginnie_box.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:care_for_each/Models/CompanyProfileModel.dart';
import 'company_login.dart';
import '../API/CompanyProfileAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({Key? key, required this.c_emailid}) : super(key: key);
  final String c_emailid;
 // const CompanyProfile({super.key,required this.emailid});
  //  const OTP({super.key, required this.phone});
  // final String emailid;
  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

String email=email;
class _CompanyProfileState extends State<CompanyProfile> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          "Profile",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () async{
                SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
                sharedPreferences.clear();
                sharedPreferences.remove('c_email');
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyLogin()));
              },
              icon: Icon(Icons.logout),

              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.teal,
        shadowColor: Colors.teal,
      ),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetail(c_emailid: widget.c_emailid,)));
              },
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        height: 26.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/Ellipse 5 (2).png")),
                        ),
                        child: FutureBuilder<CompanyProfileModel>(
                          future: CompanyProfileApi().profileList(widget.c_emailid),//aya login kru to email login kari eno levo che
                          builder: (BuildContext context, snapshot){
                            if(snapshot.connectionState==ConnectionState.waiting){
                              return Center(child: CircularProgressIndicator());
                            }
                            else if (snapshot.hasData){
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 12.5.h,width: 30.77.w,
                                          child: CircleAvatar(
                                            child: Container(
                                                height: 12.5.h,width: 30.77.w,
                                                child: CircleAvatar(
                                                  child:  Image.network(
                                                    snapshot.data!.server![0].cPhoto.toString(),
                                                  ),
                                                  backgroundColor: Colors.white,
                                                )
                                            ),
                                          ),
                                        )
                                        // child: Text( snapshot.data!.server![0].cPhoto.toString(),style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                                        // ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        snapshot.data!.server![0].cname.toString(),
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
                                    ],
                                  ),
                                );

                            }
                            else{
                              return Text("No data");
                            }
                          },

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/dashboard.png'),
                  ),
                  SizedBox(
                      width: 25.w
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Dashboard(e_emailid: widget.c_emailid)));
                      },
                      child: Text("Dashboard",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 23.0,vertical: 4),
                    child: Image.asset('assets/order.png'),
                  ),
                  SizedBox(
                    width: 18.w
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Order(c_emailid: widget.c_emailid,)));
                        //  Navigator.pushNamed(context, '/attendance');
                      },
                      child: Text("Order",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/calender.png'),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Attendance(c_emailid: widget.c_emailid,)));
                        //  Navigator.pushNamed(context, '/attendance');
                      },
                      child: Text("Attendance",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/employee.png'),
                  ),
                  SizedBox(
                      width: 15.w
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Employee(c_emailid: widget.c_emailid,)));
                        //  Navigator.pushNamed(context, '/attendance');
                      },
                      child: Text("Employee",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/ginnie_box.png'),
                  ),
                  SizedBox(
                    width: 20.w
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>GinnieBox()));
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
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
              height: 0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/visitor.png'),
                  ),
                  SizedBox(
                    width: 20.w
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>CompanyVisitor(c_emailid: widget.c_emailid,)));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor()));
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
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/product.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Products(c_emailid: widget.c_emailid,)));
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                      },
                      child: Text("Products",
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
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/leave_request.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>LeaveDetail1(c_emailid: widget.c_emailid,)));
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveRequest()));
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
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/category.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Category(c_emailid: widget.c_emailid,)));
                          // Navigator.push(context, MaterialPageRoute(builder: (contexxt)=>Customer()));
                        },
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/sub_category.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>SubCategory(c_emailid: widget.c_emailid,)));
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sales()));
                        },
                        child: Text(
                          "Sub Category",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/messages.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
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
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/complaint.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Complaint(c_emailid: widget.c_emailid,)));
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint()));
                        },
                        child: Text(
                          "Complaint",
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
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/report.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Report(c_email: widget.c_emailid,)));
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint()));
                        },
                        child: Text(
                          "Report",
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
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/contact.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
                        },
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height:  0.5.h,
            ),
            Container(
              decoration: BoxDecoration(
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
              height: 5.h,
              width: 90.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                    child: Image.asset('assets/how_it_works.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
                        },
                        child: Text(
                          "How it works?",
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
      ),

    );
  }
}
