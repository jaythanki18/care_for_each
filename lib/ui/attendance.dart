import 'package:care_for_each/API/EmployeeSide/employee_login_logout_API.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginLogoutModel.dart';
import 'package:care_for_each/ui/cart.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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

  final formKey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  String locationMessage="Location of the User";
  String location = 'NULL, press button';
   Position? currentposition;
  String? currentAddress;
  late String lat;
  late String long;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      Fluttertoast.showToast(msg: 'Please keep your location on!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Fluttertoast.showToast(msg: 'permission is denied forever');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place= placemarks[0];
      setState(() {
        currentposition = position;
        currentAddress = "${place.street} ,${place.locality}, ${place.postalCode}, ${place.country}";
      });
    }
    catch(e){
      print(e); 
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<Position> _getCurrentLocation() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location service are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permissions are denied');
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permission are permanently denied, we cannot request more');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
          "Attendance",
          style: TextStyle(fontSize:18.95,color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CartScreen()));
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
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 2.36.h,),
              Container(
                child: Center(
                  child: Container(
                    width: 74.10.w,
                    height: 6.51.h,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Log In Details",
                          style: TextStyle(color: Color.fromRGBO(59, 150, 138, 1),fontSize: 18.95),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            ))),
                  ),
                ),
              ),
              SizedBox(height: 3.67.h,),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 20,left: 20),
              //     child: TextFormField(
              //       onTap: (){
              //         InputDecoration(
              //           fillColor: Color.fromRGBO(211, 224, 255, 1),
              //           filled: true,
              //             labelStyle: TextStyle(color: Color.fromRGBO(0, 52, 185, 1),fontWeight: FontWeight.bold,)
              //         );
              //       },
              //       validator: (value){
              //         if(value!.isEmpty){
              //           return 'Please enter address';
              //         }
              //       },
              //       decoration: InputDecoration(
              //         labelText: 'Address',
              //         labelStyle: TextStyle(color: Color.fromRGBO(12, 25, 71, 1),fontWeight: FontWeight.bold,),
              //         border: UnderlineInputBorder(),
              //       ),
              //     ),
              //   ),
              // ),

              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 20,left: 20),
              //     child: TextFormField(
              //       validator: (value){
              //         if(value!.isEmpty){
              //           return 'Please enter Date';
              //         }
              //       },
              //       decoration: InputDecoration(
              //         labelText: 'Date',
              //         labelStyle: TextStyle(color: Color.fromRGBO(12, 25, 71, 1),fontWeight: FontWeight.bold,backgroundColor:  Color.fromARGB(9, 31, 87, 1)),
              //         border: UnderlineInputBorder(),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 20,left: 20),
              //     child: TextFormField(
              //       validator: (value){
              //         if(value!.isEmpty){
              //           return 'Please enter Time';
              //         }
              //       },
              //       decoration: InputDecoration(
              //         labelText: 'Time',
              //         labelStyle: TextStyle(color: Color.fromRGBO(12, 25, 71, 1),fontWeight: FontWeight.bold,backgroundColor:  Color.fromARGB(9, 31, 87, 1)),
              //         border: UnderlineInputBorder(),
              //       ),
              //     ),
              //   ),
              // ),
             // Text(locationMessage,style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),),

            currentposition!=null ? Center(child: Text('Latitude : '+currentposition!.latitude.toString(),style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)))) :
            Padding(
              padding:  EdgeInsets.
                symmetric(horizontal: 10.w),
              child: Center(child: Text('Click on Get Cureent location button to get your location',style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),),),
            ),
            currentposition!=null ? Center(child: Text('Longitude : '+currentposition!.longitude.toString(),style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)),)) : Container(),
            currentAddress!=null ? Center(child: Text('Address : '+currentAddress.toString(),style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1)))) : Container(),
              SizedBox(height: 3.5.h,),
              ElevatedButton(onPressed: (){

               // _determinePosition();
                _determinePosition().then((value){
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  print(lat);
                  print(long);
                  setState(() {
                    locationMessage = 'Latitude : ${lat} , Longitude : ${long}';
                  });
                });


              },
                  child: Text("Get current location",style: TextStyle(color: Color.fromRGBO(59, 150, 138, 1)),),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.teal,
                  ))
              ),
              SizedBox(height: 3.5.h,),
              Container(
                child: Center(
                  child: Container(
                    width: 74.10.w,
                    height: 6.51.h,
                    child: ElevatedButton(
                        onPressed: () async{
                          print(getName);
                          print(currentposition!.latitude.toString());
                          print(currentposition!.longitude.toString());
                          EmployeeLoginLogoutModel data = await EmployeeLoginLogutAPI().login(getName, currentposition!.latitude.toString(), currentposition!.longitude.toString(), currentAddress.toString(), "login");
                          if(data.server![0].result.toString() == 'true'){
                           Fluttertoast.showToast(msg: 'Log in successfully');
                          }
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Color.fromRGBO(59, 150, 138, 1),fontSize: 18.95),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            ))),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("Break",style: TextStyle(color: Color.fromRGBO(12, 25, 71, 1),fontWeight: FontWeight.bold,fontSize: 22.75.sp)),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 38.28.w,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter Start Time';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Start time',
                            labelStyle: TextStyle(color: Color.fromRGBO(2, 25, 71, 1),fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 0.2*w,),
                  SizedBox(width: 0.40*w,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter End Time';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'End time',
                          labelStyle: TextStyle(color: Color.fromRGBO(2, 25, 71, 10),fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter Duration';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Duration',
                      labelStyle: TextStyle(color: Color.fromRGBO(12, 25, 71, 1),fontWeight: FontWeight.bold,backgroundColor:  Color.fromARGB(9, 31, 87, 1),),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.36.h,),
              Container(
                child: Center(
                  child: Container(
                    width: 74.14.w,
                    height: 5.80.h,
                    child: ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            final snackBar=SnackBar(content: Text("Submitting Form"));
                            formKey.currentState!.setState(() {

                            });
                          }
                        },
                        child: Text(
                          "Start Break",
                          style: TextStyle(color: Colors.teal,fontSize: 18.96.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.white,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.teal,
                            ))),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Center(
                  child: Container(
                    width: 74.14.w,
                    height: 5.80.h,
                    child: ElevatedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text(
                          "Log Out",
                          style: TextStyle(color: Colors.teal,fontSize: 18.96.sp),
                        ),
                        style: ElevatedButton.styleFrom(
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
  showAlertDialog(BuildContext context) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromRGBO(2, 25, 71, 1),
      title: Text("Are you sure want to LOGOUT ?",style: TextStyle(color: Colors.white),),
      // content: Text("Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50,),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: Text("No",style: TextStyle(color: Colors.white,fontSize: 10.61.sp))
              ),
            ),
            SizedBox(width: 12.82.w,),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: ElevatedButton(
                  onPressed: () async{
                    EmployeeLoginLogoutModel data = await EmployeeLoginLogutAPI().login(getName, currentposition!.latitude.toString(), currentposition!.longitude.toString(), currentAddress.toString(), "logout");
                    if(data.server![0].result.toString() == 'true'){
                      Fluttertoast.showToast(msg: 'Logout  successfully');
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: 10.61.sp))),
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

