import 'package:care_for_each/company_side/order_product_details.dart';
import 'package:flutter/material.dart';

import '../widgets/round_button.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
          "Order Details",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 11.02.w),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 33.88.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 20.51.w,height: 11.25.h,))),
                        SizedBox(height: 0.59.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Person Name : abc',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : bvfsbf',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Email : syd@ldsfh.com',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : +918743839834',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Date : 01-03-2023',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Remind Date : 10-03-2023',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Remaining Amount : ₹00',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.08.h,),
              RoundButton(
                title: "Grand Total : ₹ 49309",
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
                },
              ),
              SizedBox(height: 1.41.h,),
              RoundButton(
                title: "Paid Amount : ₹ 49309",
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
                },
              ),
              SizedBox(height: 2.25.h,),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 11.72.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.38.w),
                        child: Text('Employee Details',style: TextStyle(fontSize: 12.89.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1),decoration: TextDecoration.underline),overflow: TextOverflow.ellipsis,maxLines: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.97.w,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name : Himanshu Anand',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            Text('Designation : Web Developer',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Email : hv7460@gmail.com',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.25.h,),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 11.72.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.38.w),
                        child: Text('Payment Detail :',style: TextStyle(fontSize: 12.89.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1),decoration: TextDecoration.underline),overflow: TextOverflow.ellipsis,maxLines: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.97.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date : 05-03-2023',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            Text('Payment type : Cash',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Paid Amount : ₹ 49309',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.59.h,),
              Container(
                width: 79.74.w,
                height: 5.92.h,
                child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderProductDetail()));
                    },
                    child: Text(
                      "View Product",
                      style: TextStyle(color: Colors.teal),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.teal,
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
