import 'package:care_for_each/widgets/round_button2.dart';
import 'package:flutter/material.dart';

import '../API/CategoryManageAPI.dart';
import '../widgets/round_button.dart';
import 'category.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class EditCategory extends StatefulWidget {
  const EditCategory({Key? key, required this.catid, required this.c_emailid}) : super(key: key);
  final String catid,c_emailid;
  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {

  TextEditingController catname=TextEditingController();
  TextEditingController gst=TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          "Edit Category",
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
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.25.w),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    RoundButton2(title: 'Edit Category', onTap: (){}),
                    SizedBox(height: 6.39.h,),
                    SizedBox(
                      height: 5.92.h,
                      child: TextFormField(
                        controller: catname,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter a category name';
                          }
                          else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0,color: Colors.black12)
                            ),
                            labelText: "Enter Category Name",
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1))),
                      ),
                    ),
                    SizedBox(height: 1.36.h,),
                    SizedBox(
                      height: 5.92.h,
                      child: TextFormField(
                        controller: gst,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter a GST';
                          }
                          else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0,color: Colors.black12)
                            ),
                            labelText: "Add GST % *",
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(12, 25, 71, 1))),

                      ),
                    ),
                  ],
                ),
                RoundButton(
                  title: "Save",
                  onTap: () {
                    FutureBuilder(
                      future: CategoryManageAPI().categoryManage(widget.c_emailid,catname.text,gst.text,"update",widget.catid),
                      builder: (BuildContext context, snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Text("Loading");
                        }
                        else if(snapshot.hasData){
                          return Column(
                            children: [
                              Text(snapshot.data!.server![0].result.toString())
                            ],
                          );
                        }
                        else{
                          return Text("No data");
                        }
                      },

                    );
                    if(formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(c_emailid: widget.c_emailid,)));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
