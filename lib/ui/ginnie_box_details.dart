import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GinnieBoxDetail extends StatefulWidget {
  const GinnieBoxDetail({Key? key}) : super(key: key);

  @override
  State<GinnieBoxDetail> createState() => _GinnieBoxDetailState();
}

class _GinnieBoxDetailState extends State<GinnieBoxDetail> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    height: 15.16.h,
                    width: 83.07.w,
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
                                      Text('Name : ',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                      Text('Company Name : ',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                      Text('Email Id : ',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                      Text('Contact No : ',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                      Text('Expected Date : ',style: TextStyle(fontSize: 8.43.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
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
                              Text("Name : Men Casual Jacket",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                              Text("Code : iguyr598",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                              Text("Quantity : 01",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                              Text("Price :  ₹ 1099",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 0.82.h,),
                      Text("Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufgkrey gfohorev  98ryf9hrv9h bhfk ewiuv",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),maxLines: 3,overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                SizedBox(height: 2.725.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.46.w),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
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
                              Text("Name : Men Casual Jacket",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                              Text("Code : iguyr598",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                              Text("Quantity : 01",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                              Text("Price :  ₹ 1099",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 0.82.h,),
                      Text("Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufgkrey gfohorev  98ryf9hrv9h bhfk ewiuv",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp),maxLines: 3,overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 2.72.h,),
            Container(
              child: Center(
                child: Container(
                  width: 77.94.w,
                  height: 6.51.h,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
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
                          ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
