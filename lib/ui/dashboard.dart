import 'package:care_for_each/ui/add_visitor.dart';
import 'package:care_for_each/ui/complaint.dart';
import 'package:care_for_each/ui/customer.dart';
import 'package:care_for_each/ui/leave_request.dart';
import 'package:care_for_each/ui/new_ginnie.dart';
import 'package:care_for_each/ui/product.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/ui/sales.dart';
import 'package:care_for_each/ui/visitor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../chat/chat_login.dart';
import 'cart.dart';
import 'ginnie_box.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.e_emailid}) : super(key: key);
  final String e_emailid;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),fontSize: 15.92.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(9, 31, 87, 1),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
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
                  borderRadius: BorderRadius.circular(2.36.h),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/calender.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){Navigator.pushNamed(context, '/attendance');},
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/product.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(e_emailid: widget.e_emailid,)));
                          },
                        child: Text("Products",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/visitor.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor()));},
                        child: Text("Visitor",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/customer.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Customer()));},
                        child: Text("Customer",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/sales.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Sales()));},
                        child: Text("Sales",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/ginnie_box.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
                          },
                        child: Text("Ginnie Box",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/messages.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));},
                        child: Text("Messages",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/leave_request.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveRequest()));},
                        child: Text("Leave Request",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
                height:11.84.h,
                width:  79.74.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27,top: 21,bottom: 21,right: 36),
                      child: Image.asset('assets/complaint.png'),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint()));},
                        child: Text("Complaint",
                          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
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
