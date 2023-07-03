import 'package:care_for_each/API/EmployeeSide/wishlist_cust_display_API.dart';
import 'package:care_for_each/API/EmployeeSide/wishlist_display_product_API.dart';
import 'package:care_for_each/API/EmployeeSide/wishlist_to_cart_API.dart';
import 'package:care_for_each/Models/EmployeeSide/ProceedWithWCIDModel.dart';
import 'package:care_for_each/Models/EmployeeSide/WishlistToCartModel.dart';
import 'package:care_for_each/ui/cart.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/EmployeeSide/proceed_with_wcid_API.dart';
import 'ginnie_box.dart';

class GinnieBoxDetail extends StatefulWidget {
  const GinnieBoxDetail({Key? key, required this.wcid}) : super(key: key);

  final String wcid;
  @override
  State<GinnieBoxDetail> createState() => _GinnieBoxDetailState();
}

class _GinnieBoxDetailState extends State<GinnieBoxDetail> {
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
          "Ginnie Box Detail",
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
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                future: ProceedWithWCIDAPI().proceed(widget.wcid),
                  builder: (BuildContext context, snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if(snapshot.hasData){
                            return  Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.25.w),
                                    child: Container(
                                      height: 15.16.h,
                                     // width: 83.07.w,
                                      child: Card(
                                        //color: Colors.blue,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        child: InkWell(
                                          onTap: (){},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                gradient: LinearGradient(colors: [
                                                  Colors.grey,
                                                  Colors.white,
                                                ])
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.h),child:Image.asset("assets/img_4.png",width: 20.5.w,height: 11.25.h,),),
                                                    SizedBox(width: 1.h,),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        //Image.asset("calender.png",width: 0.01*w),
                                                        SizedBox(width: 40.41.w,child: Text('Name : ${snapshot.data!.server![0].custname.toString()}',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                                        SizedBox(width: 40.41.w,child: Text('Company Name : ${snapshot.data!.server![0].custCompanyName.toString()}',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2)),
                                                        SizedBox(width: 40.41.w,child: Text('Email Id : ${snapshot.data!.server![0].custemailid.toString()}',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2)),
                                                        SizedBox(width: 40.41.w,child: Text('Contact No : ${snapshot.data!.server![0].custmobile.toString()}',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1)),
                                                        SizedBox(width: 40.41.w,child: Text('Address : ${snapshot.data!.server![0].custaddress.toString()}',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1)),
                                                        //Text('Expected Date :${message}'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FutureBuilder(
                                    future: WishlistDisplayProductAPI().wishlist(getEName, widget.wcid),
                                    builder: (BuildContext context, snapshot2){
                                      if(snapshot2.connectionState==ConnectionState.waiting){
                                        return Center(child: CircularProgressIndicator(),);
                                      }
                                      else if(snapshot2.hasData){
                                        return Column(
                                          children: [
                                            SizedBox(height: 2.72.h,),
                                            Container(
                                              height: 18.60.h,
                                              width: 75.64.w,
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset("assets/product_photo.png",width: 24.1.w,height: 10.66.h,),
                                                      SizedBox(width: 1.h,),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Name : ${snapshot2.data!.server![0].name.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                                                          Text("Code : ${snapshot2.data!.server![0].pcode.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                                                          Text("Quantity : ${snapshot2.data!.server![0].qty.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                                                          Text("Price :  ₹ ${snapshot2.data!.server![0].sprice.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 0.82.h,),
                                                  Text("Detail : ${snapshot2.data!.server![0].pdesc.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );


                                      }
                                      else{
                                        return Text("No data");
                                      }
                                    }
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 8.46.w),
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),

                                SizedBox(height: 2.72.h,),
                              ],
                            );

                    }
                    else{
                      return Text("No data");
                    }
                  }
              ),
              SizedBox(height: 2.725.h,),
              Center(
                child: Container(
                  width: 77.94.w,
                  height: 6.51.h,
                  child: ElevatedButton(
                      onPressed: () async{
                        WishlistToCartModel data = await WishlistToCartAPI().wishlist(widget.wcid);

                         Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                      },
                      child: Text(
                        "Redirect To Cart",
                        style: TextStyle(color: Colors.teal,fontSize: 15.166.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white,
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.teal,
                          )
                      )
                  ),
                ),
              ),

            ],
          ),


    );
  }
}
