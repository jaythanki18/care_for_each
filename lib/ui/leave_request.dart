import 'package:care_for_each/API/EmployeeSide/employee_leave_API.dart';
import 'package:care_for_each/API/EmployeeSide/employee_profile_API.dart';
import 'package:care_for_each/ui/add_leave_request.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({Key? key}) : super(key: key);

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {

  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  @override
  void initState() {
    startdate.text = ""; //set the initial value of text field
    enddate.text="";
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddLeaveRequest()));
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
          "Leave Request",
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
              future: EmployeeLeaveAPI().leave(getEName),
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
                          return  Column(
                            children: [
                              SizedBox(height: 1.h,),
                              Container(
                              //  height: 44.78.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(62, 86, 115, 0.2),
                                      Color.fromRGBO(184, 184, 184, 0.1)
                                    ]),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(left: 15.0,top: 19),
                                          child: Image.network(snapshot.data!.server![index].ephoto.toString(),height: 11.25.h,width: 20.51.w,errorBuilder: (context, error, stackTrace) => SizedBox(width: 20.51.w,height: 11.25.h,)),
                                        ),
                                        SizedBox(width: 1.h,),
                                        FutureBuilder(
                                            future: EmployeeProfileAPI().profile(getEName),
                                            builder: (BuildContext context, snapshot2){
                                              if(snapshot2.connectionState==ConnectionState.waiting){
                                                return Center(child: CircularProgressIndicator(),);
                                              }
                                              else if(snapshot2.hasData){
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 1.3.h,),
                                                    SizedBox(width: 45.w,child: Text("Person Name : ${snapshot2.data!.server![0].ename.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                                                    SizedBox(height: 1.3.h,),
                                                    SizedBox(width: 45.w,child: Text("Contact No : ${snapshot2.data!.server![0].mobilenum}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                                                    SizedBox(height: 1.3.h,),
                                                    SizedBox(width: 45.w,child: Text("Email Id : ${snapshot2.data!.server![0].emailid.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,))
                                                  ],
                                                );

                                              }
                                              else{
                                                return Text("No data");
                                              }
                                            }
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 11.53.w),
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: startdate,
                                            //editing controller of this TextField
                                            decoration: InputDecoration(

                                                labelText: "${snapshot.data!.server![index].leavestartdate.toString()}" ,//label text of field
                                                labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1,)),
                                                suffixIcon: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(12,25,71,1),)
                                            ),
                                            readOnly: true,
                                            //set it true, so that user will not able to edit text
                                            onTap: () async {
                                              DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2100));

                                              if (pickedDate != null) {
                                                print(
                                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                String formattedDate =
                                                DateFormat('yyyy-MM-dd').format(pickedDate);
                                                print(
                                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                                setState(() {
                                                  startdate.text =
                                                      formattedDate; //set output date to TextField value.
                                                });
                                              } else {}
                                            },
                                          ),
                                          TextField(
                                            controller: enddate,
                                            //editing controller of this TextField
                                            decoration: InputDecoration(
                                                labelText: "${snapshot.data!.server![index].leaveenddate.toString()}" ,//label text of field
                                                labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1,)),
                                                suffixIcon: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(12,25,71,1),)
                                            ),
                                            readOnly: true,
                                            //set it true, so that user will not able to edit text
                                            onTap: () async {
                                              DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2100));

                                              if (pickedDate != null) {
                                                print(
                                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                String formattedDate =
                                                DateFormat('yyyy-MM-dd').format(pickedDate);
                                                print(
                                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                                setState(() {
                                                  enddate.text =
                                                      formattedDate; //set output date to TextField value.
                                                });
                                              } else {}
                                            },
                                          ),
                                        //  Text(snapshot.data!.server![index].reason.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1)),),
                                          TextField(
                                            decoration: InputDecoration(
                                                labelText: "${snapshot.data!.server![index].reason.toString()}",
                                                labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                                            ),
                                          ),
                                          SizedBox(height: 1.5.h,),
                                          Container(
                                            width: 53.33.w,
                                            height: 6.27.h,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                                                },
                                                child: Text(
                                                  "Status : ${snapshot.data!.server![index].status.toString()}",
                                                  style: TextStyle(
                                                    fontSize: 12.12.sp,
                                                    color: Colors.teal, ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                    shadowColor: Colors.white,
                                                    side: const BorderSide(
                                                      width: 1.0,
                                                      color: Colors.teal,
                                                    ))),
                                          ),
                                          SizedBox(height: 0.5.h,)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      )
                  );
                }
                else{
                  return Center(
                      child: Text("No data")
                  );
                }
              }
          ),


        ],
      ),
    );
  }
}
