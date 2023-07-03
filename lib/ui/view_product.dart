import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../API/EmployeeSide/sales_history_product_API.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key, required this.oid}) : super(key: key);

  final String oid;
  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
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
          "View Product",
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
      body: Container(
        margin: EdgeInsets.only(left: 45, right: 31),
        height: 30.33.h,
        width: 79.74.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(62, 86, 115, 0.2),
              Color.fromRGBO(184, 184, 184, 0.1)
            ]),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.69.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h,),
              FutureBuilder(
                  future: SalesHistoryProductDetailAPI().customer(widget.oid),
                  builder: (BuildContext context, snapshot2){
                    if(snapshot2.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if(snapshot2.hasData){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1.h),
                                child: Image.network(snapshot2.data!.server![0].pphoto.toString(),height: 14.21.h, width: 30.76.w,errorBuilder: (context, error, stackTrace) => SizedBox(width: 30.76.w,height: 14.21.h,)),
                              )
                          ),
                          Text(snapshot2.data!.server![0].pname.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 11.37.sp),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          //Text("Men Slim Fit Solid Cut Away Collar Casual Jacket.",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 7.583.sp),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          Text("Code : ${snapshot2.data!.server![0].pcode.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp),maxLines: 1,overflow: TextOverflow.ellipsis),
                          Text("Quantity : ${snapshot2.data!.server![0].qty.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp),maxLines: 1,overflow: TextOverflow.ellipsis),
                          Text("Price : ₹ ${snapshot2.data!.server![0].price.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp),maxLines: 1,overflow: TextOverflow.ellipsis),
                        ],
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
      ),
    );
  }
}
