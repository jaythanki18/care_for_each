import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/ui/view_product.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../API/EmployeeSide/sales_history_API.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/EmployeeSide/sales_history_detailAPI.dart';
import '../API/EmployeeSide/sales_history_product_API.dart';

class SalesDetail extends StatefulWidget {
  const SalesDetail({Key? key, required this.oid}) : super(key: key);

  final String oid;
  @override
  State<SalesDetail> createState() => _SalesDetailState();
}

class _SalesDetailState extends State<SalesDetail> {
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
      body: Center(

        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: SalesHistoryDetailAPI().sales(widget.oid),
                  builder: (BuildContext context, snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if(snapshot.hasData){
                      return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.server!.length,
                              itemBuilder: (context,index){
                                return  Column(
                                  children: [
                                    SizedBox(height: 1.h,),
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(62, 86, 115, 0.2),
                                            Color.fromRGBO(184, 184, 184, 0.1)
                                          ]),
                                          borderRadius: BorderRadius.circular(2.h),
                                          color: Colors.blue,
                                        ),
                                        width: 83.07.w,
                                        height: 42.29.h,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                    future: SalesHistoryProductDetailAPI().customer(widget.oid),
                                                    builder: (BuildContext context, snapshot2){
                                                      if(snapshot2.connectionState==ConnectionState.waiting){
                                                        return Center(child: CircularProgressIndicator(),);
                                                      }
                                                      else if(snapshot2.hasData){
                                                        return  Padding(
                                                          padding:  EdgeInsets.symmetric(horizontal: 2.25.w,vertical: 1.h),
                                                          child: Image.network(snapshot2.data!.server![index].pphoto.toString(),height:17.78.h,width: 35.43.w,errorBuilder: (context, error, stackTrace) => SizedBox(width: 35.43.w,height: 17.78.h,)),
                                                        );
                                                      }
                                                      else{
                                                        return Text("No data");
                                                      }
                                                    }
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SizedBox(
                                                          width:35.64.w,
                                                          child: Text(
                                                            "Customer Name : ${snapshot.data!.server![index].customername.toString()}",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.30.h,
                                                        ),
                                                        SizedBox(
                                                          width: 35.64.w,
                                                          child: Text(
                                                            "Company Name : ${snapshot.data!.server![index].customercompanyname.toString()}",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(12, 25, 71, 1), fontSize: 6.82.sp),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.30.h,
                                                        ),
                                                        SizedBox(
                                                          width: 35.64.w,
                                                          child: Text("Mail Address : ${snapshot.data!.server![index].customeremailid.toString()}",style: TextStyle(
                                                              color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.30.h,
                                                        ),
                                                        SizedBox(
                                                          width: 35.64.w,
                                                          child: Text("Contact No : +91${snapshot.data!.server![index].customercontactno.toString()}",style: TextStyle(
                                                              color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,),
                                                        ),
                                                        SizedBox(
                                                          height: 1.30.h,
                                                        ),
                                                        SizedBox(
                                                          width: 35.64.w,
                                                          child: Text("Payment Type  : ${snapshot.data!.server![index].paymentmode.toString()}",style: TextStyle(
                                                              color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,),
                                                        ),
                                                        SizedBox(
                                                          height: 1.30.h,
                                                        ),
                                                        SizedBox(
                                                          width: 35.64.w,
                                                          child: Text("Paid Amount : ${snapshot.data!.server![index].paidamount.toString()}",style: TextStyle(
                                                              color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,),
                                                        ),
                                                        SizedBox(
                                                          height: 1.30.h,
                                                        ),
                                                        SizedBox(
                                                          width: 35.64.w,
                                                          child: Text("Total Payment : ₹ ${snapshot.data!.server![index].grandtotal.toString()}",style: TextStyle(
                                                              color: Color.fromRGBO(12, 25, 71, 1),fontSize: 6.82.sp),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
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
                                                  Text("      Date : ${snapshot.data!.server![index].date.toString()}", style: TextStyle(
                                                      color: Color.fromRGBO(12, 25, 71, 1),
                                                      fontSize: 9.09.sp),
                                                  ),
                                                  // Text("      Time : ${snapshot.data!.server1[index].}", style: TextStyle(
                                                  //     color: Color.fromRGBO(12, 25, 71, 1),
                                                  //     fontSize: 9.09.sp),
                                                  // ),
                                                  Text("      Payment Method : ${snapshot.data!.server![index].paymentmode.toString()}", style: TextStyle(
                                                      color: Color.fromRGBO(12, 25, 71, 1),
                                                      fontSize: 9.09.sp),
                                                  ),
                                                  Text("      Paid Amount : ${snapshot.data!.server![index].paidamount.toString()}", style: TextStyle(
                                                      color: Color.fromRGBO(12, 25, 71, 1),
                                                      fontSize: 9.09.sp),
                                                  ),
                                                  Text("      Pending Amount : Rs. ${snapshot.data!.server![index].pendingamount.toString()}", style: TextStyle(
                                                      color: Color.fromRGBO(12, 25, 71, 1),
                                                      fontSize: 9.09.sp),
                                                  ),
                                                  SizedBox(height: 2.h,),
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
                                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct(oid: widget.oid,)));
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
                                );
                              })
                      );
                    }
                    else{
                      return Text("No data");
                    }
                  }
              ),
            ),



          ],
        ),
      ),
    );
  }
}
