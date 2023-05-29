import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class VisitorDetails extends StatelessWidget {
  // String name, email, phone, company, address, discussion;

  VisitorDetails(
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
      body: Card(
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
                Text('Name : ',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                Text('Company Name : ',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                Text('Email : ',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                Text('Contact : ',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                Text('Address : ',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                Text('Discussion : ',style: TextStyle(fontSize: 13,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 2),
                //Text('Expected Date :${message}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
