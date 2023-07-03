import 'package:care_for_each/API/EmployeeSide/visitor_detail_API.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class VisitorDetails extends StatefulWidget {
  // String name, email, phone, company, address, discussion;

  VisitorDetails(
      {Key? key, required this.veid,
        // required this.name,
        // required this.company,
        // required this.phone,
        // required this.email,
        // required this.address,
        // required this.discussion
  })
      : super(key: key);

  final String veid;

  @override
  State<VisitorDetails> createState() => _VisitorDetailsState();
}

class _VisitorDetailsState extends State<VisitorDetails> {
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
          "Visitor Details",
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
      body: Column(
        children: [
          FutureBuilder(
              future: VisitorDetailAPI().visitor(getCName, getEName,widget.veid),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            return Card(
                              margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Container(
                               // height: 30.20.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(62, 86, 115, 0.2),
                                      Color.fromRGBO(184, 184, 184, 0.1)
                                    ])
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 10.3.w,vertical: 1.8.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(child: Container(child: Image.network(snapshot.data!.server![index].photo.toString(),width: 20.51.w,height: 11.25.h,errorBuilder: (context, error, stackTrace) => SizedBox(width: 20.51.w,height: 11.25.h,child: Container(color: Colors.black54,),)))),
                                      SizedBox(height: 15,),
                                      //Image.asset("calender.png",width: 0.01*w),
                                      Text('Name : ${snapshot.data!.server![index].visitername.toString()}',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                      Text('Company Name : ${snapshot.data!.server![index].companyname.toString()}',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                      Text('Email : ${snapshot.data!.server![index].visiterEmailid.toString()}',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                      Text('Contact : ${snapshot.data!.server![index].contactnum.toString()}',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                      Text('Address : ${snapshot.data!.server![index].address.toString()}',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                      Text('Discussion : ${snapshot.data!.server![index].discussion.toString()}',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                      //Text('Expected Date :${message}'),
                                    ],
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
