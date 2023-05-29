import 'package:flutter/material.dart';

import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class GinnieBoxDetail extends StatefulWidget {
  const GinnieBoxDetail({Key? key}) : super(key: key);

  @override
  State<GinnieBoxDetail> createState() => _GinnieBoxDetailState();
}

class _GinnieBoxDetailState extends State<GinnieBoxDetail> {
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
          "Ginnie Box Detail",
          style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyProfile()));
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
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Text("Customer Detail :",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 15.16.sp,fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Card(
               // margin: EdgeInsets.only(left: 40,right: 40),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 45.26.h,
                  width: 83.07.w,
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
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 23.83.w,height: 14.45.h,))),
                        SizedBox(height: 1.77.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Name : kagku',style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Address : webearl',style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Date : 01-01-2021',style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Email : skjhhfi@gmail.com',style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : 6789012345',style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Expected Date : 03-03-2023 ',style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        Text('Grand Total : ₹ 987978',style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Text("Employee Detail :",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 15.16.sp,fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Card(
                elevation: 4,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 23.22.h,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 20.51.w,height: 11.25.h,))),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Ashok Sindhav',style: TextStyle(fontSize: 10.61.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Python Dev',style: TextStyle(fontSize: 10.61.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Sindhav88@gmail.com',style: TextStyle(fontSize: 10.61.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Text("Product Detail :",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 15.16.sp,fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Card(
               // margin: EdgeInsets.only(left: 40,right: 40),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 410,
                  width: 324,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.05.w,vertical: 1.89.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(child: Image.asset("assets/product_photo.png",width: 24.10.w,height: 10.66.h,)),
                            SizedBox(width: 1.36.h,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : Men Casual Jacket',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Code : iguyr598',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Quantity : 01',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('price : ₹ 1099',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 1.77.h,),
                        Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                        Divider(color: Colors.black,),
                        Row(
                          children: [
                            Container(child: Image.asset("assets/product_photo.png",width: 24.10.w,height: 10.66.h,)),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : Men Casual Jacket',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Code : iguyr598',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Quantity : 01',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('price : ₹ 1099',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 1.77.h,),
                        Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
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