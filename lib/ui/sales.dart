import 'package:care_for_each/API/EmployeeSide/sales_history_API.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/ui/sales_detail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/EmployeeSide/sales_history_detailAPI.dart';
import '../API/EmployeeSide/sales_history_product_API.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  String? getEName;
  String? getCName;
  void getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getEName=sharedPreferences.getString("email")!;
      getCName=sharedPreferences.getString('c_email');
    });

  }
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
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
                future: SalesHistoryAPI().sales(getEName),
                builder: (BuildContext context, snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else if(snapshot.hasData){
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.server!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(height: 1.18.h),
                              Center(
                                child: Container(
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
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SalesDetail(
                                            oid: snapshot.data!.server![index].oid.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 3.w,
                                            vertical: 1.89.h,
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 16.47.h,
                                                  width: 37.43.w,
                                                  child: FutureBuilder(
                                                    future: SalesHistoryProductDetailAPI().customer(snapshot.data!.server![index].oid.toString()),
                                                    builder: (BuildContext context, snapshot2) {
                                                      if (snapshot2.connectionState == ConnectionState.waiting) {
                                                        return Center(child: CircularProgressIndicator());
                                                      } else if (snapshot2.hasData) {
                                                        return Center(
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 16.47.h,
                                                                width: 37.43.w,
                                                                child: Image.network(
                                                                  snapshot2.data!.server![0].pphoto.toString(),

                                                                  errorBuilder: (context, error, stackTrace) =>
                                                                      SizedBox(width: 37.43.w, height: 16.47.h),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 18.0),
                                                                child: Container(
                                                                  width: 34.61.w,
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: 38.46.w,
                                                                        child: Text(
                                                                          "Product Name : ${snapshot2.data!.server![0].pname.toString()}",
                                                                          style: TextStyle(
                                                                            fontFamily: 'Inter',
                                                                            color: Color.fromRGBO(12, 25, 71, 1),
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 11.37.sp,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 1.h),
                                                                      SizedBox(
                                                                        width: 38.46.w,
                                                                        child: Text(
                                                                          "Price : Rs. ${snapshot2.data!.server![0].price.toString()}",
                                                                          style: TextStyle(
                                                                            fontFamily: 'Inter',
                                                                            color: Color.fromRGBO(12, 25, 71, 1),
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 11.37.sp,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else {
                                                        return Text("No data");
                                                      }
                                                    },
                                                  ),
                                                ),

                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 18.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Customer Detail : ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter',
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              SizedBox(height: 0.71.h),
                                              FutureBuilder(
                                                future: SalesHistoryDetailAPI()
                                                    .sales(snapshot.data!.server![index].oid.toString()),
                                                builder: (BuildContext context, snapshot3) {
                                                  if (snapshot3.connectionState == ConnectionState.waiting) {
                                                    return Center(child: CircularProgressIndicator());
                                                  } else if (snapshot3.hasData) {
                                                    return Text(
                                                      "Name : ${snapshot3.data!.server![0].customername.toString()}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'Inter',
                                                        color: Color.fromRGBO(12, 25, 71, 1),
                                                        fontSize: 9.85.sp,
                                                      ),
                                                    );
                                                  } else {
                                                    return Text("No data");
                                                  }
                                                },
                                              ),
                                              SizedBox(height: 0.71.h),
                                              Text(
                                                "Order Date : ${snapshot.data!.server![index].date.toString()}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter',
                                                  color: Color.fromRGBO(12, 25, 71, 1),
                                                  fontSize: 9.85.sp,
                                                ),
                                              ),
                                              SizedBox(height: 0.71.h),
                                              Text(
                                                "Payment Type : ${snapshot.data!.server![index].paymentmode.toString()}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter',
                                                  color: Color.fromRGBO(12, 25, 71, 1),
                                                  fontSize: 9.85.sp,
                                                ),
                                              ),
                                              SizedBox(height: 0.71.h),
                                              Text(
                                                "Total Amount : Rs. ${snapshot.data!.server![index].grandtotal.toString()}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter',
                                                  color: Color.fromRGBO(12, 25, 71, 1),
                                                  fontSize: 9.85.sp,
                                                ),
                                              ),
                                              SizedBox(height: 0.71.h),
                                              Text(
                                                "Pending Amount : Rs. ${snapshot.data!.server![index].pendingamount.toString()}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter',
                                                  color: Color.fromRGBO(12, 25, 71, 1),
                                                  fontSize: 9.85.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );

                  }
                  else{
                    return Text("No data");
                  }
                }
            ),



          ],
        ),
      ),
    );
  }
}
