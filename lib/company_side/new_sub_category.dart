import 'package:care_for_each/Models/CategoryDisplayModel.dart';
import 'package:care_for_each/Models/SubCategoryManageModel.dart';
import 'package:care_for_each/company_side/sub_category.dart';
import 'package:flutter/material.dart';

import '../API/CategoryDisplayAPI.dart';
import '../API/SubCategoryManageAPI.dart';
import '../widgets/round_button.dart';
import '../widgets/round_button2.dart';
import 'category.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class User {
  const User(this.id,this.name);

  final String name;
  final int id;
}

class NewSubCategory extends StatefulWidget {
  const NewSubCategory({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<NewSubCategory> createState() => _NewSubCategoryState();

}

class _NewSubCategoryState extends State<NewSubCategory> {
  final formKey = GlobalKey<FormState>();
  TextEditingController subcatname=TextEditingController();

  // final items=['Select Category','Mobile Application','Digital Marketing','Web Application','Graphics Designing ','Customized Software','Man Power','Hello 2'];
  // String? selectedItem='Select Category';
  // late final int catid;
  String subcat_name="";

  late User selectedUser;
  List<User> users = <User>[const User(000,'Select Category'),const User(112,'Mobile Application'), const User(113,'Digital Marketing'), const User(135,'Web Application'),const User(136,'Graphics Designing'),const User(137,'Customized Software'),const User(138,'Man Power'),const User(139,'Hello 2')];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedUser=users[0];
    callDisplayAPI();
  }

  var displayInitial;
  String catid="";
  var id;
  // var categoryName;
  void getId(categoryName)async{
    CategoryDisplayModel data= await CategoryDisplayAPI().categoryList(widget.c_emailid);
    for(var i = 0 ; i<data.server!.length;i++){
      if(categoryName == data.server?[i].catname){
        id= data.server?[i].catid.toString();
        catid=id.toString();

        print(catid);

      }
    }
  }


  List<String>? CategoryList;
 void callDisplayAPI() async{
    CategoryDisplayModel data= await CategoryDisplayAPI().categoryList(widget.c_emailid);
   setState(() {
     CategoryList = data.server?.map((e) => e.catname.toString()).toList() ;
    displayInitial=data.server![0].catname.toString();
   });
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    subcatname.dispose();
    super.dispose();
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
          "Sub Category",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile(c_emailid: widget.c_emailid,)));
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
                  // Container(
                  //   height: 5.92.h,
                  //   width: 85.12.w,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(1.36.h),
                  //     border: Border.all(
                  //         color: Colors.teal,width: 2),
                  //   ),
                  //   child: GestureDetector(
                  //     onTap: (){
                  //
                  //     },
                  //     child: DropdownButtonFormField<String>(
                  //       value: selectedItem,
                  //       items: items.map((item) => DropdownMenuItem(
                  //         value: item,
                  //         child: Text(item,style: TextStyle(color: Colors.black,fontSize: 14),),
                  //       )
                  //       ).toList(),
                  //       onChanged: (item)=>setState((){
                  //         selectedItem=item;
                  //         if(selectedItem=="Mobile Application"){ catid=112;}
                  //         if(selectedItem=="Digital Marketing"){ catid=113;}
                  //         if(selectedItem=="customized Software"){ catid=137;}
                  //         if(selectedItem=="man power"){ catid=138;}
                  //         if(selectedItem=="Web Application"){ catid=135;}
                  //         if(selectedItem=="Graphics Designing"){ catid=136;}
                  //         print(selectedItem);
                  //         print(catid);
                  //       }),
                  //         onTap: (){
                  //
                  //         },
                  //     ),
                  //   ),
                  // ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal,width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal,width: 2)
                      ),
                    ),
                    value: displayInitial,
                    onChanged: (newValue) {
                      setState(() {
                        displayInitial = newValue!;

                        print(displayInitial);
                        getId(displayInitial);
                      });
                    },
                    items: CategoryList?.map((String user) {
                      return new DropdownMenuItem<String>(
                        value: user,
                        child: new Text(
                          user,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                //  new Text("selected user name is ${selectedUser.name} : and Id is : ${selectedUser.id}"),

                  SizedBox(height: 1.36.h,),
                  SizedBox(
                    height: 5.920.h,
                    child: TextFormField(
                      controller: subcatname,
                      onChanged: (value){
                        subcat_name=value;
                        setState(() {

                        });
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter sub category name';
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
                onTap: () async{
                  SubCategoryManageModel data = await SubCategoryManageAPI().subcategoryManage(widget.c_emailid, subcatname.text.toString(), "insert", catid, "");
                  print("subcategoryManage(${widget.c_emailid.toString()},${subcatname.text},insert,${catid},)");
                  debugPrint(data.server![0].result.toString());
                  if(formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCategory(c_emailid: widget.c_emailid,)));
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
