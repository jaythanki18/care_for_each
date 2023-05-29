import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/ui/sales_detail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
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
          "Sales",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
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
                width: 83.07.w,
                height: 37.44.h,
               // margin: EdgeInsets.only(left: 36,right: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesDetail()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.07.w,vertical: 1.89.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/product_photo.png",height: 16.47.h,width: 37.43.w,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                 width: 34.61.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HIGHLANDER",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                          color: Color.fromRGBO(12, 25, 71, 1),
                                          fontWeight: FontWeight.bold,fontSize: 11.37.sp),
                                    ),
                                    SizedBox(height: 1.h,),
                                    Text(
                                      "Men Slim Fit Solid Cut Away Collar Casual Jacket.",
                                      style: TextStyle(
                                          color: Color.fromRGBO(12, 25, 71, 1),
                                          fontWeight: FontWeight.bold,fontSize: 7.58.sp),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 1.18.h,),
                                    Text("Rs. 1000",style: TextStyle(
                                      fontFamily: 'Inter',
                                        color: Color.fromRGBO(12, 25, 71, 1),
                                        fontWeight: FontWeight.bold,fontSize: 11.37.sp),)
                                  ],
                                ),
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
                            Text("Customer Detail : ",style: TextStyle(fontWeight: FontWeight.bold,fontFamily:'Inter',decoration: TextDecoration.underline),),
                            SizedBox(height: 0.71.h,),
                            Text("      Name : joyure", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Order Date : 01-01-2023", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Payment Type : Cash On Delivery", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Total Amount : Rs. 1180", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Pending Amount : Rs. 1180", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                               fontSize: 9.85.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.18.h,),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(62, 86, 115, 0.2),
                    Color.fromRGBO(184, 184, 184, 0.1)
                  ]),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                width: 83.07.w,
                height: 37.44.h,
                // margin: EdgeInsets.only(left: 36,right: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesDetail()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.07.w,vertical: 1.89.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/product_photo.png",height: 16.47.h,width: 37.43.w,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                width: 34.61.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HIGHLANDER",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color.fromRGBO(12, 25, 71, 1),
                                          fontWeight: FontWeight.bold,fontSize: 11.37.sp),
                                    ),
                                    SizedBox(height: 1.h,),
                                    Text(
                                      "Men Slim Fit Solid Cut Away Collar Casual Jacket.",
                                      style: TextStyle(
                                          color: Color.fromRGBO(12, 25, 71, 1),
                                          fontWeight: FontWeight.bold,fontSize: 7.58.sp),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 1.18.h,),
                                    Text("Rs. 1000",style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color.fromRGBO(12, 25, 71, 1),
                                        fontWeight: FontWeight.bold,fontSize: 11.37.sp),)
                                  ],
                                ),
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
                            Text("Customer Detail : ",style: TextStyle(fontWeight: FontWeight.bold,fontFamily:'Inter',decoration: TextDecoration.underline),),
                            SizedBox(height: 0.71.h,),
                            Text("      Name : joyure", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Order Date : 01-01-2023", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Payment Type : Cash On Delivery", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Total Amount : Rs. 1180", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Pending Amount : Rs. 1180", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.18.h,),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(62, 86, 115, 0.2),
                    Color.fromRGBO(184, 184, 184, 0.1)
                  ]),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                width: 83.07.w,
                height: 37.44.h,
                // margin: EdgeInsets.only(left: 36,right: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesDetail()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.07.w,vertical: 1.89.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/product_photo.png",height: 16.47.h,width: 37.43.w,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                width: 34.61.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HIGHLANDER",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color.fromRGBO(12, 25, 71, 1),
                                          fontWeight: FontWeight.bold,fontSize: 11.37.sp),
                                    ),
                                    SizedBox(height: 1.h,),
                                    Text(
                                      "Men Slim Fit Solid Cut Away Collar Casual Jacket.",
                                      style: TextStyle(
                                          color: Color.fromRGBO(12, 25, 71, 1),
                                          fontWeight: FontWeight.bold,fontSize: 7.58.sp),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 1.18.h,),
                                    Text("Rs. 1000",style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color.fromRGBO(12, 25, 71, 1),
                                        fontWeight: FontWeight.bold,fontSize: 11.37.sp),)
                                  ],
                                ),
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
                            Text("Customer Detail : ",style: TextStyle(fontWeight: FontWeight.bold,fontFamily:'Inter',decoration: TextDecoration.underline),),
                            SizedBox(height: 0.71.h,),
                            Text("      Name : joyure", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Order Date : 01-01-2023", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Payment Type : Cash On Delivery", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Total Amount : Rs. 1180", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            ),
                            SizedBox(height: 0.71.h,),
                            Text("      Pending Amount : Rs. 1180", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Inter',
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.85.sp),
                            )
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
      ),
    );
  }
}
