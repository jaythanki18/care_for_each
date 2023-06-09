import 'package:care_for_each/API/order_master_display_API.dart';
import 'package:care_for_each/company_side/order_details.dart';
import 'package:flutter/material.dart';

import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final items=['All','This Year','This Month','Today'];
  String? dur='All';

  List<String> list2=['Employee','sindhav88@gmail.com'];
  String? emp_emailid='Employee';
  late String eid;
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
          "Order",
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 5.92.h,
                width: 37.92.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.teal,width: 2),
                ),
                child: DropdownButtonFormField<String>(
                  value: dur,
                  items: items.map((item) => DropdownMenuItem(
                    value: item,
                      child: Text(item,style: TextStyle(color: Colors.black),),
                  )
                  ).toList(),
                  onChanged: (item)=>setState((){
                    dur=item;
                    print(dur);
                  }),
                ),
              ),

              Container(
                width: 55.92.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.teal,width: 2),
                ),
                child: DropdownButtonFormField<String>(
                  value: emp_emailid,
                  items: list2.map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item,style: TextStyle(color: Colors.black,),),
                  )
                  ).toList(),
                  onChanged: (item)=>setState((){
                    emp_emailid=item;
                    eid=emp_emailid!;
                    print("eid : "+eid);
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.10.h,),
          FutureBuilder(
              future: OrderMasterDisplayAPI().orderList("info@webearl.com",dur,emp_emailid),
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
                                SizedBox(height: 1.18.h,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(oid: snapshot.data!.server![index].oid.toString(),eid: eid)));
                                  },
                                  child: Card(
                                    margin: EdgeInsets.symmetric(horizontal: 10.2.w),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      height: 34.36.h,
                                      width: 79.74.w,
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
                                            Center(child: Container(child: Image.asset("assets/img_4.png",width: 20.5.w,height: 11.25.h,))),
                                            SizedBox(height: 0.59.h,),
                                            //Image.asset("calender.png",width: 0.01*w),
                                            Text('Name : '+snapshot.data!.server![index].customername.toString(),style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Company Name : '+snapshot.data!.server![index].companyname.toString(),style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                            Text('Email : '+snapshot.data!.server![index].custEmailid.toString(),style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Contact No : +'+snapshot.data!.server![index].custContactNum.toString(),style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Date : '+snapshot.data!.server![index].date.toString(),style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Grand Total : ₹'+snapshot.data!.server![index].grandtotal.toString(),style: TextStyle(fontSize: 11.37.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            //Text('Expected Date :${message}'),
                                          ],
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



