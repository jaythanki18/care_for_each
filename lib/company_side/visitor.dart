import 'package:care_for_each/API/visitor_display_API.dart';
import 'package:care_for_each/company_side/order_details.dart';
import 'package:care_for_each/company_side/visitor_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'company_profile.dart';

class CompanyVisitor extends StatefulWidget {
  const CompanyVisitor({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<CompanyVisitor> createState() => _CompanyVisitorState();
}

class _CompanyVisitorState extends State<CompanyVisitor> {
  final items=['All','This Year','This Month','Today'];
  String? dur='All';

  List<String> list2=['Employee','sindhav88@gmail.com'];
  String? e_emailid='sindhav88@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          "Visitor",
          style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 5.92.h,
                width: 37.92.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.teal,width: 2),
                ),
                child: DropdownButtonFormField<String>(
                  value: dur,
                  items: items.map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item,style: TextStyle(color: Colors.black),),
                  )
                  ).toList(),
                  onChanged: (item)=>setState((){
                    dur=item;
                    print(dur);
                  }),
                ),
              ),

              Container(
                width: 55.92.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.teal,width: 2),
                ),
                child: DropdownButtonFormField<String>(
                  value: e_emailid,
                  items: list2.map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item,style: TextStyle(color: Colors.black,),),
                  )
                  ).toList(),
                  onChanged: (item)=>setState((){
                    e_emailid=item;
                    print(e_emailid);
                  }),
                ),
              ),
            ],
          ),


          FutureBuilder(
              future: VisitorDisplayAPI().visitor(widget.c_emailid,dur,e_emailid),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            return  Column(
                              children: [
                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail(
                                      c_emailid: widget.c_emailid,
                                      visitorname: snapshot.data!.server![index].visitername.toString(),
                                      company: snapshot.data!.server![index].companyname.toString(),
                                      address: snapshot.data!.server![index].address.toString(),
                                      email: snapshot.data!.server![index].visiterEmailid.toString(),
                                      contact: snapshot.data!.server![index].contactnum.toString(),
                                      date: snapshot.data!.server![index].date.toString(),
                                      time: snapshot.data!.server![index].time.toString(),
                                      discussion: snapshot.data!.server![index].discussion.toString(),
                                      photo: snapshot.data!.server![index].photo.toString(),
                                    )));
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 40,right: 40),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      height: 290,
                                      width: 311,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
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
                                            Center(child: Container(child: Image.network(snapshot.data!.server![index].photo.toString(),width: 80,height: 95,errorBuilder: (context, error, stackTrace) => SizedBox(width: 25.64.w,height: 100,)))),
                                            SizedBox(height: 15,),
                                            //Image.asset("calender.png",width: 0.01*w),
                                            Text('Person Name : '+snapshot.data!.server![index].visitername.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Company Name : '+snapshot.data!.server![index].companyname.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                            Text('Date : '+snapshot.data!.server![index].date.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text(' Time : '+snapshot.data!.server![index].time.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Mail Id : '+snapshot.data!.server![index].visiterEmailid.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            //Text('Expected Date :${message}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ) ;
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



