import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/VisitorAddModel.dart';
import 'package:care_for_each/Models/VisitorDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';


class VisitorAddAPI {
  VisitorAddAPI();

  Future<VisitorAddModel> visitor(e_emailid,visitername,companyname,area,address,discussion,contactnum,visiter_emailid,photo) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/visiter_add.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid':e_emailid,
          'visitername':visitername,
          'companyname':companyname,
          'area':area,
          'address':address,
          'discussion':discussion,
          'contactnum':contactnum,
          'visiter_emailid':visiter_emailid,
          'photo':photo
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("visitor add : " + response.body);

    return VisitorAddModel.fromJson(data);
  }
}