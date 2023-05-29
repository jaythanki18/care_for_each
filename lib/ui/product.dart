import 'package:care_for_each/ui/dashboard.dart';
import 'package:care_for_each/ui/product_details.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'cart.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class MenuData {
  MenuData(this.icon, this.title);

  final IconData icon;
  final String title;
}

class _ProductScreenState extends State<ProductScreen> {


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
            "Product",
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
          shadowColor: Colors.transparent,
        ),
        body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.4.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.92.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color.fromRGBO(12, 25, 71, 1)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Search Products & more",
                            suffixIcon: Icon(
                              Icons.mic_none,
                              color: Color.fromRGBO(12, 25, 71, 1),
                            ),
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(157, 157, 157, 1))),
                      ),
                    ), //Search
                    SizedBox(
                      height: 1.18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Center(
                            child: Container(
                              height: 4.73.h,
                              width: 39.74.w,
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Select Category",
                                        style: TextStyle(
                                            color: Colors.teal, fontSize: 7.583.sp),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.teal,
                                      )
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      shadowColor: Colors.white,
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Colors.teal,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Container(
                              height: 4.73.h,
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Select Subcategory",
                                        style: TextStyle(
                                            color: Colors.teal, fontSize: 7.583.sp),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.teal,
                                      )
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      shadowColor: Colors.white,
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Colors.teal,
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ), //2 elevated button
                    SizedBox(height: 10,),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                          crossAxisCount: 2,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 18.95.h,
                          width: 36.41.w,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Icon(
                                //   menu[index].icon,
                                //   size: 30,
                                // ),

                                // Text(
                                //   menu[index].title,
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //       fontSize: 10, color: Colors.black87),
                                // )

                                Image.asset("assets/product_photo.png",height: 14.5.h,width: 36.41.w,),
                                Text("Code : 2xrt",style: TextStyle(fontSize: 9.09.sp)),
                                Text("Price : Rs.999",style: TextStyle(color: Colors.green,fontSize: 7.583.sp),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}

