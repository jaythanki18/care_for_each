import 'package:care_for_each/ui/ginnie_box_details.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'package:sizer/sizer.dart';

class GinnieBox extends StatelessWidget {
 // String name, email, phone, date, message;

  GinnieBox({
    Key? key,
    // required this.name,
    // required this.email,
    // required this.phone,
    // required this.date,
    // required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;

    return Scaffold(
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
          "Ginnie Box",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CartScreen()));
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
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 21.09.h,
          width: 83.07.w,
          child: Card(
            //color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBoxDetail()));
              },
              child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.h),child:Image.asset("assets/img_4.png",width: 20.51.w,height: 11.25.h,),),
                        SizedBox(width: 1.h,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Image.asset("calender.png",width: 0.01*w),
                            Text('Name : ',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            Text('Email : ',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Contact : ',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Expected Date : ',style: TextStyle(fontSize: 12,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            //Text('Expected Date :${message}'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
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
                                    Text(
                                      "Call",
                                      style: TextStyle(color: Colors.teal,),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.77.h)),
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.white,
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: Colors.teal,
                                    ))),
                          ),
                        ),
                        Image.asset("assets/img_3.png",height: 4.14.h,),
                        Container(
                          child: Center(
                            child: Container(
                              width: 34.61.w,
                              height: 4.14.h,
                              child: ElevatedButton(
                                  onPressed: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>GinnieBox(name: _name.text, email: _email.text, phone: _contact.text, date: dateInput.text, message: _message.text)));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.message,color: Colors.teal,),
                                      Text(
                                        "Message",
                                        style: TextStyle(color: Colors.teal,),
                                      ),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.77.h)),
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
        ),
      ),
    );
  }
}
