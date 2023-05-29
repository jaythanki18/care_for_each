import 'package:care_for_each/company_side/company_profile.dart';
import 'package:flutter/material.dart';


class ComplaintDetail extends StatefulWidget {
  const ComplaintDetail({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 40,right: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 235,
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
                        Text('Person Name : Abc',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Designation : Flutter Developer',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text(' Date : 01-03-2023',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Detail :kasadsfghj',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 40,right: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 235,
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
                        Text('Person Name : Abc',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Designation : Flutter Developer',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text(' Date : 01-03-2023',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Detail :kasadsfghj',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 40,right: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 235,
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
                        Text('Person Name : Abc',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Designation : Flutter Developer',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text(' Date : 01-03-2023',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Detail :kasadsfghj',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 40,right: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 235,
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
                        Text('Person Name : Abc',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Designation : Flutter Developer',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text(' Date : 01-03-2023',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Detail :kasadsfghj',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyVisitorDetail()));
              },
              child: Card(
                margin: EdgeInsets.only(left: 40,right: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 235,
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
                        Text('Person Name : Abc',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Designation : Flutter Developer',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        Text(' Date : 01-03-2023',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                        Text('Detail :kasadsfghj',style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
