import 'package:flutter/material.dart';

import '../API/wishlist_detail_display_API.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class GinnieBoxDetail extends StatefulWidget {
  const GinnieBoxDetail({Key? key, required this.wcid}) : super(key: key);

  final String wcid;
  @override
  State<GinnieBoxDetail> createState() => _GinnieBoxDetailState();
}

class _GinnieBoxDetailState extends State<GinnieBoxDetail> {
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
          "Ginnie Box Detail",
          style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: WishlistDetailDisplayCompanyAPI().wishlistDetail(widget.wcid),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            return   Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 1.18.h,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 38.0),
                                  child: Text("Customer Detail :",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 15.16.sp,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                  child: Card(
                                    // margin: EdgeInsets.only(left: 40,right: 40),
                                    shadowColor: Colors.grey,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      height: 45.26.h,
                                      width: 83.07.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2.36.h),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(62, 86, 115, 0.2),
                                            Color.fromRGBO(184, 184, 184, 0.1)
                                          ])
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(child: Container(child: Image.asset("assets/img_4.png",width: 23.83.w,height: 14.45.h,))),
                                            SizedBox(height: 1.77.h,),
                                            //Image.asset("calender.png",width: 0.01*w),
                                            Text('Name : '+snapshot.data!.server![index].cname.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Company Address : '+snapshot.data!.server![index].ccname.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                            Text('Date : '+snapshot.data!.server![index].cdate.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Email : '+snapshot.data!.server![index].cemid.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Contact No : '+snapshot.data!.server![index].cmobileno.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Expected Date : '+snapshot.data!.server![index].cdate.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            Text('Grand Total : ₹ '+snapshot.data!.server![index].gt.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            //Text('Expected Date :${message}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 38.0),
                                  child: Text("Employee Detail :",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 15.16.sp,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                  child: Card(
                                    elevation: 4,
                                    shadowColor: Colors.grey,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                                    child: Container(
                                      height: 23.22.h,
                                      width: 79.74.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2.36.h),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(62, 86, 115, 0.2),
                                            Color.fromRGBO(184, 184, 184, 0.1)
                                          ])
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(child: Container(child: Image.network(snapshot.data!.server![index].ephoto.toString(),width: 20.51.w,height: 11.25.h,errorBuilder: (context, error, stackTrace) => SizedBox(width: 20.51.w,height: 11.25.h,)))),
                                            //Image.asset("calender.png",width: 0.01*w),
                                            Text(snapshot.data!.server![index].ename.toString(),style: TextStyle(fontSize: 10.61.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text(snapshot.data!.server![index].edesc.toString(),style: TextStyle(fontSize: 10.61.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                            Text(snapshot.data!.server![index].eemailid.toString(),style: TextStyle(fontSize: 10.61.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 38.0),
                                  child: Text("Product Detail :",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 15.16.sp,fontWeight: FontWeight.bold),),
                                ),

                                // ListView.builder(
                                //     itemBuilder: (BuildContext context, int index2){
                                //
                                //     }
                                // ),
                                Center(
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(62, 86, 115, 0.2),
                                            Color.fromRGBO(184, 184, 184, 0.1)
                                          ])
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 2.05.w,vertical: 1.89.h),
                                        child: ListView.builder(
                                          itemCount:snapshot.data!.server1!.length,
                                          itemBuilder: (BuildContext context, int index2) {
                                            return Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(child: Image.network(snapshot.data!.server1![index2].photo.toString(),width: 24.10.w,height: 10.66.h,errorBuilder: (context, error, stackTrace) => SizedBox(width: 24.10.w,height:10.66.h,))),
                                                      SizedBox(width: 1.36.h,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Name : '+snapshot.data!.server1![index2].pname.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                          Text('Code : '+snapshot.data!.server1![index2].pcode.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                          Text('Quantity : '+snapshot.data!.server1![index2].qty.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                          Text('price : ₹ '+snapshot.data!.server1![index2].sprice.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 1.77.h,),
                                                  Text('Detail : '+snapshot.data!.server1![index2].pdesc.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                                                  Divider(color: Colors.black,),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
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
        ],
      ),
    );
  }
}