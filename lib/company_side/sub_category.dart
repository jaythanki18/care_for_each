
import 'package:care_for_each/company_side/new_sub_category.dart';
import 'package:flutter/material.dart';
import '../API/SubCategoryDisplayAPI.dart';
import '../API/SubCategoryManageAPI.dart';
import '../widgets/round_button2.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  late final String catid;
  late final String subcatid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewSubCategory(c_emailid: widget.c_emailid,)));
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
      body: FutureBuilder(
        future: SubCategoryDisplayAPI().subcategoryList(widget.c_emailid),
        builder: (BuildContext context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return Column(
              children: [
                RoundButton2(title: 'SubCategory   Category' ,onTap: (){}),
                SizedBox(height: 3.79.h,),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.server!.length,
                    itemBuilder: (context, index) {
                      return  Column(
                        children: [
                          Container(
                            width: 85.w,
                            height: 5.92.h,
                            child: ElevatedButton(
                                onPressed: () {
                                //  catid=snapshot.data!.server![index].catid.toString();
                                  showAlertDialog(context,snapshot.data!.server![index].catname.toString(),snapshot.data!.server![index].subcatname.toString(),snapshot.data!.server![index].catid.toString(),snapshot.data!.server![index].subcatid.toString());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //   Text("Select Category", style: TextStyle(color: Colors.teal,fontSize: 15.16.sp),),
                                    Text(snapshot.data!.server![index].subcatname.toString(), style: TextStyle(color: Colors.teal,),),
                                    Text(snapshot.data!.server![index].catname.toString(), style: TextStyle(color: Colors.teal,overflow: TextOverflow.ellipsis,),maxLines: 2,),
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
                        ],
                      );
                    },
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
    );
  }
  showAlertDialog(BuildContext context,catname,subcatname,catid,subcat_id) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromRGBO(2, 25, 71, 1),
      title: FutureBuilder(
        future: SubCategoryManageAPI().subcategoryManage(widget.c_emailid, subcatname, "delete",catid,subcat_id),
        builder: (context,snapshot){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Edit Sub-Category : ",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),),
              SizedBox(height: 10,),
              Container(
                width: 64.10.w,
                height: 5.33.h,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                    },
                    child: Text(catname, style: TextStyle(color: Colors.teal,fontSize: 11.37.sp),),
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
                    child: Text(subcatname, style: TextStyle(color: Colors.teal,fontSize: 11.37.sp),),
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
          );
        },

      ),
      // content: Text("Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50,),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCategory(c_emailid: widget.c_emailid,)));
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
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>EditCategory(catid: catid,)));
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
}




