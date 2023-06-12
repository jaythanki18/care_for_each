import 'package:care_for_each/company_side/company_profile.dart';
import 'package:care_for_each/company_side/complaint_detail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../API/employee_complain_API.dart';

class Complaint extends StatefulWidget {
  const Complaint({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
          "Compaint",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(9, 31, 87, 1),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: EmployeeComplainAPI().complainList(widget.c_emailid),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            return  Column(
                              children: [

                                Container(
                                  margin: EdgeInsets.only(left: 39,right: 39),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.teal, width: 1.36.h,),
                                        top: BorderSide(color: Colors.teal, width: 0.23.h),
                                        right:  BorderSide(color: Colors.teal, width: 0.23.h),
                                        bottom: BorderSide(color: Colors.teal, width: 0.23.h),
                                      )
                                  ),
                                  height: 23.69.h,
                                  width: 80.74.w,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail(name: snapshot.data!.server![index].ename.toString(),c_emailid: widget.c_emailid,)));
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 13.w,
                                          backgroundColor: Colors.teal,
                                          child: CircleAvatar(
                                              radius: 12.w,
                                              backgroundImage: NetworkImage(snapshot.data!.server![index].photo.toString())
                                          ),
                                        ),

                                          Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 180,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Name : "+snapshot.data!.server![index].ename.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp,overflow: TextOverflow.ellipsis),maxLines: 1,),
                                                SizedBox(height: 1.36.h,),
                                                Text("Designation : "+snapshot.data!.server![index].designation.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp,overflow: TextOverflow.ellipsis),maxLines: 2,),
                                                SizedBox(height: 1.36.h,),
                                                Text("Subject : "+snapshot.data!.server![index].subject.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp,overflow: TextOverflow.ellipsis),maxLines: 1,),
                                                SizedBox(height: 1.36.h,),
                                                Text("Description :  "+snapshot.data!.server![index].description.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp,overflow: TextOverflow.ellipsis),maxLines: 3,),
                                                SizedBox(height: 1.36.h,),
                                                Text("Date : "+snapshot.data!.server![index].date.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 9.09.sp,overflow: TextOverflow.ellipsis),maxLines: 2,)
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.36.h,),
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
