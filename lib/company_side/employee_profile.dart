import 'package:care_for_each/API/EmployeeEditConfirmAPI.dart';
import 'package:care_for_each/API/employee_data_API.dart';
import 'package:care_for_each/Models/EmployeeDataModel.dart';
import 'package:care_for_each/Models/EmployeeDeleteModel.dart';
import 'package:care_for_each/company_side/employee.dart';
import 'package:flutter/material.dart';
import '../API/employee_delete_API.dart';
import '../Models/EmployeeEditConfirmModel.dart';
import '../widgets/round_button.dart';
import 'package:sizer/sizer.dart';


class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({Key? key, required this.ename, required this.emailid, required this.designation, required this.joiningdate, required this.dob, required this.mobilenum, required this.address, required this.edu, required this.photo, required this.c_emailid, }) : super(key: key);
  final String ename,emailid,designation,joiningdate,dob,mobilenum,address,edu,photo,c_emailid;

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  String edit="";
  String showAlertEditDialog(BuildContext context,name,c_email,fname,initval) {
    TextEditingController value=TextEditingController(text: initval);
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
                onChanged: (val){
                  edit=val;
                  setState(() {

                  });
                },
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
                keyboardType: TextInputType.name,
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
                  child: InkWell(
                      onTap: (){
                        //val=value.text;
                      },
                      child: ElevatedButton(
                          onPressed: () async{
                            debugPrint(value.text);
                            debugPrint(widget.emailid);
                            EmployeeEditConfirmModel data = await EmployeeEditConfirmAPI().employee(widget.c_emailid, fname, value.text, widget.emailid);
                         //   Text(data.server![0].result.toString());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeProfile(c_emailid: widget.c_emailid,photo: widget.photo,address: widget.address,edu: widget.edu,mobilenum: widget.mobilenum,dob: widget.dob,joiningdate: widget.joiningdate,designation: widget.designation,emailid: widget.emailid,ename: widget.ename,key: widget.key,)));
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetail(c_emailid: widget.c_emailid,)));
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                          child: Text("Edit",style: TextStyle(color: Colors.white))
                      )

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
    return value.text;
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
            future: EmployeeDataAPI().employeeList(widget.c_emailid),
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
                          margin: EdgeInsets.symmetric(horizontal: 10.25.w),
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
                              padding:  EdgeInsets.symmetric(horizontal: 10.25,vertical: 1.77.h),
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
                                       width:38.46.w,
                                       child: TextFormField(
                                         controller:ename,
                                         decoration: InputDecoration(
                                           border: InputBorder.none,
                                           labelText: "Name"
                                         ),
                                       ),
                                     ),
                                      IconButton(onPressed: (){
                                        showAlertEditDialog(context, "Name", widget.c_emailid, "ename", ename.text);
                                       // editEmployeeProfile(widget.c_emailid, "ename", ename.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:38.46.w,
                                        child: TextFormField(
                                          controller:emailid,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Email id"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        showAlertEditDialog(context, "Email", widget.c_emailid, "emailid", emailid.text);
                                       // editEmployeeProfile("info@webearl.com", "emailid", emailid.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:38.46.w,
                                        child: TextFormField(
                                          controller:designation,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Designation"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        showAlertEditDialog(context, "Designation", widget.c_emailid, "designation", designation.text);
                                       // editEmployeeProfile(widget.c_emailid, "designation", designation.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:38.46.w,
                                        child: TextFormField(
                                          controller:dob,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Date of Birth"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        showAlertEditDialog(context, "DOB", widget.c_emailid, "dob", dob.text);
                                      //  editEmployeeProfile(widget.c_emailid, "dob", dob.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:38.46.w,
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
                                        width:38.46.w,
                                        child: TextFormField(
                                          controller:mobilenum,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Mobile No."
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        showAlertEditDialog(context, "Mobile no.", widget.c_emailid, "mobilenum", mobilenum.text);
                                       // editEmployeeProfile(widget.c_emailid, "mobilenum", mobilenum.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:38.46.w,
                                        child: TextFormField(
                                          controller:address,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Address"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        showAlertEditDialog(context, "Address", widget.c_emailid, "address", address.text);
                                    //    editEmployeeProfile(widget.c_emailid, "address", address.text);
                                      },icon: Icon(Icons.edit,color: Colors.teal,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:38.46.w,
                                        child: TextFormField(
                                          controller:edu,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Education"
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        showAlertEditDialog(context, "Education", widget.c_emailid, "edu", edu.text);
                                      //  editEmployeeProfile(widget.c_emailid, "edu", edu.text);
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
                    onTap: () async{
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
                  onPressed: () async{
                    EmployeeDeleteModel data= await EmployeeDeleteAPI().employee(widget.c_emailid, e_emailid);
                    debugPrint(data.server![0].result.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeProfile(c_emailid: widget.c_emailid,photo: widget.photo,address: widget.address,edu: widget.edu,mobilenum: widget.mobilenum,dob: widget.dob,joiningdate: widget.joiningdate,designation: widget.designation,emailid: widget.emailid,ename: widget.ename,key: widget.key,)));
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


}

