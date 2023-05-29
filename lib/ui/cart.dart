import 'package:care_for_each/ui/new_ginnie.dart';
import 'package:care_for_each/ui/new_purchase.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _message = TextEditingController();
  TextEditingController _date = TextEditingController();

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
  }

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
          "Cart",
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 36.92.w,
                  height: 4.14.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewPurchase()));
                      },
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold,fontSize: 9.09.sp),
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
                  width: 36.92.w,
                  height: 4.14.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewGinnie()));
                      },
                      child: Text(
                        "Ginnie Box",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold,fontSize: 9.09.sp),
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
            ),
            SizedBox(
              height: 1.18.h,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 34.71.h,
              width: 79.74.w,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.cancel_outlined,
                        color: Color.fromRGBO(12, 25, 71, 1)),
                    Container(
                     // margin: EdgeInsets.only(left: 100, top: 25),
                      margin: EdgeInsets.symmetric(horizontal: 24.5.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/product_photo.png",
                            height: 12.55.h,
                            width: 28.46.w,
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HIGHLANDER",
                            style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Men Slim Fit Solid Cut Away Collar Casual Jacket.",
                            style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                          Text("Product Code : rtx34",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text("Quantity : ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20,
                                child: FloatingActionButton(
                                  elevation: 3,
                                  backgroundColor: Colors.red,
                                  onPressed: _decrementCount,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Text(
                                "${_count}",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              SizedBox(
                                height: 20,
                                child: FloatingActionButton(
                                  elevation: 3,
                                  onPressed: _incrementCount,
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                          Text("Price : ",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("GST : 18%",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 34.71.h,
              width: 79.74.w,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.cancel_outlined,
                        color: Color.fromRGBO(12, 25, 71, 1)),
                    Container(
                      // margin: EdgeInsets.only(left: 100, top: 25),
                      margin: EdgeInsets.symmetric(horizontal: 24.5.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/product_photo.png",
                            height: 12.55.h,
                            width: 28.46.w,
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HIGHLANDER",
                            style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Men Slim Fit Solid Cut Away Collar Casual Jacket.",
                            style: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                          Text("Product Code : rtx34",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text("Quantity : ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20,
                                child: FloatingActionButton(
                                  elevation: 3,
                                  backgroundColor: Colors.red,
                                  onPressed: _decrementCount,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Text(
                                "${_count}",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              SizedBox(
                                height: 20,
                                child: FloatingActionButton(
                                  elevation: 3,
                                  onPressed: _incrementCount,
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                          Text("Price : ",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("GST : 18%",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //body: ,
    );
  }
}
