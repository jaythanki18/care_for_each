import 'package:care_for_each/API/wishlist_display_company_API.dart';
import 'package:care_for_each/company_side/ginnie_box_detail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../API/employee_data_API.dart';
import '../Models/EmployeeDataModel.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class CompanyGinnieBox extends StatefulWidget {
  const CompanyGinnieBox({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<CompanyGinnieBox> createState() => _CompanyGinnieBoxState();
}

class _CompanyGinnieBoxState extends State<CompanyGinnieBox> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callDisplayAPI();
  }
  final items=['All','This Year','This Month','Today'];
  String? dur='All';

  List<String> list2=['Employee','sindhav88@gmail.com',];
  String? list2item='sindhav88@gmail.com';

  List<String>? CategoryList=[];
  var displayInitial;
  void callDisplayAPI() async{
    EmployeeDataModel data= await EmployeeDataAPI().employeeList(widget.c_emailid);
    setState(() {
      CategoryList = data.server?.map((e) => e.emailid.toString()).toList() ;
      displayInitial=data.server![0].emailid.toString();
    });
    for(int i=0;i<CategoryList!.length;i++){
      print(data.server![i].emailid.toString());
    }
  }


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
          "Ginnie Box",
          style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyProfile(c_emailid: widget.c_emailid,)));
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
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 30.w,
                    child: Container(
                      //  height: 5.92.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.teal,width: 2),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: dur,
                        items: items.map((item) => DropdownMenuItem(
                          value: item,
                          child: SizedBox(child: Text(item,style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                        )
                        ).toList(),
                        onChanged: (item)=>setState((){
                          dur=item;
                          print(dur);
                        }),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 5.92.h,
                //   width: 60.92.w,
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //         color: Colors.teal,width: 2),
                //   ),
                //   child: DropdownButtonFormField<String>(
                //     value: displayInitial,
                //     items: CategoryList!.map((item) => DropdownMenuItem(
                //       value: item,
                //       child: Text(item,style: TextStyle(color: Colors.black),),
                //     )
                //     ).toList(),
                //     onChanged: (item)=>setState((){
                //       displayInitial=item;
                //       print(displayInitial);
                //     }),
                //   ),
                // ),

               Flexible(child:  SizedBox(
                 width: 65.w,
                 child: Container(
                   width: 65.w,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.teal,width: 2),
                   ),
                   child: DropdownButtonFormField<String>(
                     value: displayInitial,
                     items: CategoryList!.map((item) => DropdownMenuItem(
                       value: item,
                       child: SizedBox(width: 40.w,child: Text(item,style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                     )
                     ).toList(),
                     onChanged: (item)=>setState((){
                       displayInitial=item;
                       print(displayInitial);
                     }),
                   ),
                 ),
               ),)
              ],
            ),
          ),
          SizedBox(height: 1.36.h,),
          FutureBuilder(
              future: WishlistDisplayCompanyAPI().wishlist(widget.c_emailid, dur, displayInitial),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.server!.length,
                          itemBuilder: (context,index){
                            return   Column(
                              children: [
                                SizedBox(height: 1.18.h,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBoxDetail(wcid: snapshot.data!.server![index].wcid.toString(),c_emailid: widget.c_emailid,)));
                                  },
                                  child: Card(
                                    margin: EdgeInsets.symmetric(horizontal: 8.46.w),
                                    elevation: 4,
                                    shadowColor: Colors.grey,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                                    child: Container(
                                     // height: 40.87.h,
                                      width: 83.07.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(62, 86, 115, 0.2),
                                            Color.fromRGBO(184, 184, 184, 0.1)
                                          ])
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.25.w,vertical: 1.89.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(child: Container(child: Image.network(snapshot.data!.server![index].ephoto.toString(),width: 23.83.w,height: 13.15.h,errorBuilder: (context, error, stackTrace) => SizedBox(width: 23.83.w,height: 13.15.h,)))),
                                            SizedBox(height: 1.77.h,),
                                            //Image.asset("calender.png",width: 0.01*w),
                                            Text('Name : '+snapshot.data!.server![index].ename.toString(),style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Company Name : '+snapshot.data!.server![index].custCompanyName.toString(),style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                            Text('Date : '+snapshot.data!.server![index].expecteddate.toString(),style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Email : '+snapshot.data!.server![index].custemailid.toString(),style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Contact No : '+snapshot.data!.server![index].custmobile.toString(),style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            Text('Grand Total : ₹ '+snapshot.data!.server![index].grandtotal.toString(),style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                                            //Text('Expected Date :${message}'),
                                            //SizedBox(height: 1.36.h,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  child: Center(
                                                    child: Container(
                                                     // width: 28.71.w,
                                                      height: 4.14.h,
                                                      child: ElevatedButton(
                                                          onPressed: () async{
                                                            String phoneNumber = '+91${snapshot.data!.server![index].custmobile.toString()}';
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
                                                              Text("Call", style: TextStyle(color: Colors.teal,),),
                                                            ],
                                                          ),
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 0,
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                              backgroundColor: Colors.white,
                                                              shadowColor: Colors.white,
                                                              side: const BorderSide(
                                                                width: 1.0,
                                                                color: Colors.teal,
                                                              ))),
                                                    ),
                                                  ),
                                                ),
                                                //SizedBox(width: 5,),
                                                Image.asset("assets/img_3.png",height: 4.14.h,),
                                                // SizedBox(width: 5,),
                                                Container(
                                                  child: Center(
                                                    child: Container(
                                                      height: 4.14.h,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.message,color: Colors.teal,),
                                                              Text("Message", style: TextStyle(color: Colors.teal,),),
                                                            ],
                                                          ),
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 0,
                                                              backgroundColor: Colors.white,
                                                              shadowColor: Colors.white,
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                                ),
                              ],
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
