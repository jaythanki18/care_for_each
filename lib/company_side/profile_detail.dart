import 'package:care_for_each/Models/CompanyProfileEditModel.dart';
import 'package:care_for_each/company_side/company_profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../API/CompanyProfileAPI.dart';
import '../API/company_profile_edit_API.dart';
import '../Models/CompanyProfileModel.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  String edit="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
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
          "Company Profile",
          style: TextStyle(color: Colors.white),
        ),
        actions: [

          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Colors.white
          ),
        ],
        backgroundColor: Colors.teal,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<CompanyProfileModel>(
              future: CompanyProfileApi().profileList(widget.c_emailid),
              builder: (BuildContext context, snapshot){

                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                else if (snapshot.hasData){
                  TextEditingController cname=TextEditingController(text: snapshot.data!.server![0].cname.toString());
                  TextEditingController personname=TextEditingController(text: snapshot.data!.server![0].personname.toString());
                  TextEditingController address=TextEditingController(text: snapshot.data!.server![0].address.toString());
                  TextEditingController designation=TextEditingController(text: snapshot.data!.server![0].designation.toString());
                  return Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Container(
                                       height: 21.h,width: 51.3.w,
                                      child: CircleAvatar(
                                        child:  Image.network(
                                          snapshot.data!.server![0].cPhoto.toString(),
                                        ),
                                        backgroundColor: Colors.white,
                                      )
                                  )
                                // child: Text( snapshot.data!.server![0].cPhoto.toString(),style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                                // ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:38.46.w,
                                    child: TextFormField(
                                     controller: cname,
                                    //  initialValue: snapshot.data!.server![0].cname.toString(),
                                      decoration: InputDecoration(
                                        labelText: "Company Name",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(onPressed: (){
                                    print(widget.c_emailid);
                                    print(cname.text);
                                    showAlertEditDialog(context, "Company name", widget.c_emailid, "cname", cname.text);
                                   // editProfile(widget.c_emailid, "cname", cname.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 38.46.w,
                                    child: TextFormField(
                                      controller: personname,
                                      //  initialValue: snapshot.data!.server![0].cname.toString(),
                                      decoration: InputDecoration(
                                        labelText: "Person Name",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(onPressed: (){
                                    showAlertEditDialog(context, "Personn name", widget.c_emailid, "personname", personname.text);
                                   // editProfile(widget.c_emailid, "personname", personname.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 38.46.w,
                                    child: TextFormField(
                                      controller: designation,
                                      //  initialValue: snapshot.data!.server![0].cname.toString(),
                                      decoration: InputDecoration(
                                        labelText: "Designation",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(onPressed: (){
                                    showAlertEditDialog(context, "Designation", widget.c_emailid, "designation", designation.text);
                                  //  editProfile(widget.c_emailid, "designation", designation.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 38.46.w,
                                    //height: 20.h,
                                    child: TextFormField(
                                      controller: address,
                                      //  initialValue: snapshot.data!.server![0].cname.toString(),
                                      decoration: InputDecoration(
                                        labelText: "Address",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(onPressed: (){
                                    showAlertEditDialog(context, "Address", widget.c_emailid, "address", address.text);
                                  //  editProfile(widget.c_emailid, "address", address.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  );

                }
                else{
                  return Text("No data");
                }
              },

            ),
          ],
        ),
      ),
    );
  }

  String showAlertEditDialog(BuildContext context,name,c_email,fname,initval) {
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
                            CompanyProfileEditModel data = await CompanyProfileEditApi().profileEdit(widget.c_emailid, fname, value.text);
                            Text(data.server![0].result.toString());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetail(c_emailid: widget.c_emailid,)));
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
}

editProfile(c_emailid,fname,value){
  print("c_emailid : "+c_emailid);
  print("fname : "+fname);
  print("value : "+value);
  FutureBuilder(
    future: CompanyProfileEditApi().profileEdit(c_emailid, fname, value),
    builder: (context,snapshot){
      if (snapshot.data == null) {
        return Text("No data");
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      );
    },

  );
}

