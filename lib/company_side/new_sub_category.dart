import 'package:flutter/material.dart';

import '../widgets/round_button.dart';
import '../widgets/round_button2.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class NewSubCategory extends StatefulWidget {
  const NewSubCategory({Key? key}) : super(key: key);

  @override
  State<NewSubCategory> createState() => _NewSubCategoryState();
}

class _NewSubCategoryState extends State<NewSubCategory> {
  final formKey = GlobalKey<FormState>();

  final items=['Select Category','Mobile Application','Digital Marketing','Web Application','Graphics Designing ','Customized Software','Man Power','Hello 2'];
  String? selectedItem='Select Category';

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
          "Sub Category",
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
        padding:  EdgeInsets.symmetric(horizontal: 11.02.w),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  RoundButton2(title: 'New Sub Category Add', onTap: (){}),
                  SizedBox(height: 6.39.h,),
                  Container(
                    height: 5.92.h,
                    width: 85.12.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.36.h),
                      border: Border.all(
                          color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedItem,
                      items: items.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,style: TextStyle(color: Colors.black,fontSize: 14),),
                      )
                      ).toList(),
                      onChanged: (item)=>setState(()=>selectedItem=item),
                    ),
                  ),
                  SizedBox(height: 1.36.h,),
                  SizedBox(
                    height: 5.920.h,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter category name';
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0,color: Colors.black12)
                          ),
                          labelText: "Sub Category Name",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(12, 25, 71, 1))),
                    ),
                  ),

                ],
              ),
              RoundButton(
                title: "Save",
                onTap: () {
                  if(formKey.currentState!.validate()){

                  }
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
