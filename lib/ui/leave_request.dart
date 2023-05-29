import 'package:care_for_each/ui/add_leave_request.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 44.78.h,
              width: 79.74.w,
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
                        child: Image.asset("assets/img_4.png",height: 11.25.h,width: 20.51.w,),
                      ),
                      SizedBox(width: 1.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.3.h,),
                          Text("Company Name : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1.3.h,),
                          Text("Person Name : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1.3.h,),
                          Text("Contact No : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1.3.h,),
                          Text("Email Id : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),)
                        ],
                      )
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
                              labelText: "Start Date" ,//label text of field
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
                              labelText: "End Date" ,//label text of field
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
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Reason",
                            labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                          ),
                        ),
                        SizedBox(height: 18,),
                        Container(
                          width: 53.33.w,
                          height: 6.27.h,
                          child: ElevatedButton(
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                              },
                              child: Text(
                                "Status : Pending",
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            Container(
              height: 44.78.h,
              width: 79.74.w,
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
                        child: Image.asset("assets/img_4.png",height: 11.25.h,width: 20.51.w,),
                      ),
                      SizedBox(width: 1.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.3.h,),
                          Text("Company Name : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1.3.h,),
                          Text("Person Name : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1.3.h,),
                          Text("Contact No : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1.3.h,),
                          Text("Email Id : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 8.34.sp,fontWeight: FontWeight.bold),)
                        ],
                      )
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
                              labelText: "Start Date" ,//label text of field
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
                              labelText: "End Date" ,//label text of field
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
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Reason",
                              labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                          ),
                        ),
                        SizedBox(height: 18,),
                        Container(
                          width: 53.33.w,
                          height: 6.27.h,
                          child: ElevatedButton(
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                              },
                              child: Text(
                                "Status : Pending",
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
