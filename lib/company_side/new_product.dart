import 'dart:io';

import 'package:care_for_each/API/ProductInsertAPI.dart';
import 'package:care_for_each/company_side/product_detail.dart';
import 'package:care_for_each/company_side/products.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../ui/add_visitor.dart';
import '../widgets/round_button.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _userimage=TextEditingController();
  TextEditingController pname=TextEditingController();
  TextEditingController pcode=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController min_sell_price=TextEditingController();
  TextEditingController stock=TextEditingController();
  TextEditingController minimum_stock=TextEditingController();
  TextEditingController pdesc=TextEditingController();

  String proName="";
  String proCode="";
  String proPrice="";
  String minimum_sell="";
  String proStock="";
  String min_stock="";
  String proDesc="";

  var _image;
  var imagePicker;
  var type;


  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    final items=['Select Category','Mobile Application','Digital Marketing','Customized Software','Man Power','Hello 2'];
    String? selectedItem='Select Category';

    List<String> list2=['Select Subcategory'];
    String? list2item='Select Subcategory';

    var photo;
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
          "New Product",
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.46.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 5.33.h,
                      width: 35.36.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.36.h),
                        border: Border.all(
                            color: Colors.teal,width: 2),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedItem,
                        items: items.map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item,style: TextStyle(color: Colors.black,fontSize: 10),),
                        )
                        ).toList(),
                        onChanged: (item)=>setState(()=>selectedItem=item),
                      ),
                    ),
                    SizedBox(width: 1.36.h,),
                    Container(
                      width: 35.36.w,
                      height: 5.33.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.36.h),
                        border: Border.all(
                            color: Colors.teal,width: 2),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: list2item,
                        items: list2.map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item,style: TextStyle(color: Colors.black,fontSize: 10),),
                        )
                        ).toList(),
                        onChanged: (item)=>setState(()=>list2item=item),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      TextFormField(controller: _userimage,);
                      var source = type == ImageSourceType.camera
                          ? ImageSource.camera
                          : ImageSource.gallery;
                      XFile image = await imagePicker.pickImage(
                          source: source,
                          imageQuality: 50,
                          preferredCameraDevice: CameraDevice.front);
                      setState(() {
                        _image = File(image.path);
                        photo=File(image.path);
                        _userimage=_image;
                      });
                      print(_userimage.text);
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.12.w),
                      child: Column(
                        children: [
                          SizedBox(height: 1.36.h,),
                          Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: _image != null
                                ? Image.file(
                              _image,
                              width: 28.560.w,
                              height: 15.630.h,
                              fit: BoxFit.fitHeight,
                            )
                                : Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Image.asset("assets/product_upload.png",width: 73.83.w,height: 16.82.h,)),
                          ),
                          SizedBox(height: 1.36.h,),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              onChanged: (value){
                                proName=value;
                                setState(() {
                                  print(proName);
                                });
                              },
                              controller: pname,
                              validator: (value){
                                if(value!.isEmpty ){
                                  return 'Enter correct name';
                                }
                                else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0,color: Colors.black12)
                                  ),
                                  labelText: "Product Name ",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              onChanged: (value){
                                proCode=value;
                                setState(() {
                                  print(proCode);
                                });
                              },
                              controller: pcode,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter product code';
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
                                  labelText: "Product Code *",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 1.36.h,),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              onChanged: (value){
                                proPrice=value;
                                setState(() {
                                  print(proPrice);
                                });
                              },
                              controller: price,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter a valid product price';
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
                                  labelText: "Product Price *",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 1.360.h,),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              onChanged: (value){
                                minimum_sell=value;
                                setState(() {
                                  print(minimum_sell);
                                });
                              },
                              controller: min_sell_price,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter a valid selling price';
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
                                  labelText: "Minimum Selling Price *",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 1.360.h,),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              onChanged: (value){
                                proStock=value;
                                setState(() {
                                  print(proStock);
                                });
                              },
                              controller: stock,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter a valid product stock';
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
                                  labelText: "Product Stock *",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 1.36.h,),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              onChanged: (value){
                                min_stock=value;
                                setState(() {
                                  print(min_stock);
                                });
                              },
                              controller: minimum_stock,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter a valid product stock';
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
                                  labelText: "Minimum Stock *",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          SizedBox(height: 1.36.h,),
                          SizedBox(
                            height: 5.92.h,
                            child: TextFormField(
                              onChanged: (value){
                                proDesc=value;
                                setState(() {
                                  print(proDesc);
                                });
                              },
                              controller: pdesc,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter a description';
                                }
                                else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0,color: Colors.black12)
                                  ),
                                  labelText: "Description *",
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(12, 25, 71, 1))),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.09.h,vertical: 5.09.h),
                            child: RoundButton(
                              title: "Add Product",
                              onTap: () {
                                FutureBuilder(
                                  future: ProductInsertAPI().productList(proName,proCode,proDesc,proPrice,proStock,min_stock,"",widget.c_emailid,"",""),
                                  builder: (BuildContext context, snapshot) {
                                    if(snapshot.connectionState==ConnectionState.waiting){
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                    else if(snapshot.hasData){
                                      return Column(
                                        children: [
                                          Text(snapshot.data!.server![0].status.toString())
                                        ],
                                      );
                                    }
                                    else{
                                      return Text("No data");
                                    }
                                  },

                                );
                                if(formKey.currentState!.validate()){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Products(c_emailid: widget.c_emailid,)));
                                }

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
