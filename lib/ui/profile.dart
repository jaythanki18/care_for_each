import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Profile"),
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/Ellipse 5 (2).png")),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.10,
                            child: Center(
                              child: Text(
                                "AS",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Ashok Sindhav",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(13, 46, 85, 1)),
                          ),
                          Text(
                            "Sindhav88@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(13, 46, 85, 1)),
                          ),
                          Text(
                            "Python Dev",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(13, 46, 85, 1)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/calender.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/attendance');
                              },
                              child: Text(
                                "Attendance",
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
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/product.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Products",
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
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/visitor.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
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
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/customer.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Customer",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/sales.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Sales",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/ginnie_box.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
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
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/messages.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
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
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/leave_request.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
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
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/complaint.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Complaint",
                                  style: TextStyle(
                                      color: Color.fromRGBO(9, 31, 87, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/how_it_works.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "How It Works?",
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
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(12,25,71,1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(2, 2)
                          )
                        ],
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
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/log_out.png'),
                          ),
                          SizedBox(
                            width: 0.2 * (width),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Log Out",
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
              ),)
            ],
          ),
        ),

    );
  }
}
