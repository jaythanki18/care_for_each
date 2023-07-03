import 'package:care_for_each/company_side/collection_report.dart';
import 'package:care_for_each/company_side/complaint_report.dart';
import 'package:care_for_each/company_side/customer_report.dart';
import 'package:care_for_each/company_side/ginnie_box_report.dart';
import 'package:care_for_each/company_side/leave_report.dart';
import 'package:care_for_each/company_side/location_report.dart';
import 'package:care_for_each/company_side/pending_collection_report.dart';
import 'package:care_for_each/company_side/sales_report.dart';
import 'package:care_for_each/company_side/stock_report.dart';
import 'package:care_for_each/company_side/visitor_report.dart';
import 'package:flutter/material.dart';
import '../ui/cart.dart';
import 'attendance_report.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class Report extends StatelessWidget {
  const Report({Key? key, required this.c_email}) : super(key: key);

  final String c_email;
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
          "Report",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //      Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          //   },
          //   icon: Icon(Icons.shopping_cart),
          //   color: Color.fromRGBO(9, 31, 87, 1),
          // ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile(c_emailid: c_email,)));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
                height: 10.h,
                width: 90.w,
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
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceReport(c_email: c_email,)));
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
                height: 10.h,
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
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>VisitorReport(c_email: c_email,)));
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
                height: 10.h,
                width: 90.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/collection.png'),
                    ),
                    SizedBox(
                      width: 0.2 * (width),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>CollectionReport(c_email: c_email,)));
                        },
                        child: Text("Collection",
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
                height: 10.h,
                width: 90.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/stock.png'),
                    ),
                    SizedBox(
                      width: 0.2 * (width),
                    ),
                    Center(
                        child: TextButton(
                          onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>StockReport(c_email: c_email,)));
                          },
                          child: Text(
                            "Stock",
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
                height: 10.h,
                width: 90.w,
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
                          onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintReport(c_email: c_email,)));
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
                height: 10.h,
                width: 90.w,
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
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contexxt)=>SalesReport(c_email: c_email,)));
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
                height: 10.h,
                width: 90.w,
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
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerReport(c_email: c_email,)));
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
                height: 10.h,
                width: 90.w,
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
                          onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBoxReport(c_email: c_email,)));
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
                height: 10.h,
                width: 90.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/pending.png'),
                    ),
                    SizedBox(
                      width: 0.2 * (width),
                    ),
                    Center(
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingCollectionReport(c_email: c_email,)));
                          },
                          child: Text(
                            "Pending Collection",
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
                height: 10.h,
                width: 90.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/location.png'),
                    ),
                    SizedBox(
                      width: 0.2 * (width),
                    ),
                    Center(
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationReport(c_email: c_email,)));
                          },
                          child: Text(
                            "Location",
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
                height: 10.h,
                width: 90.w,
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
                          onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveReport(c_email: c_email,)));
                          },
                          child: Text(
                            "Leave",
                            style: TextStyle(
                                color: Color.fromRGBO(9, 31, 87, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        )
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
