import 'package:care_for_each/API/CategoryDisplayAPI.dart';
import 'package:care_for_each/company_side/edit_category.dart';
import 'package:care_for_each/company_side/new_category.dart';
import 'package:flutter/material.dart';

import '../widgets/round_button2.dart';
import 'company_dashboard.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewCategory()));
        },
        backgroundColor: Color.fromRGBO(12,25,71,1),
        child: Icon(Icons.add),
      ),
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
          "Category",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.w),
        child: FutureBuilder(
          future: CategoryDisplayAPI().categoryList("info@webearl.com",""),
          builder: (BuildContext context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Text("Loading");
            }
            else if(snapshot.hasData){
              return Column(
                children: [
                  RoundButton2(title: 'Category Name  GST%' ,onTap: (){}),
                  SizedBox(height: 3.79.h,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Select Category", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                         //   Text(snapshot.data.server[0][0].toString(), style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("20", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.36.h)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 2.13.h,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mobile Application", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("20", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Digital Marketaing", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("18", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Web Application", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("18", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Graphics Designing", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("15", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Customized Software", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("10", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Man Power", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("7", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    width: 79.74.w,
                    height: 5.92.h,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Hello 2", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                            Text("12", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            )
                        )
                    ),
                  ),
                ],
              );
            }
            else{
              return Text("No data");
            }
          },

        ),
      ),
    );
  }
}


showAlertDialog(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromRGBO(2, 25, 71, 1),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Edit Category : ",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),),
        SizedBox(height: 10,),
        Container(
          width: 64.10.w,
          height: 5.33.h,
          child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
              },
              child: Text("Mobile Application", style: TextStyle(color: Colors.teal,fontSize: 11.37.sp),),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.teal,
                  )
              )
          ),
        ),
        SizedBox(height: 0.59.h,),
        Container(
          width: 64.10.w,
          height: 5.33.h,
          child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
              },
              child: Text("18", style: TextStyle(color: Colors.teal,fontSize: 11.37.sp),),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.teal,
                  )
              )
          ),
        ),
      ],
    ),
    // content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50,),
            child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                child: Text("Delete",style: TextStyle(color: Colors.white))
            ),
          ),
          SizedBox(width: 5.92.w,),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditCategory()));
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                child: Text("Edit",style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

