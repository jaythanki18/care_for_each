import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';


class LeaveReport extends StatefulWidget {
  const LeaveReport({Key? key, required this.c_email}) : super(key: key);

  final String c_email;
  @override
  State<LeaveReport> createState() => _LeaveReportState();
}

class _LeaveReportState extends State<LeaveReport> {
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
          "Leave Report",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(9, 31, 87, 1),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile(c_emailid: widget.c_email,)));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body:  Card(
        margin: EdgeInsets.symmetric(horizontal: 10.25.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 32.h,
          width: 79.74.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(62, 86, 115, 0.2),
                Color.fromRGBO(184, 184, 184, 0.1)
              ])
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Leave Report :',style: TextStyle(fontSize: 13.64.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1),decoration: TextDecoration.underline),overflow: TextOverflow.ellipsis,maxLines: 1),
                SizedBox(height: 1.36.h,),
                Container(
                  child: Center(
                    child: Container(
                      height: 4.14.h,
                      width: 69.23.w,
                      child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                          },
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select Employee",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.61.sp),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.black,
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shadowColor: Colors.white,
                              side: const BorderSide(
                                width: 1.0,
                                color: Colors.black,
                              ))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25.64.w,
                      child: TextField(
                        controller: startdate,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                            labelText: "Start Date" ,//label text of field
                            labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1,),fontSize: 9.09.sp),
                            suffixIcon: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(12,25,71,1),)
                        ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
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
                    ),
                    SizedBox(width: 0.59.h,),
                    SizedBox(
                      width: 25.64.w,
                      child: TextField(
                        controller: startdate,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                            labelText: "End Date" ,//label text of field
                            labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1,),fontSize: 9.09.sp),
                            suffixIcon: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(12,25,71,1),)
                        ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
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
                    ),
                  ],
                ),
                SizedBox(height: 2.36.h,),
                Row(
                  children: [
                    Image.asset('assets/excel.png',height: 5.92.h,width: 5.92.h,),
                    SizedBox(width: 6.15.w,),
                    Text('Total Result : ',style: TextStyle(fontSize: 13.64.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1),decoration: TextDecoration.underline),overflow: TextOverflow.ellipsis,maxLines: 1),
                  ],
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 4.26.h,
                    width: 21.79.w,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('OK',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
