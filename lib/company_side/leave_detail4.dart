import 'package:care_for_each/company_side/company_dashboard.dart';
import 'package:care_for_each/company_side/leave_detail2.dart';
import 'package:care_for_each/company_side/leave_detail3.dart';
import 'package:flutter/material.dart';
import '../widgets/alert_widget.dart';
import 'company_profile.dart';
import 'leave_detail.dart';
import 'package:sizer/sizer.dart';

class LeaveDetail4 extends StatefulWidget {
  const LeaveDetail4({Key? key}) : super(key: key);

  @override
  State<LeaveDetail4> createState() => _LeaveDetail4State();
}

class _LeaveDetail4State extends State<LeaveDetail4> {
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail1()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail2()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail3()));
                  },
                  child: Container(
                    height: 4.26.h,
                    width: 21.79.w,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(child: Text('Approved',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),),
                  ),
                ),
                InkWell(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDashboard()));
                  },
                  child: Container(
                    height: 4.26.h,
                    width: 21.79.w,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(12,25,71,1),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(child: Text('Rejected',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                showAlertDialog(context);
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 16.94.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.35.h),
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
                            padding: EdgeInsets.symmetric(horizontal: 3.58.w,vertical: 3.58.w),
                            child: Image.asset('assets/img_4.png',height: 7.93.h,width: 15.38.w,),
                          ),
                          SizedBox(width: 3.33.w,),
                          SizedBox(
                            width: 48.71.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Designation : React JS Intern',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Start Date : 01-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('End Date : 05-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                //Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                                Text('Reason : ciuvq wertyuiopk fdjydjd fnvk dfu nz,knfv ufdyuvgfvd knvufvu',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                showAlertDialog(context);
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 16.94.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.35.h),
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
                            padding: EdgeInsets.symmetric(horizontal: 3.58.w,vertical: 3.58.w),
                            child: Image.asset('assets/img_4.png',height: 7.93.h,width: 15.38.w,),
                          ),
                          SizedBox(width: 3.33.w,),
                          SizedBox(
                            width: 48.71.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Designation : React JS Intern',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Start Date : 01-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('End Date : 05-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                //Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                                Text('Reason : ciuvq wertyuiopk fdjydjd fnvk dfu nz,knfv ufdyuvgfvd knvufvu',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                showAlertDialog(context);
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 16.94.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.35.h),
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
                            padding: EdgeInsets.symmetric(horizontal: 3.58.w,vertical: 3.58.w),
                            child: Image.asset('assets/img_4.png',height: 7.93.h,width: 15.38.w,),
                          ),
                          SizedBox(width: 3.33.w,),
                          SizedBox(
                            width: 48.71.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Designation : React JS Intern',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Start Date : 01-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('End Date : 05-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                //Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                                Text('Reason : ciuvq wertyuiopk fdjydjd fnvk dfu nz,knfv ufdyuvgfvd knvufvu',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                showAlertDialog(context);
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 16.94.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.35.h),
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
                            padding: EdgeInsets.symmetric(horizontal: 3.58.w,vertical: 3.58.w),
                            child: Image.asset('assets/img_4.png',height: 7.93.h,width: 15.38.w,),
                          ),
                          SizedBox(width: 3.33.w,),
                          SizedBox(
                            width: 48.71.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Designation : React JS Intern',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Start Date : 01-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('End Date : 05-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                //Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                                Text('Reason : ciuvq wertyuiopk fdjydjd fnvk dfu nz,knfv ufdyuvgfvd knvufvu',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                showAlertDialog(context);
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 16.94.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.35.h),
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
                            padding: EdgeInsets.symmetric(horizontal: 3.58.w,vertical: 3.58.w),
                            child: Image.asset('assets/img_4.png',height: 7.93.h,width: 15.38.w,),
                          ),
                          SizedBox(width: 3.33.w,),
                          SizedBox(
                            width: 48.71.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Designation : React JS Intern',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('Start Date : 01-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                Text('End Date : 05-06-2023',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                //Text('Detail : jwafcha iu vgfifewacy uew uy eyga 8ewgkewugyug eygfbnakv gk hfidygfbf 7rfg rewkyufg krey gfohorev  98ryf9hrv9h bhfk ewiuv',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                                Text('Reason : ciuvq wertyuiopk fdjydjd fnvk dfu nz,knfv ufdyuvgfvd knvufvu',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


showAlertDialog(BuildContext context) {

  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromRGBO(2, 25, 71, 1),
    title: AlertWidget(),
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
