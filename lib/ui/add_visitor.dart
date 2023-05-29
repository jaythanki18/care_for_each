import 'package:care_for_each/ui/profile.dart';
import 'package:care_for_each/ui/visitor.dart';
import 'package:care_for_each/ui/visitor_details.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';

class AddVisitor extends StatefulWidget {
  const AddVisitor({Key? key}) : super(key: key);

  @override
  State<AddVisitor> createState() => _AddVisitorState();

  @override
  void dispose() {
    // TODO: implement dispose

  }
}

class _AddVisitorState extends State<AddVisitor> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
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
          "Add Visitor",
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
      body: ImageFromGalleryEx(),
    );
  }
}

enum ImageSourceType { gallery, camera }

class ImageFromGalleryEx extends StatefulWidget {

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState();
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _name=TextEditingController();
  TextEditingController _visitors_company=TextEditingController();
  TextEditingController _contact=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _address=TextEditingController();
  TextEditingController _discussion=TextEditingController();
  TextEditingController _userimage=TextEditingController();
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState();

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _name.dispose();
    _visitors_company.dispose();
    _contact.dispose();
    _email.dispose();
    _address.dispose();
    _discussion.dispose();
    _userimage.dispose();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 1.h,),
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
                      });
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 7.43.w),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: _image != null
                                ? Image.file(
                                    _image,
                                    width: 28.46.w,
                                    height: 15.630.h,
                                    fit: BoxFit.fitHeight,
                                  )
                                : Container(
                                    decoration: BoxDecoration(color: Colors.white),
                                    child: Image.asset("assets/img_4.png"),height: 15.630.h,width: 28.46.w,),
                          ),
                          SizedBox(height: 2.84.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload a photo",
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1),
                                    fontSize: 15.92.sp),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.cloud_upload,
                                color: Color.fromRGBO(12, 25, 71, 1),
                              )
                            ],
                          ),
                          TextFormField(
                            controller: _name,
                            keyboardType: TextInputType.name,
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value!)){
                                return 'Enter correct name';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                          SizedBox(height: 1.77.h,),
                          TextFormField(
                            controller: _visitors_company,
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter correct Name';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Visitor's company name",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                          SizedBox(height: 1.77.h,),
                          TextFormField(
                            controller: _contact,
                            keyboardType: TextInputType.phone,
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r"^\+?[0-9]{10}$").hasMatch(value!)){
                                return 'Enter correct Number';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Visitor's contact No",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                          SizedBox(height: 1.77.h,),
                          TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                                return 'Enter correct email';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Visitor's Email",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                          SizedBox(height: 1.77.h,),
                          TextFormField(
                            controller: _address,
                            keyboardType: TextInputType.streetAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter correct Address';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Visitor's Address",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                          SizedBox(height: 1.77.h,),
                          TextFormField(
                            controller: _discussion,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter correct date';
                              }
                              else{
                                return null;
                              }
                            },
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                labelText: "Discussion",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.33.h),
              Container(
                child: Center(
                  child: Container(
                    width: 77.9.w,
                    height: 6.51.h,
                    child: ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor()));
                          }
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor(name: _name.text, company: _visitors_company.text, phone: _contact.text, email: _email.text, address: _address.text, discussion: _discussion.text)));
                        },
                        child: Text(
                          "Add Visitor",
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
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
          ),
        ),
      ),
    );
  }
}
