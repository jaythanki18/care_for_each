import 'package:care_for_each/API/EmployeeSide/employee_leave_add_API.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveAddModel.dart';
import 'package:care_for_each/ui/leave_request.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLeaveRequest extends StatefulWidget {
  const AddLeaveRequest({Key? key}) : super(key: key);

  @override
  State<AddLeaveRequest> createState() => _AddLeaveRequestState();
}

class _AddLeaveRequestState extends State<AddLeaveRequest> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController _reason = TextEditingController();
  String reason="";
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
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 33,right: 33),
              width: 83.07.w,
              height: 30.36.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(62, 86, 115, 0.2),
                    Color.fromRGBO(184, 184, 184, 0.1)
                  ]),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: startdate,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Value should not empty';
                        }
                      },
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
                    TextFormField(
                      controller: enddate,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Value should not empty';
                        }
                      },
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
                    TextFormField(
                      controller: _reason,
                      onChanged: (value){
                        reason=value;
                        setState(() {

                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Reason',
                        labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1,))
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 77.94.w,
              height: 5.92.h,
              child: ElevatedButton(
                  onPressed: () async{
                    print(getEName);
                    print(_reason.text);
                    print(enddate.text.toString());
                    print(startdate.text.toString());
                    EmployeeLeaveAddModel data = await EmployeeLeaveAddAPI().leave(getEName, _reason.text, enddate.text.toString(), startdate.text.toString(), "1");
                    if(formKey.currentState!.validate()){
                      const snackBar = SnackBar(
                        content: Text('Submitting Form'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveRequest()));
                    }
                    else{
                      const snackBar = SnackBar(
                        content: Text('Please Select Date'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                  },
                  child: Text(
                    "Add Leave",
                    style: TextStyle(
                      fontSize: 15.16.sp,
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
    );
  }
}
