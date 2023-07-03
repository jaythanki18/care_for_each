import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPurchase extends StatefulWidget {
  const NewPurchase({Key? key}) : super(key: key);

  @override
  State<NewPurchase> createState() => _NewPurchaseState();
}

class _NewPurchaseState extends State<NewPurchase> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  String? getName;
  String? getCName;
  void getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getName=sharedPreferences.getString("email")!;
      getCName=sharedPreferences.getString("c_email")!;
    });

  }
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _value=1;
  String mode='Cash';
  TextEditingController _name= TextEditingController();
  TextEditingController _address= TextEditingController();
  TextEditingController _ccn= TextEditingController();
  TextEditingController _contact= TextEditingController();
  TextEditingController _emailid= TextEditingController();
  TextEditingController _gt= TextEditingController();
  TextEditingController _paidamount= TextEditingController();
  TextEditingController _dueamount= TextEditingController();
  String name="";
  String address="";
  String ccn="";
  String contact="";
  String emailid="";
  String gt="";
  String paidamount="";
  String dueamount="";

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
          "New Purchase",
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
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _name,
                  onChanged: (value){
                    setState(() {
                      name=value;
                    });
                  },
                  validator: (value){
                    if(value!.isEmpty ){
                      return 'Enter correct name';
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  controller: _address,
                  onChanged: (value){
                    setState(() {
                      address=value;
                    });
                  },
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
                      suffixText: '*',
                      suffixStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _ccn,
                  onChanged: (value){
                    setState(() {
                      ccn=value;
                    });
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter correct Name';
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Company Name",
                      suffixText: '*',
                      suffixStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _contact,
                  onChanged: (value){
                    setState(() {
                      contact=value;
                    });
                  },
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
                      suffixText: '*',
                      suffixStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailid,
                  onChanged: (value){
                    setState(() {
                      emailid=value;
                    });
                  },
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
                      suffixText: '*',
                      suffixStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _gt,
                  onChanged: (value){
                    setState(() {
                      gt=value;
                    });
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Value should not null';
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Grand Total",
                      suffixText: '*',
                      suffixStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _paidamount,
                  onChanged: (value){
                    setState(() {
                      paidamount=value;
                    });
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Value should not null';
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Paid Amount",
                      suffixText: '*',
                      suffixStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _dueamount,
                  onChanged: (value){
                    setState(() {
                      dueamount=value;
                    });
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Value should not null';
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Due Amount",
                      suffixText: '*',
                      suffixStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(color: Color.fromRGBO(12,25,71,1))
                  ),
                ),
              // SizedBox(height: 0.59.h,),
                Text("Payment Type : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),decoration: TextDecoration.underline),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.5.w),
                  child: Row(
                    children: [
                      Radio(value: 1, groupValue: _value, onChanged: (value){
                        setState(() {
                          _value=value!;
                          mode="Cash";
                        });
                      }),
                      Text("Cash")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.5.w),
                  child: Row(
                    children: [
                      Radio(value: 2, groupValue: _value, onChanged: (value){
                        setState(() {
                          _value=value!;
                          mode="Cheque";
                        });
                      }),
                      Text("Cheque")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.5.w),
                  child: Row(
                    children: [
                      Radio(value: 3, groupValue: _value, onChanged: (value){
                        setState(() {
                          _value=value!;
                          mode="Online Pay";
                        });
                      }),
                      Text("Online Pay")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.5.w),
                  child: Row(
                    children: [
                      Radio(value: 4, groupValue: _value, onChanged: (value){
                        setState(() {
                        _value=value!;
                        mode="Demand Draft";
                      })
                        ;}),
                      SizedBox(height: 1.h,),
                      Text("Demand Draft")
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      width: 77.94.w,
                      height: 5.92.h,
                      child: ElevatedButton(
                          onPressed: () {
                            debugPrint(getName);
                            debugPrint(_name.text.toString());
                            debugPrint(_address.text.toString());
                            debugPrint(_ccn.text.toString());
                            debugPrint(_emailid.text.toString());
                            debugPrint(_gt.text.toString());
                            debugPrint(_paidamount.text.toString());
                            debugPrint(_dueamount.text.toString());
                            debugPrint(mode);
                            if(formKey.currentState!.validate()){

                            }
                            },
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Visitor(name: _name.text, company: _visitors_company.text, phone: _contact.text, email: _email.text, address: _address.text, discussion: _discussion.text)));
                          child: Text(
                            "Submit",
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
      ),
    );
  }
}
