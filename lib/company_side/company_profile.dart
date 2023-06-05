import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:care_for_each/Models/CompanyProfileModel.dart';

import '../API/CompanyProfileAPI.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({Key? key}) : super(key: key);
 // const CompanyProfile({super.key,required this.emailid});
  //  const OTP({super.key, required this.phone});
  // final String emailid;
  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}


class _CompanyProfileState extends State<CompanyProfile> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Profile"),),
        // automaticallyImplyLeading: false,
        // shadowColor: Colors.teal,
        // toolbarHeight: 250,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(190),bottomRight: Radius.circular(190))),
        // flexibleSpace: Column(
        //   children: [
        //     Row(
        //       children: [
        //         SizedBox(height: 100,),
        //         Icon(Icons.arrow_back,color: Colors.white),
        //         SizedBox(width: 20,),
        //         Text("Profile",style: TextStyle(color: Colors.white,fontSize: 20),)
        //       ],
        //     ),
        //
        //     CircleAvatar(
        //         child: Text("AS"),
        //       backgroundImage: AssetImage("assets/cart.png"),
        //       radius: 30,
        //     )
        //   ],
        // ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/Ellipse 5 (2).png")),
                  ),
                  child: FutureBuilder<CompanyProfileModel>(
                    future: CompanyProfileApi().profileList("info@webearl.com"),//aya login kru to email login kari eno levo che
                    builder: (BuildContext context, snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Text("Loading");
                      }
                      else if (snapshot.hasData){
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                      height: 120,width: 120,
                                      child: CircleAvatar(
                                        child:  Image.network(
                                          snapshot.data!.server![0].cPhoto.toString(),
                                        ),
                                        backgroundColor: Colors.white,
                                      )
                                  )
                                  // child: Text( snapshot.data!.server![0].cPhoto.toString(),style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                                  // ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data!.server![0].cname.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(13, 46, 85, 1)),
                                ),
                                Text(
                                  snapshot.data!.server![0].emailid.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(13, 46, 85, 1)),
                                ),
                              ],
                            ),
                          );

                      }
                      else{
                        return Text("No data");
                      }
                    },

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/dashboard.png'),
                  ),
                  SizedBox(
                      width: 55
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        //  Navigator.pushNamed(context, '/attendance');
                      },
                      child: Text("Dashboard",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/order.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        //  Navigator.pushNamed(context, '/attendance');
                      },
                      child: Text("Order",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/calender.png'),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        //  Navigator.pushNamed(context, '/attendance');
                      },
                      child: Text("Attendance",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/employee.png'),
                  ),
                  SizedBox(
                      width: 55
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        //  Navigator.pushNamed(context, '/attendance');
                      },
                      child: Text("Employee",
                        style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/ginnie_box.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
                        },
                        child: Text(
                          "Ginnie Box",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/visitor.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor()));
                        },
                        child: Text(
                          "Visitor",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/product.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                      },
                      child: Text("Products",
                        style: TextStyle(
                            color: Color.fromRGBO(9, 31, 87, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/leave_request.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveRequest()));
                        },
                        child: Text(
                          "Leave",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/category.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (contexxt)=>Customer()));
                        },
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/sub_category.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sales()));
                        },
                        child: Text(
                          "Sub Category",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/messages.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                        child: Text(
                          "Messages",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/complaint.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint()));
                        },
                        child: Text(
                          "Complaint",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/report.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint()));
                        },
                        child: Text(
                          "Report",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/contact.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
                        },
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 0.06 * (height),
              width: 0.9 * (width),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0,top: 4,bottom: 4,),
                    child: Image.asset('assets/how_it_works.png'),
                  ),
                  SizedBox(
                    width: 0.2 * (width),
                  ),
                  Center(
                      child: TextButton(
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox()));
                        },
                        child: Text(
                          "How it works?",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 31, 87, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
