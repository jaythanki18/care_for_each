import 'package:care_for_each/widgets/round_button2.dart';
import 'package:flutter/material.dart';

import '../widgets/round_button.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

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
                          Image.asset('assets/product_photo.png',height: 25.64.w,width: 25.64.w,),
                          SizedBox(width: 3.33.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              Text('Code : slu655',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              Text('Available Stock : 967',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              Text('Minimum Stock : 20',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              Text('Minimum Stock : 20',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              Container(
                                height: 3.08.h,
                                width: 30.76.w,
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(child: Text('Price : ₹ 3278',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9.09.sp),),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Text('Description :',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                Text('zxcvbnmasdfghjklwertyuiop :',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
              ],
            ),
            RoundButton(
              title: "Delete",
              onTap: () {
                showAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


showAlertDialog(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromRGBO(2, 25, 71, 1),
    title: Text("Are you sure want to DELETE ?",style: TextStyle(color: Colors.white),),
    // content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
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
                onPressed: (){},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                child: Text("Yes",style: TextStyle(color: Colors.white))),
          ),
        ],
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

