import 'package:care_for_each/API/employee_data_API.dart';
import 'package:care_for_each/API/order_master_display_API.dart';
import 'package:care_for_each/Models/EmployeeDataModel.dart';
import 'package:care_for_each/company_side/order_details.dart';
import 'package:flutter/material.dart';
import 'company_dashboard.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class Order extends StatefulWidget {
  const Order({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callDisplayAPI();
  }
  final items=['All','This Year','This Month','Today'];
  String? dur='All';


  late List<String> list2=['Employee','sindhav88@gmail.com'];
  String? emp_emailid='sindhav88@gmail.com';
  late String eid;

  List<String>? CategoryList=[];
  var displayInitial;
  void callDisplayAPI() async{
    EmployeeDataModel data= await EmployeeDataAPI().employeeList(widget.c_emailid);
    setState(() {
      CategoryList = data.server?.map((e) => e.emailid.toString()).toList() ;
      displayInitial=data.server![0].emailid.toString();
    });
    for(int i=0;i<CategoryList!.length;i++){
      print(data.server![i].emailid.toString());
    }
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
                    MaterialPageRoute(builder: (context) => CompanyProfile(c_emailid: widget.c_emailid,)));
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
              Flexible(
                child: SizedBox(
               //   width: 30.w,
                  child: Container(
                   // height: 5.92.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: dur,
                      items: items.map((item) => DropdownMenuItem(
                        value: item,
                          child: Text(item,style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),maxLines: 1,),
                      )
                      ).toList(),
                      onChanged: (item)=>setState((){
                        dur=item;
                        print(dur);
                      }),
                    ),
                  ),
                ),
              ),
              Flexible(
                  child: SizedBox(
                   // width: 65.w,
                    child: Container(
                    //  width: 55.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.teal,width: 2),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: displayInitial,
                        items: CategoryList!.map((item) => DropdownMenuItem(
                          value: item,
                          child: SizedBox(width: 40.w,child: Text(item,style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                        )
                        ).toList(),
                        onChanged: (item)=>setState((){
                          displayInitial=item;
                          eid=displayInitial!;
                          print("eid : "+eid);
                        }),

                      ),
                    ),
                  ),
              )

            ],
          ),

          SizedBox(height: 1.10.h,),
          FutureBuilder(
              future: OrderMasterDisplayAPI().orderList(widget.c_emailid,dur,displayInitial),
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(oid: snapshot.data!.server![index].oid.toString(),eid: eid,c_emailid: widget.c_emailid,)));
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



