import 'package:care_for_each/company_side/company_dashboard.dart';
import 'package:care_for_each/company_side/leave_detail2.dart';
import 'package:care_for_each/company_side/leave_detail4.dart';
import 'package:flutter/material.dart';

import '../API/employee_leave_API.dart';
import 'company_profile.dart';
import 'leave_detail.dart';
import 'package:sizer/sizer.dart';

class LeaveDetail3 extends StatefulWidget {
  const LeaveDetail3({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<LeaveDetail3> createState() => _LeaveDetail3State();
}

class _LeaveDetail3State extends State<LeaveDetail3> {
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
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Leave Detail",
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
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail1(c_emailid: widget.c_emailid,)));
                },
                child: Container(
                  height: 4.26.h,
                  width: 21.79.w,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(child: Text('All',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),),
                ),
              ),
              InkWell(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail2(c_emailid: widget.c_emailid,)));
                },
                child: Container(
                  height: 4.26.h,
                  width: 21.79.w,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(child: Text('Pending',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),),
                ),
              ),
              InkWell(
                onTap: (){
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
                },
                child: Container(
                  height: 4.26.h,
                  width: 21.79.w,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(12,25,71,1),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(child: Text('Approved',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail4(c_emailid: widget.c_emailid,)));
                },
                child: Container(
                  height: 4.26.h,
                  width: 21.79.w,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(child: Text('Rejected',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.36.h,),
          FutureBuilder(
              future: EmployeeLeaveAPI().leave(widget.c_emailid, "Approved"),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            return Card(
                              margin: EdgeInsets.only(left: 40,right: 39,top: 5,bottom: 5),
                              shadowColor: Colors.grey,
                              elevation: 4,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                              child: Container(
                                height: 16.94.h,
                                width: 79.74.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.36.h),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(62, 86, 115, 0.2),
                                      Color.fromRGBO(184, 184, 184, 0.1)
                                    ])
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 0.59.h,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 3.58.w,vertical: 3.58.h),
                                            child: Image.network(snapshot.data!.server![index].photo.toString(),height: 67,width: 60,errorBuilder: (context, error, stackTrace) => SizedBox(width: 60,height: 67,))
                                        ),
                                        SizedBox(width: 13,),
                                        SizedBox(
                                          width: 48.71.w,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Name : '+snapshot.data!.server![index].ename.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                              Text('Designation : '+snapshot.data!.server![index].designation.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                              Text('Start Date : '+snapshot.data!.server![index].leavestartdate.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                              Text('End Date : '+snapshot.data!.server![index].leaveenddate.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                              //Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                                              Text('Reason : '+snapshot.data!.server![index].reason.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
