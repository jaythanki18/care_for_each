import 'package:care_for_each/company_side/company_profile.dart';
import 'package:flutter/material.dart';

import '../API/employee_complain_API.dart';


class ComplaintDetail extends StatefulWidget {
  const ComplaintDetail({Key? key, required this.name,}) : super(key: key);

  final String name;
 // final String photo,name,designation,date,detail;
  @override
  State<ComplaintDetail> createState() => _ComplaintDetailState();
}

class _ComplaintDetailState extends State<ComplaintDetail> {
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
          "Compaint Detail",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(9, 31, 87, 1),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
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
              future: EmployeeComplainAPI().complainList("info@webearl.com"),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            if(widget.name==snapshot.data!.server![index].ename.toString()){
                              print("passed name  = "+widget.name+", list name = "+snapshot.data!.server![index].ename.toString());
                              // return  Column(
                              //   children: [
                              //     SizedBox(height: 10,),
                              //     InkWell(
                              //       onTap: (){
                              //         //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
                              //       },
                              //       child: Card(
                              //         margin: EdgeInsets.only(left: 40,right: 40),
                              //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              //         child: Container(
                              //           height: 235,
                              //           width: 311,
                              //           decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(20),
                              //               gradient: LinearGradient(colors: [
                              //                 Color.fromRGBO(62, 86, 115, 0.2),
                              //                 Color.fromRGBO(184, 184, 184, 0.1)
                              //               ])
                              //           ),
                              //           child: Padding(
                              //             padding: const EdgeInsets.only(left: 40,right: 40,bottom: 17,top: 16),
                              //             child: Column(
                              //               crossAxisAlignment: CrossAxisAlignment.start,
                              //               children: [
                              //                 Center(child: Container(child: Image.asset("assets/img_4.png",width: 80,height: 95,))),
                              //                 SizedBox(height: 15,),
                              //                 //Image.asset("calender.png",width: 0.01*w),
                              //                 Text('Person Name : '+snapshot.data!.server![index].ename.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              //                 Text('Designation : '+snapshot.data!.server![index].designation.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                              //                 Text('Date : '+snapshot.data!.server![index].date.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                              //                 Text('Detail :'+snapshot.data!.server![index].description.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // );
                            }
                            else{
                              do{
                                index++;
                              }
                              while(widget.name==snapshot.data!.server![index].ename.toString());
                              print("passed name  = "+widget.name+", list name = "+snapshot.data!.server![index].ename.toString());
                            }
                            // else{
                            //   // return  Column(
                            //   //   children: [
                            //   //     SizedBox(height: 10,),
                            //   //     InkWell(
                            //   //       onTap: (){
                            //   //         //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
                            //   //       },
                            //   //       child: Card(
                            //   //         margin: EdgeInsets.only(left: 40,right: 40),
                            //   //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            //   //         child: Container(
                            //   //           height: 235,
                            //   //           width: 311,
                            //   //           decoration: BoxDecoration(
                            //   //               borderRadius: BorderRadius.circular(20),
                            //   //               gradient: LinearGradient(colors: [
                            //   //                 Color.fromRGBO(62, 86, 115, 0.2),
                            //   //                 Color.fromRGBO(184, 184, 184, 0.1)
                            //   //               ])
                            //   //           ),
                            //   //           child: Padding(
                            //   //             padding: const EdgeInsets.only(left: 40,right: 40,bottom: 17,top: 16),
                            //   //             child: Column(
                            //   //               crossAxisAlignment: CrossAxisAlignment.start,
                            //   //               children: [
                            //   //                 Center(child: Container(child: Image.asset("assets/img_4.png",width: 80,height: 95,))),
                            //   //                 SizedBox(height: 15,),
                            //   //                 //Image.asset("calender.png",width: 0.01*w),
                            //   //                 Text('Person Name : '+snapshot.data!.server![index].ename.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            //   //                 Text('Designation : '+snapshot.data!.server![index].designation.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            //   //                 Text('Date : '+snapshot.data!.server![index].date.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            //   //                 Text('Detail :'+snapshot.data!.server![index].description.toString(),style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 3),
                            //   //               ],
                            //   //             ),
                            //   //           ),
                            //   //         ),
                            //   //       ),
                            //   //     ),
                            //   //   ],
                            //   // );
                            // }

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
