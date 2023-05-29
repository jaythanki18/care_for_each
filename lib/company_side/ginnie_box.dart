import 'package:care_for_each/company_side/ginnie_box_detail.dart';
import 'package:flutter/material.dart';

import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class CompanyGinnieBox extends StatefulWidget {
  const CompanyGinnieBox({Key? key}) : super(key: key);

  @override
  State<CompanyGinnieBox> createState() => _CompanyGinnieBoxState();
}

class _CompanyGinnieBoxState extends State<CompanyGinnieBox> {
  final items=['All','This Year','This Month','Today'];
  String? selectedItem='All';

  List<String> list2=['ABC','DEF','GHI','JKL','MNO','PQR','STU','VWX','YZ'];
  String? list2item='ABC';

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.46.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5.92.h,
                    width: 36.92.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.36.h),
                      border: Border.all(
                          color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedItem,
                      items: items.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,style: TextStyle(color: Colors.black),),
                      )
                      ).toList(),
                      onChanged: (item)=>setState(()=>selectedItem=item),
                    ),
                  ),
                  SizedBox(width: 1.36.h,),
                  Container(
                    width: 36.92.w,
                    height: 5.92.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.36.h),
                      border: Border.all(
                          color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: list2item,
                      items: list2.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,style: TextStyle(color: Colors.black,),),
                      )
                      ).toList(),
                      onChanged: (item)=>setState(()=>list2item=item),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBoxDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 33,right: 33),
                elevation: 4,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 40.87.h,
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
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 23.83.w,height: 13.15.h,))),
                        SizedBox(height: 1.77.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Name : salkjh',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : WebEarl',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Date : 09-08-2020',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Email : skjhhfi@gmail.com',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : 6789012345 Grand',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Grand Total : ₹ 987978',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                        //SizedBox(height: 1.36.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  height: 35,
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
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBoxDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 33,right: 33),
                elevation: 4,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 40.87.h,
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
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 23.83.w,height: 13.15.h,))),
                        SizedBox(height: 1.77.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Name : salkjh',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : WebEarl',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Date : 09-08-2020',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Email : skjhhfi@gmail.com',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : 6789012345 Grand',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Grand Total : ₹ 987978',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                        //SizedBox(height: 1.36.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  height: 35,
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
            SizedBox(height: 1.36.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBoxDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 33,right: 33),
                elevation: 4,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                child: Container(
                  height: 40.87.h,
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
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 23.83.w,height: 13.15.h,))),
                        SizedBox(height: 1.77.h,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Name : salkjh',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : WebEarl',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Date : 09-08-2020',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Email : skjhhfi@gmail.com',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Contact No : 6789012345 Grand',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Grand Total : ₹ 987978',style: TextStyle(fontSize: 12.13.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                        //SizedBox(height: 1.36.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  height: 35,
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
        ),
      ),
    );
  }
}
