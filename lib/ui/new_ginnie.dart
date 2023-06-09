import 'package:care_for_each/ui/ginnie_box.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';

class NewGinnie extends StatefulWidget {
  const NewGinnie({Key? key}) : super(key: key);

  @override
  State<NewGinnie> createState() => _NewGinnieState();
}

class _NewGinnieState extends State<NewGinnie> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController dateInput = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _message = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
          "New Ginnie",
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.55.h),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _name,
                            keyboardType: TextInputType.name,
                            maxLines: null,
                            decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value!)){
                                return 'Enter correct name';
                              }
                              else{
                                return null;
                              }
                            },
                          ),
                          TextFormField(
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
                                labelText: "Address",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                          TextFormField(
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
                                labelText: "Company name",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
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
                                labelText: "Contact No",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
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
                                labelText: "Email Id",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                          TextFormField(
                            controller: dateInput,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter correct date';
                              }
                              else{
                                return null;
                              }
                            },
                            //editing controller of this TextField
                            decoration: InputDecoration(
                                labelText: "Select a remind date",
                                //label text of field
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(
                                  12,
                                  25,
                                  71,
                                  1,
                                )),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromRGBO(12, 25, 71, 1),
                                )),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter correct date';
                              }
                              else{
                                return null;
                              }
                            },
                            controller: _message,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                labelText: "Description",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(12, 25, 71, 1))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  child: Center(
                    child: Container(
                      width: 77.94.w,
                      height: 6.51.h,
                      child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => GinnieBox()));
                            }

                          },
                          child: Text(
                            "Add Ginnie",
                            style: TextStyle(
                                color: Colors.teal, fontSize: 15.166.sp),
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
      ),
    );
  }
}
