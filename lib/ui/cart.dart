import 'package:care_for_each/API/EmployeeSide/cart_display_API.dart';
import 'package:care_for_each/API/EmployeeSide/product_display_API.dart';
import 'package:care_for_each/API/ProductDisplayAPI.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductInCartEditModel.dart';
import 'package:care_for_each/Models/ProductDisplayModel.dart';
import 'package:care_for_each/ui/new_ginnie.dart';
import 'package:care_for_each/ui/new_purchase.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/widgets/round_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/EmployeeSide/employee_gt_API.dart';
import '../API/EmployeeSide/product_in_cart_edit_API.dart';


class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key, 
  }) : super(key: key);

 
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
    debugPrint(getEName);
  }

  // String pid="";
  // void getpid() async{
  //  ProductDisplayModel data = await ProductDisplayAPI().productList(getCName);
  //  for(int i=0;i<data.server!.length;i++){
  //    pid=
  //  }
  // }

  // void _incrementCount() {
  //   setState(() {
  //     _count++;
  //   });
  // }
  //
  // void _decrementCount() {
  //   setState(() {
  //     _count--;
  //   });
  // }
  int _count = 0;
  int cnt=0;

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
      body: Column(
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

          FutureBuilder(
              future: CartDisplayAPI().cart(getEName),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return  Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasData){

                  return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.server!.length,

                        itemBuilder: (context,index){

                         _count = int.parse(snapshot.data!.server![index].qty.toString());
                          return Column(
                            children: [
                              Center(
                                child: Container(
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
                                        IconButton(onPressed: () async{
                                          debugPrint(getEName);
                                          debugPrint("delete");
                                          debugPrint(snapshot.data!.server![index].pid.toString());
                                          ProductIntCartEditModel data = await ProductInCartEditAPI().cart(getEName, "delete", snapshot.data!.server![index].pid.toString());
                                          print(data.server![0].status.toString());
                                        },
                                            icon: Icon(Icons.cancel_outlined, color: Color.fromRGBO(12, 25, 71, 1),)
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(left: 100, top: 25),
                                          margin: EdgeInsets.symmetric(horizontal: 24.5.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.network(
                                                snapshot.data!.server![index].pphoto.toString(),
                                                height: 12.55.h,
                                                width: 28.46.w,
                                                  errorBuilder: (context, error, stackTrace) => SizedBox(width: 28.46.w,height: 12.55.h,)
                                              ),

                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7.7.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                               snapshot.data!.server![index].pname.toString(),
                                                style: TextStyle(
                                                    color: Color.fromRGBO(12, 25, 71, 1),
                                                    fontWeight: FontWeight.bold),
                                              ),

                                              Text("Product Code : ${snapshot.data!.server![index].pcode.toString()}",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(12, 25, 71, 1),
                                                      fontWeight: FontWeight.bold)),
                                              Row(
                                                children: [
                                                  Text("Quantity : ${snapshot.data!.server![index].qty.toString()}",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(12, 25, 71, 1),
                                                          fontWeight: FontWeight.bold)),
                                                  SizedBox(
                                                    height: 2.5.h,
                                                    child: FloatingActionButton(
                                                      elevation: 3,
                                                      backgroundColor: Colors.red,
                                                      onPressed: () async{
                                                        setState(() {
                                                          _count--;
                                                        });
                                                        print(getEName);
                                                        print("minus");
                                                        print(snapshot.data!.server![index].pid.toString());
                                                        ProductIntCartEditModel data = await ProductInCartEditAPI().cart(getEName, "minus", snapshot.data!.server![index].pid.toString());
                                                        print(data.server![0].status.toString());
                                                      //  _decrementCount;
                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${_count}",
                                                    style: TextStyle(
                                                        decoration: TextDecoration.underline),
                                                  ),
                                                  SizedBox(
                                                    height: 2.5.h,
                                                    child: FloatingActionButton(
                                                      elevation: 3,
                                                      onPressed: () async{
                                                        setState(() {
                                                          _count++;
                                                        });
                                                        print(getEName);
                                                        print("plus");
                                                        print(snapshot.data!.server![index].pid.toString());
                                                        ProductIntCartEditModel data = await ProductInCartEditAPI().cart(getEName, "plus", snapshot.data!.server![index].pid.toString());
                                                        print(data.server![0].status.toString());
                                                      //  _incrementCount;
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text("Price : ${snapshot.data!.server![index].total.toString()}",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(12, 25, 71, 1),
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                              Text("GST : ${snapshot.data!.server![index].gst.toString()}%",
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
                              ),
                            ],
                          );
                        },
                      )
                  );
                }
                else{
                  return Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.83.h),
                          child: Image.asset("assets/empty_cart.png",width: 305,height: 252,)
                      )
                  );
                }
              }
          ),
          FutureBuilder(
              future: EmployeeGTAPI().gt(getEName),
              builder: (BuildContext context, snapshot2){
                if(snapshot2.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot2.hasData){
                  return Container(
                    width: 77.94.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyLogin()));
                        },
                        child: Text(
                          "Grand Total : ₹ ${snapshot2.data!.server![0].gt.toString()}",
                          style: TextStyle(color: Colors.teal),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  );
                }
                else{
                  return Text("No data");
                }
              }
          ),

          SizedBox(height: 1.h,)
        ],
      ),
      //body: ,
    );
  }
}
