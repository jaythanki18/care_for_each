import 'package:care_for_each/API/EmployeeSide/employee_complaint_API.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeComplaintModel.dart';
import 'package:care_for_each/ui/care_for_each.dart';
import 'package:care_for_each/ui/new_complaint.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Complaint extends StatefulWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  String? getEName;
  String? getCName;
  void getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getEName=sharedPreferences.getString("email")!;
      getCName=sharedPreferences.getString('c_email');
    });
    debugPrint(getEName);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewComplaint()));
      },
          child: Icon(Icons.add),backgroundColor: Color.fromRGBO(12,25,71,1)),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
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
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: EmployeeComplaintAPI().complaint(getEName),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return  Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.server!.length,
                        itemBuilder: (context,index){
                          return   Column(
                            children: [
                              SizedBox(height: 1.h,),
                              Container(
                                margin: EdgeInsets.only(left: 39,right: 39),
                                decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Colors.teal, width: 2.56.w,),
                                      top: BorderSide(color: Colors.teal, width: 0.5.w),
                                      right:  BorderSide(color: Colors.teal, width: .5.w),
                                      bottom: BorderSide(color: Colors.teal, width: .5.w),
                                    )
                                ),
                                height: 23.69.h,
                                width: 79.74.w,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CareForEach()));
                                  },
                                  child: ClipPath(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border(
                                                    bottom: BorderSide(color: Colors.teal,width: .5.w),
                                                    top: BorderSide(color: Colors.teal,width: .5.w),
                                                    left: BorderSide(color: Colors.teal,width: .5.w),
                                                    right: BorderSide(color: Colors.teal,width: .5.w))

                                            ),
                                            child: Center(child: Text("CD",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 22.79.sp),)),
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 0.94.h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(width:40.w,child: Text("Id : ${snapshot.data!.server![index].comid.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold))),
                                              SizedBox(height: 1.h,),
                                              SizedBox(width:40.w,child: Text("Subject : ${snapshot.data!.server![index].subject.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold))),
                                              SizedBox(height: 1.h,),
                                              SizedBox(width:40.w,child: Text("Description :  ${snapshot.data!.server![index].description.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold))),
                                              SizedBox(height: 1.h,),
                                              SizedBox(width:40.w,child: Text("Date : ${snapshot.data!.server![index].date.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold)))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(.35.h))),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                  );
                }
                else{
                  return Text("No data");
                }
              }
          ),

          // SizedBox(height: 10,),
          // Container(
          //   margin: EdgeInsets.only(left: 39,right: 39),
          //   decoration: BoxDecoration(
          //       border: Border(
          //         left: BorderSide(color: Colors.teal, width: 2.56.w,),
          //         top: BorderSide(color: Colors.teal, width: 0.5.w),
          //         right:  BorderSide(color: Colors.teal, width: .5.w),
          //         bottom: BorderSide(color: Colors.teal, width: .5.w),
          //       )
          //   ),
          //   height: 23.69.h,
          //   width: 79.74.w,
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>CareForEach()));
          //     },
          //     child: ClipPath(
          //       child: Row(
          //         children: [
          //           Container(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(100),
          //                   border: Border(
          //                       bottom: BorderSide(color: Colors.teal,width: .5.w),
          //                       top: BorderSide(color: Colors.teal,width: .5.w),
          //                       left: BorderSide(color: Colors.teal,width: .5.w),
          //                       right: BorderSide(color: Colors.teal,width: .5.w))
          //
          //               ),
          //               child: Center(child: Text("CD",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 22.79.sp),)),
          //             ),
          //           ),
          //           Padding(
          //             padding:  EdgeInsets.symmetric(horizontal: 0.94.h),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("Name : ABC",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold)),
          //                 SizedBox(height: 1.h,),
          //                 Text("Subject : Payment",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold)),
          //                 SizedBox(height: 1.h,),
          //                 Text("Description :  XYZ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold)),
          //                 SizedBox(height: 1.h,),
          //                 Text("Date : 01-03-2023",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold))
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //       clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(.35.h))),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 10,),
          // Container(
          //   margin: EdgeInsets.only(left: 39,right: 39),
          //   decoration: BoxDecoration(
          //       border: Border(
          //         left: BorderSide(color: Colors.teal, width: 2.56.w,),
          //         top: BorderSide(color: Colors.teal, width: 0.5.w),
          //         right:  BorderSide(color: Colors.teal, width: .5.w),
          //         bottom: BorderSide(color: Colors.teal, width: .5.w),
          //       )
          //   ),
          //   height: 23.69.h,
          //   width: 79.74.w,
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>CareForEach()));
          //     },
          //     child: ClipPath(
          //       child: Row(
          //         children: [
          //           Container(
          //             child: Container(
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(100),
          //                   border: Border(
          //                       bottom: BorderSide(color: Colors.teal,width: .5.w),
          //                       top: BorderSide(color: Colors.teal,width: .5.w),
          //                       left: BorderSide(color: Colors.teal,width: .5.w),
          //                       right: BorderSide(color: Colors.teal,width: .5.w))
          //
          //               ),
          //               child: Center(child: Text("CD",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold,fontSize: 22.79.sp),)),
          //             ),
          //           ),
          //           Padding(
          //             padding:  EdgeInsets.symmetric(horizontal: 0.94.h),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("Name : ABC",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold)),
          //                 SizedBox(height: 1.h,),
          //                 Text("Subject : Payment",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold)),
          //                 SizedBox(height: 1.h,),
          //                 Text("Description :  XYZ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold)),
          //                 SizedBox(height: 1.h,),
          //                 Text("Date : 01-03-2023",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontWeight: FontWeight.bold))
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //       clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(.35.h))),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
