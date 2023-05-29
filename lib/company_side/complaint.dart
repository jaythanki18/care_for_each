import 'package:care_for_each/company_side/company_profile.dart';
import 'package:care_for_each/company_side/complaint_detail.dart';
import 'package:care_for_each/ui/care_for_each.dart';
import 'package:care_for_each/ui/new_complaint.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';

import '../ui/cart.dart';
import 'package:sizer/sizer.dart';

class Complaint extends StatefulWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          "Compaint",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(9, 31, 87, 1),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 39,right: 39),
              decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.teal, width: 1.36.h,),
                    top: BorderSide(color: Colors.teal, width: 0.23.h),
                    right:  BorderSide(color: Colors.teal, width: 0.23.h),
                    bottom: BorderSide(color: Colors.teal, width: 0.23.h),
                  )
              ),
              height: 23.69.h,
              width: 79.74.w,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                },
                child: ClipPath(
                  child: Row(
                    children: [
                      Container(
                        child: Container(
                          height: 11.84.h,
                          width: 25.64.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border(
                                  bottom: BorderSide(color: Colors.teal,width: 0.23.h),
                                  top: BorderSide(color: Colors.teal,width: 0.23.h),
                                  left: BorderSide(color: Colors.teal,width: 0.23.h),
                                  right: BorderSide(color: Colors.teal,width: 0.23.h))

                          ),
                          child: Center(child: Text("CD",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 22.79.sp),)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ABC",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Designation : Flutter",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Subject : Payment",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Description :  XYZ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Date : 01-03-2023",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp))
                          ],
                        ),
                      )
                    ],
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
                ),
              ),
            ),
            SizedBox(height: 1.36.h,),
            Container(
              margin: EdgeInsets.only(left: 39,right: 39),
              decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.teal, width: 1.36.h,),
                    top: BorderSide(color: Colors.teal, width: 0.23.h),
                    right:  BorderSide(color: Colors.teal, width: 0.23.h),
                    bottom: BorderSide(color: Colors.teal, width: 0.23.h),
                  )
              ),
              height: 23.69.h,
              width: 79.74.w,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                },
                child: ClipPath(
                  child: Row(
                    children: [
                      Container(
                        child: Container(
                          height: 11.84.h,
                          width: 25.64.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border(
                                  bottom: BorderSide(color: Colors.teal,width: 0.23.h),
                                  top: BorderSide(color: Colors.teal,width: 0.23.h),
                                  left: BorderSide(color: Colors.teal,width: 0.23.h),
                                  right: BorderSide(color: Colors.teal,width: 0.23.h))

                          ),
                          child: Center(child: Text("CD",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 22.79.sp),)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ABC",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Designation : Flutter",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Subject : Payment",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Description :  XYZ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Date : 01-03-2023",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp))
                          ],
                        ),
                      )
                    ],
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
                ),
              ),
            ),
            SizedBox(height: 1.36.h,),
            Container(
              margin: EdgeInsets.only(left: 39,right: 39),
              decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.teal, width: 1.36.h,),
                    top: BorderSide(color: Colors.teal, width: 0.23.h),
                    right:  BorderSide(color: Colors.teal, width: 0.23.h),
                    bottom: BorderSide(color: Colors.teal, width: 0.23.h),
                  )
              ),
              height: 23.69.h,
              width: 79.74.w,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                },
                child: ClipPath(
                  child: Row(
                    children: [
                      Container(
                        child: Container(
                          height: 11.84.h,
                          width: 25.64.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border(
                                  bottom: BorderSide(color: Colors.teal,width: 0.23.h),
                                  top: BorderSide(color: Colors.teal,width: 0.23.h),
                                  left: BorderSide(color: Colors.teal,width: 0.23.h),
                                  right: BorderSide(color: Colors.teal,width: 0.23.h))

                          ),
                          child: Center(child: Text("CD",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 22.79.sp),)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ABC",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Designation : Flutter",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Subject : Payment",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Description :  XYZ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Date : 01-03-2023",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp))
                          ],
                        ),
                      )
                    ],
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
                ),
              ),
            ),
            SizedBox(height: 1.36.h,),
            Container(
              margin: EdgeInsets.only(left: 39,right: 39),
              decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.teal, width: 1.36.h,),
                    top: BorderSide(color: Colors.teal, width: 0.23.h),
                    right:  BorderSide(color: Colors.teal, width: 0.23.h),
                    bottom: BorderSide(color: Colors.teal, width: 0.23.h),
                  )
              ),
              height: 23.69.h,
              width: 79.74.w,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                },
                child: ClipPath(
                  child: Row(
                    children: [
                      Container(
                        child: Container(
                          height: 11.84.h,
                          width: 25.64.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border(
                                  bottom: BorderSide(color: Colors.teal,width: 0.23.h),
                                  top: BorderSide(color: Colors.teal,width: 0.23.h),
                                  left: BorderSide(color: Colors.teal,width: 0.23.h),
                                  right: BorderSide(color: Colors.teal,width: 0.23.h))

                          ),
                          child: Center(child: Text("CD",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 22.79.sp),)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ABC",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Designation : Flutter",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Subject : Payment",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Description :  XYZ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp)),
                            SizedBox(height: 1.36.h,),
                            Text("Date : 01-03-2023",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp))
                          ],
                        ),
                      )
                    ],
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
