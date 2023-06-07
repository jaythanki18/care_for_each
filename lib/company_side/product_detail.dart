import 'dart:io';
import 'dart:math';
import 'package:care_for_each/API/product_value_edit_API.dart';
import 'package:care_for_each/company_side/products.dart';
import 'package:care_for_each/widgets/round_button2.dart';
import 'package:flutter/material.dart';

import '../API/SingleProductDisplayAPI.dart';
import '../widgets/round_button.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key,required this.pid}) : super(key: key);

   final String pid;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
          "Product Detail",
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
        padding:  EdgeInsets.symmetric(horizontal: 11.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundButton2(title: 'Product Detail', onTap: (){}),
                SizedBox(height: 2.01.h,),
                FutureBuilder(
                  future: SingleProductDisplayAPI().productList("info@webearl.com",pid),
                  builder: (BuildContext context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Text("Loading");
                    }
                    else if(snapshot.hasData){
                      return Column(
                        children: [
                          Card(
                            shadowColor: Colors.grey,
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                            child: Container(
                              width: 79.74.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.36.h),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(62, 86, 115, 0.2),
                                    Color.fromRGBO(184, 184, 184, 0.1)
                                  ])
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.33.w,vertical: 3.33.w),
                                child: Row(
                                  children: [
                                    Image.network(snapshot.data!.server![0].pphoto.toString(),height: 25.64.w,width: 25.64.w,errorBuilder: (context, error, stackTrace) => SizedBox(width: 25.64.w,height: 100,),),
                                    SizedBox(width: 3.33.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Name : '+snapshot.data!.server![0].pname.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                        Text('Code : '+snapshot.data!.server![0].pcode.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                        Text('Available Stock : '+snapshot.data!.server![0].stock.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                        Text('Minimum Stock : '+snapshot.data!.server![0].minimumStock.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                        Text('Minimum price : ₹'+snapshot.data!.server![0].sprice.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                        Container(
                                          height: 3.08.h,
                                          width: 30.76.w,
                                          decoration: BoxDecoration(
                                              color: Colors.teal,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(child: Text('Price : ₹'+snapshot.data!.server![0].price.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9.09.sp),),),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Text('Description :',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                          Text(snapshot.data!.server![0].pdesc.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        ],
                      );
                    }
                    else{
                      return Center(child: Text("No data"));
                    }
                  },

                ),
              ],
            ),
            RoundButton(
              title: "Delete",
              onTap: () {
                showAlertDialog(context,pid,"delete","");
              },
            ),
          ],
        ),
      ),
    );
  }
}


showAlertDialog(BuildContext context,pid,fname,value) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromRGBO(2, 25, 71, 1),
    title: Text("Are you sure want to DELETE ?",style: TextStyle(color: Colors.white),),
    // content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      FutureBuilder(
        future: ProductValueEditAPI().productList(pid,fname,value),
        builder: (context,snapshot){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50,),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                        child: Text("No",style: TextStyle(color: Colors.white))
                    ),
                  ),
                  SizedBox(width: 50,),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: ElevatedButton(
                        onPressed: (){
                          print(snapshot.data!.server![0].result.toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Products()));
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                        child: Text("Yes",style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ],
          );
        },

      ),

    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

