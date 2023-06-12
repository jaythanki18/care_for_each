import 'package:care_for_each/API/employee_today_attendance_API.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../ui/profile.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'company_dashboard.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<Attendance> createState() => _AttendanceState();

}

class _AttendanceState extends State<Attendance> {
  TextEditingController dateInput2 = TextEditingController();
  late String formattedDate2=DateTime.now().toString();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateInput2.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Attendance",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [

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
      // body: TableCalendar(
      //   firstDay: DateTime.utc(2010, 10, 16),
      //   lastDay: DateTime.utc(2030, 3, 14),
      //   focusedDay: DateTime.now(),
      //
      // ),
      body:   Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 63.0),
            child: Container(
              height: 5.h,
              child: ElevatedButton(
                  onPressed: ()async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      formattedDate2 =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print("Date :- "+formattedDate2); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput2.text = formattedDate2;

                      });
                    } else {}

                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                  },
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Date",
                        style: TextStyle(
                            color: Colors.teal, fontSize: 7.583.sp),
                      ),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.teal,
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shadowColor: Colors.white,
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.teal,
                      ))
              ),
            ),
          ),
          SizedBox(height: 1.10.h,),

          FutureBuilder(
              future: EmployeeTodayAttendanceAPI().employee(widget.c_emailid,formattedDate2),
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
                                SizedBox(height: 10,),
                                Card(
                                  // margin: EdgeInsets.only(left: 40,right: 40),
                                  shadowColor: Colors.grey,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                  //  height: 45.26.h,
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
                                          Center(child: Image.network(snapshot.data!.server![index].employeePhoto.toString(),width: 80,height: 95,errorBuilder: (context, error, stackTrace) => SizedBox(width: 25.64.w,height: 100,))),
                                          Text('Result : '+snapshot.data!.server![index].result.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                          Text('Login Time: '+snapshot.data!.server![index].logintime.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                          Text('Logout Time : '+snapshot.data!.server![index].logouttime.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                          Text('Login Date : '+snapshot.data!.server![index].loginDate.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                          Text('Long login : '+snapshot.data!.server![index].longLogin.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                          Text('Late login : '+snapshot.data!.server![index].lateLogin.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          Text('Long logout : '+snapshot.data!.server![index].longLogout.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          Text('Location login : '+snapshot.data!.server![index].locationLogin.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          Text('Location logout : '+snapshot.data!.server![index].locationLogout.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          Text('Logout date : '+snapshot.data!.server![index].logoutDate.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          Text('Employee name : '+snapshot.data!.server![index].employeeName.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          Text('Employee designation : '+snapshot.data!.server![index].employeeDesignation.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          Text('Employee email : '+snapshot.data!.server![index].eEmailid.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          // Text('Long logout : '+snapshot.data!.server![index].lateLogout.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                          // Text('Long logout : '+snapshot.data!.server![index].lateLogout.toString(),style: TextStyle(fontSize: 12.13.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),

                                          //Text('Expected Date :${message}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ) ;
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
