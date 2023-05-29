import 'package:care_for_each/chat/chat_login.dart';
import 'package:care_for_each/company_side/new_employee.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Employee extends StatelessWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
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
          "Employee",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(12,25,71,1),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewEmployee()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 23.5.h,
                  width: 79.74.w,
                  child: Card(
                    //color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(62, 86, 115, 0.2),
                            Color.fromRGBO(184, 184, 184, 0.1),
                          ])
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 3.84.w),child:Image.asset("assets/img_4.png",width: 20.51.w,height: 17.77.h,),),
                              SizedBox(width: 2.56.w,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text('Company Name : ',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                  Text('Person Name : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Designation: ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Email Id : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  //Text('Expected Date :${message}'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Center(
                                  child: Container(
                                    width: 28.71.w,
                                    height: 4.14.h,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Call", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),

                              Image.asset("assets/img_3.png",height: 4.14.h),
                              Container(
                                child: Center(
                                  child: Container(
                                    height: 4.14.h,
                                    width: 34.6.w,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Message", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 23.5.h,
                  width: 79.74.w,
                  child: Card(
                    //color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(62, 86, 115, 0.2),
                            Color.fromRGBO(184, 184, 184, 0.1),
                          ])
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 3.84.w),child:Image.asset("assets/img_4.png",width: 20.51.w,height: 17.77.h,),),
                              SizedBox(width: 2.56.w,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text('Company Name : ',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                  Text('Person Name : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Designation: ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Email Id : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  //Text('Expected Date :${message}'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Center(
                                  child: Container(
                                    width: 28.71.w,
                                    height: 4.14.h,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Call", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),

                              Image.asset("assets/img_3.png",height: 4.14.h),
                              Container(
                                child: Center(
                                  child: Container(
                                    height: 4.14.h,
                                    width: 34.6.w,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Message", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 23.5.h,
                  width: 79.74.w,
                  child: Card(
                    //color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(62, 86, 115, 0.2),
                            Color.fromRGBO(184, 184, 184, 0.1),
                          ])
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 3.84.w),child:Image.asset("assets/img_4.png",width: 20.51.w,height: 17.77.h,),),
                              SizedBox(width: 2.56.w,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text('Company Name : ',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                  Text('Person Name : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Designation: ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Email Id : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  //Text('Expected Date :${message}'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Center(
                                  child: Container(
                                    width: 28.71.w,
                                    height: 4.14.h,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Call", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),

                              Image.asset("assets/img_3.png",height: 4.14.h),
                              Container(
                                child: Center(
                                  child: Container(
                                    height: 4.14.h,
                                    width: 34.6.w,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Message", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 23.5.h,
                  width: 79.74.w,
                  child: Card(
                    //color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(62, 86, 115, 0.2),
                            Color.fromRGBO(184, 184, 184, 0.1),
                          ])
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 3.84.w),child:Image.asset("assets/img_4.png",width: 20.51.w,height: 17.77.h,),),
                              SizedBox(width: 2.56.w,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text('Company Name : ',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                  Text('Person Name : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Designation: ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text('Email Id : ',style: TextStyle(fontWeight:FontWeight.bold,fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                  //Text('Expected Date :${message}'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Center(
                                  child: Container(
                                    width: 28.71.w,
                                    height: 4.14.h,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Call", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),

                              Image.asset("assets/img_3.png",height: 4.14.h),
                              Container(
                                child: Center(
                                  child: Container(
                                    height: 4.14.h,
                                    width: 34.6.w,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.call,color: Colors.teal,),
                                            Text("Message", style: TextStyle(color: Colors.teal,fontSize: 12.13.sp),),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.teal,
                                            ))),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
