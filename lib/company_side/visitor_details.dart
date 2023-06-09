import 'package:care_for_each/widgets/round_button2.dart';
import 'package:flutter/material.dart';

import '../widgets/round_button.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';
class CompanyVisitorDetail extends StatefulWidget {
  const CompanyVisitorDetail({Key? key}) : super(key: key);

  @override
  State<CompanyVisitorDetail> createState() => _CompanyVisitorDetailState();
}

class _CompanyVisitorDetailState extends State<CompanyVisitorDetail> {
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
          "Visitor Detail",
          style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.02.w),
            child: RoundButton2(
              title: "Company Name",
              onTap: () {},
            ),
          ),
          SizedBox(height: 2.48.h,),
          Card(
            margin: EdgeInsets.only(left: 40,right: 40),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
             // height: 34.36.h,
              width: 79.74.h,
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

                    Center(child: Container(child: Image.asset("assets/img_4.png",width: 20.51.w,height: 11.25.h,))),
                    SizedBox(height: 11.37.sp,),
                    //Image.asset("calender.png",width: 0.01*w),
                    Text('Person Name : kagku',style: TextStyle(fontSize: 10.61.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                    Text('Company Address : mygve',style: TextStyle(fontSize: 10.61.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    Text('Email : mjrhg@gmail.com',style: TextStyle(fontSize: 10.61.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                    Text('Contact No : 9898989898',style: TextStyle(fontSize: 10.61.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                    Text('Date : 09-08-2020',style: TextStyle(fontSize: 10.61.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                    Text('Time : 01:30 PM',style: TextStyle(fontSize: 10.61.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                    Text('Discussion : asdfghjkl',style: TextStyle(fontSize: 10.61.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                    //Text('Expected Date :${message}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
