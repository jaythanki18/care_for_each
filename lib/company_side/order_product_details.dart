import 'package:flutter/material.dart';

import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class OrderProductDetail extends StatefulWidget {
  const OrderProductDetail({Key? key}) : super(key: key);

  @override
  State<OrderProductDetail> createState() => _OrderProductDetailState();
}

class _OrderProductDetailState extends State<OrderProductDetail> {
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
          "Order Product Details",
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
      body: Padding(
        padding: const EdgeInsets.all(33),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 34.71.h,
              width: 83.07.w,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.36.h),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(62, 86, 115, 0.2),
                      Color.fromRGBO(184, 184, 184, 0.1)
                    ]),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.w,vertical: 2.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/product_photo.png",
                              height: 32.82.w,
                              width: 32.82.w,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.69.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HIGHLANDER",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 11.37.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Men Slim Fit Solid Cut Away Collar Casual Jacket.",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 7.583.sp,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                            Text("Product Code : rtx34",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 9.09.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("Quantity : 20",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 9.09.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("Price : ₹ 19980",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 9.09.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("Description : loremloremloremlorem",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 9.09.sp,
                                    fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 34.71.h,
              width: 83.07.w,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.36.h),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(62, 86, 115, 0.2),
                      Color.fromRGBO(184, 184, 184, 0.1)
                    ]),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.w,vertical: 2.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/product_photo.png",
                              height: 32.82.w,
                              width: 32.82.w,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.69.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HIGHLANDER",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 11.37.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Men Slim Fit Solid Cut Away Collar Casual Jacket.",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 7.583.sp,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                            Text("Product Code : rtx34",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 9.09.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("Quantity : 20",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 9.09.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("Price : ₹ 19980",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 9.09.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("Description : loremloremloremlorem",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 9.09.sp,
                                  fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ],
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
