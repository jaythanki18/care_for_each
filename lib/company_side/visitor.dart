import 'package:care_for_each/company_side/order_details.dart';
import 'package:care_for_each/company_side/visitor_details.dart';
import 'package:flutter/material.dart';

import 'company_profile.dart';

class CompanyVisitor extends StatefulWidget {
  const CompanyVisitor({Key? key}) : super(key: key);

  @override
  State<CompanyVisitor> createState() => _CompanyVisitorState();
}

class _CompanyVisitorState extends State<CompanyVisitor> {
  final items=['All','This Year','This Month','Today'];
  String? selectedItem='All';

  List<String> list2=['ABC','DEF','GHI','JKL','MNO','PQR','STU','VWX','YZ'];
  String? list2item='ABC';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38.0,right: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 144,
                    decoration: BoxDecoration(
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
                  SizedBox(width: 10,),
                  Container(
                    width: 144,
                    decoration: BoxDecoration(
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
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
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
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 80,height: 95,))),
                        SizedBox(height: 15,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Person Name : kagku',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : bvfsbf',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Date : 09-08-2020',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text(' Time : 01:30 PM',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Mail Id : sftctc@gmail.com',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
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
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 80,height: 95,))),
                        SizedBox(height: 15,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Person Name : kagku',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : bvfsbf',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Date : 09-08-2020',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text(' Time : 01:30 PM',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Mail Id : sftctc@gmail.com',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
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
                        Center(child: Container(child: Image.asset("assets/img_4.png",width: 80,height: 95,))),
                        SizedBox(height: 15,),
                        //Image.asset("calender.png",width: 0.01*w),
                        Text('Person Name : kagku',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Company Name : bvfsbf',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text('Date : 09-08-2020',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text(' Time : 01:30 PM',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Mail Id : sftctc@gmail.com',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        //Text('Grand Total : ₹ 9874',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                        //Text('Expected Date :${message}'),
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



