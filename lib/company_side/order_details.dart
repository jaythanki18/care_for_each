import 'package:care_for_each/company_side/order_product_details.dart';
import 'package:flutter/material.dart';
import '../API/order_detail_display_API.dart';
import '../widgets/round_button.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.oid, required this.eid}) : super(key: key);

  final String oid,eid;
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
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
          "Order Details",
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
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
                future: OrderDetailDisplayAPI().orderDetailList("info@webearl.com", widget.oid, widget.eid),
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
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      height: 34.88.h,
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(child: Container(child: Image.network(snapshot.data!.server![index].employeePhoto.toString(),width: 20.51.w,height: 11.25.h,errorBuilder: (context, error, stackTrace) => SizedBox(width: 25.64.w,height: 100,)))),
                                            SizedBox(height: 0.59.h,),
                                            //Image.asset("calender.png",width: 0.01*w),
                                            Text('Person Name : '+snapshot.data!.server![index].customername.toString(),style: TextStyle(fontSize: 10.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Company Name : '+snapshot.data!.server![index].customercompanyname.toString(),style: TextStyle(fontSize: 10.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                            Text('Email : '+snapshot.data!.server![index].customeremailid.toString(),style: TextStyle(fontSize: 10.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            Text('Contact No : '+snapshot.data!.server![index].customercontactno.toString(),style: TextStyle(fontSize: 10.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Date : '+snapshot.data!.server![index].date.toString(),style: TextStyle(fontSize: 10.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Remind Date : '+snapshot.data!.server![index].remindDate.toString(),style: TextStyle(fontSize: 10.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Remaining Amount : ₹'+snapshot.data!.server1![index].pendingAmount.toString(),style: TextStyle(fontSize: 10.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            //Text('Expected Date :${message}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.08.h,),
                                  RoundButton(
                                    title: "Grand Total : ₹ "+snapshot.data!.server![index].grandtotal.toString(),
                                    onTap: () {
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
                                    },
                                  ),
                                  SizedBox(height: 1.41.h,),
                                  RoundButton(
                                    title: "Paid Amount : ₹ "+snapshot.data!.server![index].paidamount.toString(),
                                    onTap: () {
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
                                    },
                                  ),
                                  SizedBox(height: 2.25.h,),
                                  Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                                    child: Container(
                                      height: 11.72.h,
                                      width: 79.74.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2.36.h),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(62, 86, 115, 0.2),
                                            Color.fromRGBO(184, 184, 184, 0.1)
                                          ])
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.38.w),
                                            child: Text('Employee Details',style: TextStyle(fontSize: 12.89.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1),decoration: TextDecoration.underline),overflow: TextOverflow.ellipsis,maxLines: 1),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.97.w,),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Name : '+snapshot.data!.server![index].ename.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                                Text('Designation : '+snapshot.data!.server![index].employeeDesignation.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                Text('Email : '+snapshot.data!.server![index].eEmailid.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.25.h,),
                                  Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      height: 11.72.h,
                                      width: 79.74.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2.36.h),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(62, 86, 115, 0.2),
                                            Color.fromRGBO(184, 184, 184, 0.1)
                                          ])
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 5.38.w),
                                            child: Text('Payment Detail :',style: TextStyle(fontSize: 12.89.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1),decoration: TextDecoration.underline),overflow: TextOverflow.ellipsis,maxLines: 1),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.97.w),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Date : '+snapshot.data!.server1![index].date.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                                Text('Payment type : '+snapshot.data!.server1![index].paymenttype.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                Text('Paid Amount : ₹ '+snapshot.data!.server1![index].amount.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 0.59.h,),
                                  Container(
                                    width: 79.74.w,
                                    height: 5.92.h,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderProductDetail(oid: widget.oid,)));
                                        },
                                        child: Text(
                                          "View Product",
                                          style: TextStyle(color: Colors.teal),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  )
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
      ),
    );
  }
}
