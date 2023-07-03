import 'package:care_for_each/API/EmployeeSide/employee_complaint_insert_API.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeComplaintInsertModel.dart';
import 'package:care_for_each/ui/dashboard.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewComplaint extends StatefulWidget {
  const NewComplaint({Key? key}) : super(key: key);

  @override
  State<NewComplaint> createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _subject= TextEditingController();
  TextEditingController _description= TextEditingController();

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
          "New Compaint",
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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 11.02.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.92.h,
                    width: 77.94.w,
                    child: TextFormField(
                      controller: _subject,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter subject';
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromRGBO(12, 25, 71, 1)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: "Write a subject",
                          labelStyle: TextStyle(color: Color.fromRGBO(12, 25, 71, 1))),
                    ),
                  ),
                  SizedBox(height: 3.55.h,),
                  SizedBox(
                    height: 5.92.h,
                    width: 77.94.w,
                    child: TextFormField(
                      controller: _description,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter subject';
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromRGBO(12, 25, 71, 1)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: "Write a description",
                          labelStyle: TextStyle(color: Color.fromRGBO(12, 25, 71, 1))),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5.92.h,
              width: 77.94.w,
              child: ElevatedButton(
                  onPressed: () async{
                    print(getEName);
                    print(_subject.text.toString());
                    print(_description.text.toString());
                    EmployeeComplaintInsert data = await EmployeeComplaintInsertAPI().complaint(getEName, _subject.text.toString(), _description.text.toString());
                    if(formKey.currentState!.validate() && data.server![0].result.toString() == "success"){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(e_emailid: getEName!,)));
                    }

                  },
                  child: Text(
                    "Submit Complaint",
                    style: TextStyle(
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
