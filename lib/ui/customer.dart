import 'package:care_for_each/API/EmployeeSide/customer_list_API.dart';
import 'package:care_for_each/Models/EmployeeSide/CustomerListModel.dart';
import 'package:care_for_each/chat/chat_login.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
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
                Icons.menu,
                color: Color.fromRGBO(9, 31, 87, 1),
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Customer",
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
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
                future: CustomerListAPI().customer(getEName),
                builder: (BuildContext context, snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else if(snapshot.hasData){
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.server!.length,
                            itemBuilder: (context,index){
                              return  Center(
                                child: Container(
                                  height: 26.8.h,
                                  width: 80.w,
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
                                                  //Image.asset("calender.png",width: 0.01*w),
                                                  SizedBox(width: 45.w,child: Text('Company Name : ${snapshot.data!.server![index].customercompanyname.toString()}',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                                                  SizedBox(width: 45.w,child: Text('Person Name : ${snapshot.data!.server![index].customername.toString()}',style: TextStyle(fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2)),
                                                  SizedBox(width: 45.w,child: Text('Contact No: ${snapshot.data!.server![index].customercontactno.toString()}',style: TextStyle(fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2)),
                                                  SizedBox(width: 45.w,child: Text('Email Id : ${snapshot.data!.server![index].customeremailid.toString()}',style: TextStyle(fontSize:  8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2)),
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
                                                        onPressed: () async{
                                                          String phoneNumber = '+91${snapshot.data!.server![index].customercontactno.toString()}';
                                                          String url = 'tel:$phoneNumber';

                                                          if (await canLaunchUrl(Uri.parse(url))) {
                                                          await launchUrl(Uri.parse(url));
                                                          } else {
                                                          throw 'Could not launch $url';
                                                          }
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
                                                        onPressed: () async{
                                                         //  String phoneNumber = '9898295649';
                                                         // // String phoneNumber = '${snapshot.data!.server![index].customercontactno.toString()}';
                                                         //  String message = 'Welcome to WebEarl Technologies!';
                                                         //  String url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeQueryComponent(message)}';
                                                         //  if (await canLaunchUrl(Uri.parse(url))) {
                                                         //  await launchUrl(Uri.parse(url));
                                                         //  } else {
                                                         //  throw 'Could not launch $url';
                                                         //  }

                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
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
                              );
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
      ),
    );
  }
}
