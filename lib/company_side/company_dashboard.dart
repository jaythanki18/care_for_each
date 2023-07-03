import 'package:care_for_each/company_side/attendance.dart';
import 'package:care_for_each/company_side/category.dart';
import 'package:care_for_each/company_side/company_login.dart';
import 'package:care_for_each/company_side/complaint.dart';
import 'package:care_for_each/company_side/employee.dart';
import 'package:care_for_each/company_side/ginnie_box.dart';
import 'package:care_for_each/company_side/order.dart';
import 'package:care_for_each/company_side/products.dart';
import 'package:care_for_each/company_side/report.dart';
import 'package:care_for_each/company_side/sub_category.dart';
import 'package:care_for_each/company_side/visitor.dart';
import 'package:flutter/material.dart';
import '../chat/chat_login.dart';
import 'company_profile.dart';
import 'leave_detail.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CompanyDashboard extends StatefulWidget {
  const CompanyDashboard({Key? key,required this.c_email }) : super(key: key);

  final String c_email;
  @override
  State<CompanyDashboard> createState() => _CompanyDashboardState();
}
String email=email;
class _CompanyDashboardState extends State<CompanyDashboard> {

  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }
  checkLoginStatus() async{
    // sharedPreferences = await SharedPreferences.getInstance();
    // if(sharedPreferences.getString("token")==null){
    //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>CompanyLogin()), (route) => false);
    // }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(9, 31, 87, 1),
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Dashboard",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          // ElevatedButton(onPressed: (){
          //   sharedPreferences.clear();
          //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>CompanyLogin()), (route) => false);
          // }, child: Text("Logout",style: TextStyle(color: Colors.white),)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile(c_emailid: widget.c_email,)));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/order.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          print("email");
                        },
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Order(c_emailid: widget.c_email,)));

                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                            child: Text("Order",
                              style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/calender.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Attendance(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Attendance",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/employee.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Employee(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Employee",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/visitor.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitor(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Visitor",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/ginnie_box.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyGinnieBox(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Ginnie Box",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/product.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Products(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Products",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/leave_request.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail1(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Leave Request",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/category.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Category",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/sub_category.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCategory(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Sub Category",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/messages.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Messages",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/complaint.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint(c_emailid: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Complaint",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.59.h,
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
                height: 11.8.h,
                width: 79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6.6.w,vertical: 2.48.h),
                      child: Image.asset('assets/report.png',height: 14.87.h,width: 14.87.w,),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Report(c_email: widget.c_email,)));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.56.w),
                          child: Text("Report",
                            style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
