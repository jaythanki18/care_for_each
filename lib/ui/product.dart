
import 'package:care_for_each/API/EmployeeSide/employee_subcat_product_display_API.dart';
import 'package:care_for_each/API/EmployeeSide/product_display_API.dart';
import 'package:care_for_each/API/EmployeeSide/product_subcategory_display_API.dart';
import 'package:care_for_each/API/ProductDisplayAPI.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductCatDisplayModel.dart';
import 'package:care_for_each/ui/dashboard.dart';
import 'package:care_for_each/ui/product_details.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../API/EmployeeSide/product_cat_display_API.dart';
import '../Models/CategoryDisplayModel.dart';
import '../Models/EmployeeSide/ProductSubCategoryDisplayModel.dart';
import 'cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.e_emailid}) : super(key: key);
  final String e_emailid;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class MenuData {
  MenuData(this.icon, this.title);

  final IconData icon;
  final String title;
}

class _ProductScreenState extends State<ProductScreen> {


  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    catDisplay();
  //  SubcatDisplay();
  }

  String? getName;
  String? getCName;
  void getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getName=sharedPreferences.getString("email")!;
      getCName=sharedPreferences.getString("c_email")!;
    });
    print(getName);
    print(getCName);
  }
  // final items=['category','This Year','This Month','Today'];
  // String? selectedItem='category';
  //
  // List<String> list2=['subcategory','sindhav88@gmail.com',];
  // String? list2item='subcategory';

  List<String>? CategoryList = [];
  var displayInitialCat;
  void catDisplay() async{
    ProductCategoryDisplayModel data1= await ProductCatDisplayAPI().cat(getName);
    setState(() {
      CategoryList = data1.server?.map((e) => e.catname.toString()).toList() ;
      displayInitialCat=data1.server![0].catname.toString();
      for(int i=0;i<CategoryList!.length;i++){
        debugPrint(data1.server![i].catname.toString());
      }
    });
  }

  late String catid="164";
  late String subcatid="217";
  var id1;
  // var categoryName;
  void getCatId(categoryName)async{
    ProductCategoryDisplayModel data= await ProductCatDisplayAPI().cat(getName);
    for(var i = 0 ; i<data.server!.length;i++){
      if(categoryName == data.server?[i].catname){
        id1= data.server?[i].catid.toString();
        setState(() {
          catid=id1.toString();
          print(catid);
          SubcatDisplay();
        });


      }
    }
  }

  List<String>? SubCategoryList = [];
  var displayInitialSubcat;
  void SubcatDisplay() async{
    ProductSubCategoryDisplayModel data2= await ProductSubCategoryDisplayAPI().subcat(catid);
    for(var i = 0 ; i<data2.server!.length;i++){
      SubCategoryList = data2.server?.map((e) => e.subcatname.toString()).toList() ;
      displayInitialSubcat=data2.server![0].subcatname.toString();
      for(int i=0;i<SubCategoryList!.length;i++){
        debugPrint(data2.server![i].subcatname.toString());
      }
    }
  }

  var id2;
  void getSubCatId(subcategoryName)async{
    ProductSubCategoryDisplayModel data= await ProductSubCategoryDisplayAPI().subcat(catid);
    for(var i = 0 ; i<data.server!.length;i++){
      if(subcategoryName == data.server?[i].subcatname){
        id2= data.server?[i].subcatid.toString();
        setState(() {
          subcatid=id2.toString();
          print(subcatid);
        });
      }
    }
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
            "Product",
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
          shadowColor: Colors.transparent,
        ),
        body: Container(
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: InkWell(
                      //  width: 50.w,
                        onTap: (){
                          catDisplay();
                        },
                        child: Container(
                          //  height: 5.92.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.teal,width: 2),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: displayInitialCat,
                            items: CategoryList!.map((item) => DropdownMenuItem(
                              value: item,
                              child: SizedBox(child: Text(item,style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                            )
                            ).toList(),
                            onChanged: (item)=>setState((){
                              displayInitialCat=item;
                              getCatId(displayInitialCat);
                              print(displayInitialCat);
                            }),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        //  width: 50.w,
                        onTap: (){
                         // SubcatDisplay();
                        },
                        child: Container(
                          //  height: 5.92.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.teal,width: 2),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: displayInitialSubcat,
                            items: SubCategoryList!.map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),maxLines: 1,),
                            )
                            ).toList(),
                            onChanged: (item)=>setState((){
                              displayInitialSubcat=item;
                              getSubCatId(displayInitialSubcat);
                              print(displayInitialSubcat);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.36.h,),

               // SizedBox(height: 10,),
                FutureBuilder(
                    future: EmpProductDisplayAPI().products(getCName, getName, "", catid, subcatid),
                    builder: (BuildContext context, snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return  Center(child: CircularProgressIndicator(),);
                      }
                      else if(snapshot.hasData){
                        return Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data!.server!.length,
                                itemBuilder: (context,index){
                                  return  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 3.4.h),
                                    child: Container(
                                      height: 18.95.h,
                                      width: 36.41.w,
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(pid: snapshot.data!.server![index].pid.toString(),)));
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image.network(snapshot.data!.server![index].pphoto.toString(),height: 14.5.h,width: 36.41.w,errorBuilder: (context, error, stackTrace) => SizedBox(width: 36.41.w,height: 14.5.h,child: Container(color: Colors.grey,),)),
                                          //  Text("Code : ${snapshot.data!.server![index].pcode.toString()}",style: TextStyle(fontSize: 9.09.sp)),
                                            Text("Name : ${snapshot.data!.server![index].pname.toString()}",style: TextStyle(fontSize: 9.09.sp)),
                                            Text("Price : Rs. ${snapshot.data!.server![index].price.toString()}",style: TextStyle(color: Colors.green,fontSize: 7.583.sp),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                              crossAxisCount: 2,
                            ),
                            )
                        );
                      }
                      else{
                        return Text("No data");
                      }
                    }
                ),
                // GridView.builder(
                //   shrinkWrap: true,
                //   physics: BouncingScrollPhysics(),
                //   itemCount: 10,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //
                //       crossAxisCount: 2,
                //       ),
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container(
                //       height: 18.95.h,
                //       width: 36.41.w,
                //       child: InkWell(
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                //         },
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //
                //             Image.asset("assets/product_photo.png",height: 14.5.h,width: 36.41.w,),
                //             Text("Code : 2xrt",style: TextStyle(fontSize: 9.09.sp)),
                //             Text("Price : Rs.999",style: TextStyle(color: Colors.green,fontSize: 7.583.sp),),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
        )
    );
  }
}

