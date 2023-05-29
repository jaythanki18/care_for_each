import 'package:care_for_each/company_side/order_details.dart';
import 'package:flutter/material.dart';

import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final items=['All','This Year','This Month','Today'];
  String? selectedItem='All';

  List<String> list2=['ABC','DEF','GHI','JKL','MNO','PQR','STU','VWX','YZ'];
  String? list2item='ABC';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Order",
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
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 9.74.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5.92.h,
                    width: 36.92.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedItem,
                      items: items.map((item) => DropdownMenuItem(
                        value: item,
                          child: Text(item,style: TextStyle(color: Colors.black),),
                      )
                      ).toList(),
                      onChanged: (item)=>setState(()=>selectedItem=item),
                    ),
                  ),
                  SizedBox(width: 1.18.h,),
                  Container(
                    width: 36.92.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: list2item,
                      items: list2.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,style: TextStyle(color: Colors.black,),),
                      )
                      ).toList(),
                      onChanged: (item)=>setState(()=>list2item=item),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.18.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.2.w),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 34.36.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 20.5.w,height: 11.25.h,))),
                        SizedBox(height: 0.59.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Name : abc',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : bvfsbf',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Email : syd@ldsfh.com',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : +918743839834',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Date : 01-03-2023',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.18.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.2.w),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 34.36.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 20.5.w,height: 11.25.h,))),
                        SizedBox(height: 0.59.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Name : abc',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : bvfsbf',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Email : syd@ldsfh.com',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : +918743839834',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Date : 01-03-2023',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.18.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.2.w),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 34.36.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 20.5.w,height: 11.25.h,))),
                        SizedBox(height: 0.59.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Name : abc',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : bvfsbf',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Email : syd@ldsfh.com',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : +918743839834',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Date : 01-03-2023',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}



