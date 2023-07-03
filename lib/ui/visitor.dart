import 'package:care_for_each/API/EmployeeSide/visitor_display_API.dart';
import 'package:care_for_each/ui/add_visitor.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/ui/visitor_details.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Visitor extends StatefulWidget {

  // String name, email, phone, company, address, discussion;

  Visitor(
      {Key? key,
      // required this.name,
      // required this.company,
      // required this.phone,
      // required this.email,
      // required this.address,
      // required this.discussion
  })
      : super(key: key);

  @override
  State<Visitor> createState() => _VisitorState();
}

class _VisitorState extends State<Visitor> {
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
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVisitor()));
      },
          child: Icon(Icons.add,),backgroundColor: Color.fromRGBO(12,25,71,1)),
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
          "Visitor",
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
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FutureBuilder(
              future: VisitorDisplayAPI().visitor(getCName, getEName),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            return   Center(
                              child: Card(
                                //color: Colors.blue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VisitorDetails(veid: snapshot.data!.server![index].veid.toString(),)));
                                  },
                                  child: Container(
                                    height: 15.40.h,
                                    width: 88.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(colors: [
                                          Colors.grey,
                                          Colors.white,
                                        ])
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 3.84.w,vertical: 3.84.w),child:Image.network(snapshot.data!.server![index].photo.toString(),width: 20.51.w,height: 11.25.h,errorBuilder: (context, error, stackTrace) => SizedBox(width: 20.51.w,height: 11.25.h,)),),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                //Image.asset("calender.png",width: 0.01*w),
                                                Text('Company Name : ${snapshot.data!.server![index].companyname.toString()}',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                                Text('Person Name : ${snapshot.data!.server![index].visitername.toString()}',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                Text('Contact : ${snapshot.data!.server![index].contactnum.toString()}',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                                Text('Email : ${snapshot.data!.server![index].visiterEmailid.toString()}',style: TextStyle(fontSize: 8.34.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),

                                                //Text('Expected Date :${message}'),
                                              ],
                                            ),
                                          ],
                                        ),

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
    );
  }
}
