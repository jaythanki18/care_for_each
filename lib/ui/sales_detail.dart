import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/ui/view_product.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SalesDetail extends StatefulWidget {
  const SalesDetail({Key? key}) : super(key: key);

  @override
  State<SalesDetail> createState() => _SalesDetailState();
}

class _SalesDetailState extends State<SalesDetail> {
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
          "Sales Detail",
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
                height: 42.29.h,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/product_photo.png",height:19.78.h,width: 37.43.w,),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Customer Name : ABCDEFG",
                                    style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 1.30.h,
                                  ),
                                  Text(
                                    "Company Name : XYZXYZ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 1.30.h,
                                  ),
                                  Text("Mail Address : abc@gmail.com",style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 1.30.h,
                                  ),
                                  Text("Contact No : +91 90909 09090",style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
                                  SizedBox(
                                    height: 1.30.h,
                                  ),
                                  Text("Payment Type  : Cash",style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
                                  SizedBox(
                                    height: 1.30.h,
                                  ),
                                  Text("Paid Amount : 00",style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
                                  SizedBox(
                                    height: 1.30.h,
                                  ),
                                  Text("Total Payment : ₹ 999",style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.61.w),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Customer Detail : ",style: TextStyle(decoration: TextDecoration.underline,color: Color.fromRGBO(12, 25, 71, 1),fontSize: 11.37.sp),),
                          SizedBox(height: 1.h,),
                          Text("      Date : 01-03-2023", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp),
                          ),
                          Text("      Time : 06:00 PM", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp),
                          ),
                          Text("      Payment Method : Cash On Delivery", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp),
                          ),
                          Text("      Paid Amount : 00", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp),
                          ),
                          Text("      Pending Amount : Rs. 1180", style: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1),
                              fontSize: 9.09.sp),
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 33.33.w,
                                height: 4.26.h,
                                child: ElevatedButton(
                                    onPressed: () {

                                    },
                                    child: Text(
                                      "Pay",
                                      style: TextStyle(fontSize: 10.61.sp,
                                          color: Colors.teal, ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shadowColor: Colors.white,
                                        side: const BorderSide(
                                          width: 1.0,
                                          color: Colors.teal,
                                        ))),
                              ),
                              Container(
                                width: 33.33.w,
                                height: 4.26.h,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                                    },
                                    child: Text(
                                      "View Product",
                                      style: TextStyle(fontSize: 10.61.sp,
                                          color: Colors.teal, ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shadowColor: Colors.white,
                                        side: const BorderSide(
                                          width: 1.0,
                                          color: Colors.teal,
                                        ))),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
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
                width: 83.07.w,
                height: 42.29.h,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesDetail()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.5.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/product_photo.png",height:19.78.h,width: 37.43.w,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Customer Name : ABCDEFG",
                                      style: TextStyle(
                                          color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text(
                                      "Company Name : XYZXYZ",
                                      style: TextStyle(
                                          color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Mail Address : abc@gmail.com",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Contact No : +91 90909 09090",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Payment Type  : Cash",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Paid Amount : 00",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Total Payment : ₹ 999",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.61.w),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Customer Detail : ",style: TextStyle(decoration: TextDecoration.underline,color: Color.fromRGBO(12, 25, 71, 1),fontSize: 11.37.sp),),
                            SizedBox(height: 1.h,),
                            Text("      Date : 01-03-2023", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Time : 06:00 PM", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Payment Method : Cash On Delivery", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Paid Amount : 00", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Pending Amount : Rs. 1180", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            SizedBox(height: 1.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 33.33.w,
                                  height: 4.26.h,
                                  child: ElevatedButton(
                                      onPressed: () {

                                      },
                                      child: Text(
                                        "Proceed",
                                        style: TextStyle(fontSize: 10.61.sp,
                                          color: Colors.teal, ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shadowColor: Colors.white,
                                          side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.teal,
                                          ))),
                                ),
                                Container(
                                  width: 33.33.w,
                                  height: 4.26.h,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                                      },
                                      child: Text(
                                        "View Product",
                                        style: TextStyle(fontSize: 10.61.sp,
                                          color: Colors.teal, ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shadowColor: Colors.white,
                                          side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.teal,
                                          ))),
                                ),
                              ],
                            )
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
                width: 83.07.w,
                height: 42.29.h,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesDetail()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.5.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/product_photo.png",height:19.78.h,width: 37.43.w,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Customer Name : ABCDEFG",
                                      style: TextStyle(
                                          color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text(
                                      "Company Name : XYZXYZ",
                                      style: TextStyle(
                                          color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Mail Address : abc@gmail.com",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Contact No : +91 90909 09090",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Payment Type  : Cash",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Paid Amount : 00",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(
                                      height: 1.30.h,
                                    ),
                                    Text("Total Payment : ₹ 999",style: TextStyle(
                                        color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.61.w),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Customer Detail : ",style: TextStyle(decoration: TextDecoration.underline,color: Color.fromRGBO(12, 25, 71, 1),fontSize: 11.37.sp),),
                            SizedBox(height: 1.h,),
                            Text("      Date : 01-03-2023", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Time : 06:00 PM", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Payment Method : Cash On Delivery", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Paid Amount : 00", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            Text("      Pending Amount : Rs. 1180", style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 9.09.sp),
                            ),
                            SizedBox(height: 1.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 33.33.w,
                                  height: 4.26.h,
                                  child: ElevatedButton(
                                      onPressed: () {

                                      },
                                      child: Text(
                                        "Proceed",
                                        style: TextStyle(fontSize: 10.61.sp,
                                          color: Colors.teal, ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shadowColor: Colors.white,
                                          side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.teal,
                                          ))),
                                ),
                                Container(
                                  width: 33.33.w,
                                  height: 4.26.h,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                                      },
                                      child: Text(
                                        "View Product",
                                        style: TextStyle(fontSize: 10.61.sp,
                                          color: Colors.teal, ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shadowColor: Colors.white,
                                          side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.teal,
                                          ))),
                                ),
                              ],
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
