import 'package:care_for_each/API/EmployeeEditConfirmAPI.dart';
import 'package:care_for_each/API/employee_data_API.dart';
import 'package:care_for_each/Models/EmployeeDataModel.dart';
import 'package:care_for_each/company_side/employee.dart';
import 'package:flutter/material.dart';
import '../API/employee_delete_API.dart';
import '../widgets/round_button.dart';
import 'package:sizer/sizer.dart';


class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({Key? key, required this.ename, required this.emailid, required this.designation, required this.joiningdate, required this.dob, required this.mobilenum, required this.address, required this.edu, required this.photo, required this.c_emailid, }) : super(key: key);
  final String ename,emailid,designation,joiningdate,dob,mobilenum,address,edu,photo,c_emailid;

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  showAlertEditDialog(BuildContext context,name,fname) {
    TextEditingController value=TextEditingController();
    late String val;
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromRGBO(2, 25, 71, 1),
      title: Text(name,style: TextStyle(color: Colors.white),),
      // content: Text("Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        Column(
          children: [
            SizedBox(
              height: 5.92.h,
              child: TextFormField(
                controller: value,
                style: TextStyle(color: Colors.white),
                validator: (value){
                  if(value!.isEmpty ){
                    return 'Enter correct name';
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0,color: Colors.white)
                    ),
                    labelText: "Edit ",
                    labelStyle: TextStyle(
                        color: Colors.white)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  print("fname : "+fname);
                  print("Controller value : "+value.text);

                },
                    child: Text("OK")
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                    child: Text("No",style: TextStyle(color: Colors.white))
                ),
               // SizedBox(width: 50,),
                InkWell(
                  onTap: (){
                    val=value.text;
                  },
                  child: FutureBuilder(
                      future: EmployeeEditConfirmAPI().employee("info@webearl.com", fname, value.text, ""),
                      builder: (context,snapshot){
                        return ElevatedButton(
                            onPressed: (){
                              print(snapshot.data!.server![0].result.toString());
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(pid: widget.pid)));
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                            child: Text("Edit",style: TextStyle(color: Colors.white)));
                      }

                  ),
                ),
              ],
            )



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
          "Employee Profile",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [

          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
            future: EmployeeDataAPI().employeeList("info@webearl.com"),
                builder: (BuildContext context, snapshot) {
              TextEditingController ename=TextEditingController(text: widget.ename);
              TextEditingController emailid=TextEditingController(text: widget.emailid);
              TextEditingController designation=TextEditingController(text: widget.designation);
              TextEditingController dob=TextEditingController(text: widget.dob);
              TextEditingController joiningdate=TextEditingController(text: widget.joiningdate);
              TextEditingController mobilenum=TextEditingController(text: widget.mobilenum);
              TextEditingController address=TextEditingController(text: widget.address);
              TextEditingController edu=TextEditingController(text: widget.edu);

                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else if(snapshot.hasData){
                    return Column(
                      children: [
                        Card(
                          margin: EdgeInsets.only(left: 40,right: 40),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Container(
                          //  height: 47.51.h,
                            width: 79.74.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.36.h),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(62, 86, 115, 0.2),
                                  Color.fromRGBO(184, 184, 184, 0.1)
                                ])
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40,right: 40,bottom: 17,top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(child: Container(child: Image.network(widget.photo.toString(),width: 20.51.w,height: 11.25.h,errorBuilder: (context, error, stackTrace) => SizedBox(child: Container(color: Colors.grey,),width: 20.51.w,height: 11.25.h,)))),
                                  SizedBox(height: 0.59.h,),
                                  //Image.asset("calender.png",width: 0.01*w),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     SizedBox(
                                       width:150,
                                       child: TextFormField(
                                         controller:ename,
                                         decoration: InputDecoration(
                                           border: InputBorder.none,
                                           labelText: "Name"
                                         ),
                                       ),
                                     ),
                                      IconButton(onPressed: (){
                                        editEmployeeProfile(widget.c_emailid, "ename", ename.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:150,
                                        child: TextFormField(
                                          controller:emailid,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Email id"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                       // editEmployeeProfile("info@webearl.com", "emailid", emailid.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:150,
                                        child: TextFormField(
                                          controller:designation,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Designation"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        editEmployeeProfile(widget.c_emailid, "designation", designation.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:150,
                                        child: TextFormField(
                                          controller:dob,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Date of Birth"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        editEmployeeProfile(widget.c_emailid, "dob", dob.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:150,
                                        child: TextFormField(
                                          controller:joiningdate,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Joining Date"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        editEmployeeProfile(widget.c_emailid, "joiningdate", joiningdate.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:150,
                                        child: TextFormField(
                                          controller:mobilenum,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Mobile No."
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        editEmployeeProfile(widget.c_emailid, "mobilenum", mobilenum.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:150,
                                        child: TextFormField(
                                          controller:address,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Address"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        editEmployeeProfile(widget.c_emailid, "address", address.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:150,
                                        child: TextFormField(
                                          controller:edu,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Education"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        editEmployeeProfile(widget.c_emailid, "edu", edu.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  else{
                    return Text("No data");
                  }
                },

            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.02.w,vertical: 3.w),
              child: Column(
                children: [
                  RoundButton(
                    title: "Delete Employee",
                    onTap: () {
                      showAlertDialog(context,widget.c_emailid,widget.emailid);
                    },
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

showAlertDialog(BuildContext context,emailid,e_emailid) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromRGBO(2, 25, 71, 1),
    title: Text("Are you sure want to DELETE ?",style: TextStyle(color: Colors.white),),
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
          SizedBox(width: 7.69.w,),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: ElevatedButton(
                onPressed: (){
                  FutureBuilder(
                    future: EmployeeDeleteAPI().employee("info@webearl.com",e_emailid),
                    builder: (BuildContext context, snapshot) {
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Text("Loading");
                      }
                      else if(snapshot.hasData){
                        return Column(
                          children: [
                            Text(snapshot.data!.server![0].result.toString())
                          ],
                        );
                      }
                      else{
                        return Text("No data");
                      }
                    },

                  );
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Employee(c_emailid:c_emailid ,)));
                },
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

editEmployeeProfile(c_emailid,fname,value){
  print("c_emailid : "+c_emailid);
  print("fname : "+fname);
  print("value : "+value);
  FutureBuilder(
    future: EmployeeEditConfirmAPI().employee(c_emailid, fname, value, ""),
    builder: (context,snapshot){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      );
    },

  );
}