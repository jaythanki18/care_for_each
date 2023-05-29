import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'package:sizer/sizer.dart';

class CareForEach extends StatefulWidget {
  const CareForEach({Key? key}) : super(key: key);

  @override
  State<CareForEach> createState() => _CareForEachState();
}

class _CareForEachState extends State<CareForEach> {
  @override
  Widget build(BuildContext context) {
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
          "Care For Each",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
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
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(62, 86, 115, 0.2),
                  Color.fromRGBO(184, 184, 184, 0.1)
                ]),
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              width: 79.74.w,
              height: 24.76.h,
              margin: EdgeInsets.only(left: 36,right: 30),
              child: InkWell(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesDetail()));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12,top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0,top: 13,bottom: 21),
                            child: Image.asset("assets/img_4.png",height: 11.25.h,width: 20.51.w,),
                          ),
                          SizedBox(width: 1.5.h,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name : Abc",
                                  style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),
                                      fontWeight: FontWeight.bold,fontSize: 9.09.sp),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "Subject : Payment",
                                  style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),
                                      fontWeight: FontWeight.bold,fontSize: 9.09.sp),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10,),
                                Text("Description :  XYZ",style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontWeight: FontWeight.bold,fontSize: 9.09.sp),),
                                SizedBox(height: 10,),
                                Text("Date : 01-03-2023",style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontWeight: FontWeight.bold,fontSize: 9.09.sp),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Subject : xyzxyz", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp,fontWeight: FontWeight.bold,),
                          ),
                          Text("Product : Jkljkljkl", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp,fontWeight: FontWeight.bold,),
                          ),
                          Text("Detail : abcabcabcabcabc", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp,fontWeight: FontWeight.bold,),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(62, 86, 115, 0.2),
                  Color.fromRGBO(184, 184, 184, 0.1)
                ]),
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              width: 79.74.w,
              height: 24.76.h,
              margin: EdgeInsets.only(left: 36,right: 30),
              child: InkWell(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesDetail()));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12,top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0,top: 13,bottom: 21),
                            child: Image.asset("assets/img_4.png",height: 11.25.h,width: 20.51.w,),
                          ),
                          SizedBox(width: 1.5.h,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name : Abc",
                                  style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),
                                      fontWeight: FontWeight.bold,fontSize: 9.09.sp),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "Subject : Payment",
                                  style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),
                                      fontWeight: FontWeight.bold,fontSize: 9.09.sp),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10,),
                                Text("Description :  XYZ",style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontWeight: FontWeight.bold,fontSize: 9.09.sp),),
                                SizedBox(height: 10,),
                                Text("Date : 01-03-2023",style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontWeight: FontWeight.bold,fontSize: 9.09.sp),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Subject : xyzxyz", style: TextStyle(
                            color: Color.fromRGBO(12, 25, 71, 1),
                            fontSize: 9.09.sp,fontWeight: FontWeight.bold,),
                          ),
                          Text("Product : Jkljkljkl", style: TextStyle(
                            color: Color.fromRGBO(12, 25, 71, 1),
                            fontSize: 9.09.sp,fontWeight: FontWeight.bold,),
                          ),
                          Text("Detail : abcabcabcabcabc", style: TextStyle(
                            color: Color.fromRGBO(12, 25, 71, 1),
                            fontSize: 9.09.sp,fontWeight: FontWeight.bold,),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
