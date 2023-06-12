import 'package:flutter/material.dart';

import '../API/CompanyProfileAPI.dart';
import '../API/company_profile_edit_API.dart';
import '../Models/CompanyProfileModel.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {

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
              future: CompanyProfileApi().profileList("info@webearl.com"),
              builder: (BuildContext context, snapshot){
               TextEditingController cname=TextEditingController(text: snapshot.data!.server![0].cname.toString());
               TextEditingController personname=TextEditingController(text: snapshot.data!.server![0].personname.toString());
               TextEditingController address=TextEditingController(text: snapshot.data!.server![0].address.toString());
               TextEditingController designation=TextEditingController(text: snapshot.data!.server![0].designation.toString());

                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                else if (snapshot.hasData){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 63.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Container(
                                       height: 200,width: 200,
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
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:150,
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
                                    editProfile("info@webearl.com", "cname", cname.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150,
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
                                    editProfile("info@webearl.com", "personname", personname.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150,
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
                                    editProfile("info@webearl.com", "designation", designation.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150,
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
                                    editProfile("info@webearl.com", "address", address.text);
                                  }, icon: Icon(Icons.edit))
                                ],
                              ),

                            ],
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.teal)
                              ),
                                onPressed: ()
                                {
                                  print("Company name : "+cname.text);
                                  print("Person name : "+personname.text);
                                  print("Designation name : "+designation.text);
                                  print("Address : "+address.text);
                                  
                                }, child: Text("Edit")
                            ),
                          )
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
}

editProfile(c_emailid,fname,value){
  print("c_emailid : "+c_emailid);
  print("fname : "+fname);
  print("value : "+value);
  FutureBuilder(
    future: CompanyProfileEditApi().profileEdit(c_emailid, fname, value),
    builder: (context,snapshot){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      );
    },

  );
}