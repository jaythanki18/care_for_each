import 'dart:io';
import 'package:care_for_each/API/product_value_edit_API.dart';
import 'package:care_for_each/Models/ProductValueEditModel.dart';
import 'package:care_for_each/company_side/products.dart';
import 'package:care_for_each/widgets/round_button2.dart';
import 'package:flutter/material.dart';
import '../API/ProductPhotoEditAPI.dart';
import '../API/SingleProductDisplayAPI.dart';
import '../ui/add_visitor.dart';
import '../widgets/round_button.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetail extends StatefulWidget {
  final String pid;
  final String c_emailid;
  const ProductDetail({Key? key,required this.pid, required this.c_emailid}) : super(key: key);


  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var _image;
  var imagePicker;
  var type;
  late String returnedVal;
  TextEditingController _userimage=TextEditingController();

  String edit="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
  }
 String showAlertEditDialog(BuildContext context,name,pid,fname,initval) {
    TextEditingController value=TextEditingController(text: initval);
    late String val;
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromRGBO(2, 25, 71, 1),
      title: Text(name,style: TextStyle(color: Colors.white),),
      // content: Text("Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        Column(
          children: [
            SizedBox(
              height: 5.92.h,
              child: TextFormField(
                onChanged: (val){
                  edit=val;
                  setState(() {

                  });
                },
                controller: value,
                style: TextStyle(color: Colors.white),
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
                    focusColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0,color: Colors.white)
                    ),
                    labelText: "Edit ",
                    labelStyle: TextStyle(
                        color: Colors.white)),
              ),
            ),
          Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                          child: Text("No",style: TextStyle(color: Colors.white))
                      ),
                    ),
                    SizedBox(width: 50,),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: InkWell(
                        onTap: (){
                           //val=value.text;
                        },
                        child: ElevatedButton(
                                onPressed: () async{
                                  ProductValueEditModel data = await ProductValueEditAPI().productEditList(widget.pid,fname,value.text.toString());
                                  print("productEditList(${widget.pid},${fname},${value.text.toString()})");
                                  print(data!.server![0].result.toString());
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(pid: widget.pid,c_emailid: widget.c_emailid,)));
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                                child: Text("Edit",style: TextStyle(color: Colors.white))
                        )

                      ),
                    ),
                  ],
                )



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
    return value.text;
  }
  editImage(userImage){

    FutureBuilder(
      future: ProductPhotoEditAPI().phot(widget.pid,userImage),
      builder: (context,snapshot2){
        return Text(snapshot2.data!.server![0].result.toString());
      },

    );
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
          "Product Detail",
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
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 11.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundButton2(title: 'Product Detail', onTap: (){}),
                  SizedBox(height: 2.01.h,),
                  FutureBuilder(
                      future: SingleProductDisplayAPI().productList(widget.c_emailid, widget.pid),
                      builder: (BuildContext context, snapshot){
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        else if(snapshot.hasData){
                          return SizedBox(
                            height:MediaQuery.of(context).size.height-29.62.h,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.server!.length,
                                  itemBuilder: (context,index){
                                    return  Column(
                                      children: [
                                        Card(
                                          shadowColor: Colors.grey,
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.36.h)),
                                          child: Container(
                                            width: 79.74.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(2.36.h),
                                                gradient: LinearGradient(colors: [
                                                  Color.fromRGBO(62, 86, 115, 0.2),
                                                  Color.fromRGBO(184, 184, 184, 0.1)
                                                ])
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 3.33.w,vertical: 3.33.w),
                                              child: Row(
                                                children: [
                                                  InkWell(onTap: (){
                                                    GestureDetector(
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
                                                          var photo=File(image.path);
                                                          _userimage=_image;
                                                        });
                                                        print(_userimage.text);
                                                      },
                                                    );
                                                    editImage(_userimage.text.toString());
                                                  },child: Image.network(snapshot.data!.server![index].pphoto.toString(),height: 25.64.w,width: 25.64.w,errorBuilder: (context, error, stackTrace) => SizedBox(width: 25.64.w,height: 100,child: Container(color: Colors.black54,),),)),
                                                  SizedBox(width: 3.33.w,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                          onTap: (){
                                                           showAlertEditDialog(context, "Name",pid,"pname",snapshot.data!.server![index].pname.toString());
                                                          },
                                                          child: SizedBox(width: 150,child: Text('Name : '+snapshot.data!.server![index].pname.toString(),style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1))
                                                      ),
                                                      InkWell(
                                                          onTap: (){
                                                            showAlertEditDialog(context, "Code",pid,"pcode",snapshot.data!.server![index].pcode.toString());
                                                          },
                                                          child: SizedBox(width: 150,child: Text('Code : '+snapshot.data!.server![index].pcode.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1))
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          showAlertEditDialog(context, "Available stock",pid,"stock",snapshot.data!.server![index].stock.toString());
                                                        },
                                                          child: SizedBox(width: 150,child: Text('Available Stock : '+snapshot.data!.server![index].stock.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1))
                                                      ),
                                                      InkWell(
                                                          onTap: (){
                                                            showAlertEditDialog(context, "Minimum stock",pid,"minimum_stock",snapshot.data!.server![index].minimumStock.toString());
                                                          },
                                                          child: SizedBox(width: 150,child: Text('Minimum Stock : '+snapshot.data!.server![index].minimumStock.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1))
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          showAlertEditDialog(context, "Minimum Price",pid,"sprice",snapshot.data!.server![index].sprice.toString(),);
                                                        },
                                                          child: SizedBox(width: 150,child: Text('Minimum price : ₹'+snapshot.data!.server![index].sprice.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1))
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          showAlertEditDialog(context, "Price",pid,"price",snapshot.data!.server![index].price.toString());
                                                        },
                                                        child: Container(
                                                          height: 3.08.h,
                                                          width: 30.76.w,
                                                          decoration: BoxDecoration(
                                                              color: Colors.teal,
                                                              borderRadius: BorderRadius.circular(10)
                                                          ),
                                                          child: Center(child: Text('Price : ₹'+snapshot.data!.server![index].price.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9.09.sp),),),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            showAlertEditDialog(context, "Description",pid,"pdesc",snapshot.data!.server![index].pdesc.toString());
                                          },
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            children: [
                                              Text('Description :',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                              Text(snapshot.data!.server![index].pdesc.toString(),style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ) ;
                                  })
                          );
                        }
                        else{
                          return Text("No data");
                        }
                      }
                  ),
                ],
              ),

              RoundButton(
                title: "Delete",
                onTap: () {
                  showAlertDialog(context,pid,"delete","",widget.c_emailid);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


showAlertDialog(BuildContext context,pid,fname,value,c_emailid) {


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromRGBO(2, 25, 71, 1),
    title: Text("Are you sure want to DELETE ?",style: TextStyle(color: Colors.white),),
    // content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.82.w),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                        child: Text("No",style: TextStyle(color: Colors.white))
                    ),
                    SizedBox(width: 12.82.w,),
                    ElevatedButton(
                        onPressed: () async{
                          ProductValueEditModel data =await ProductValueEditAPI().productEditList(pid, fname, value);
                          print(data!.server![0].result.toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Products(c_emailid: c_emailid,)));
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                        child: Text("Yes",style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ],
          )




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



