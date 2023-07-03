import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/VisitorDetailModel.dart';
import 'package:care_for_each/Models/VisitorDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';


class VisitorDetailAPI {
  VisitorDetailAPI();

  Future<VisitorDetailModel> visitor(c_emailid,e_emailid,veid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/visitor_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid':c_emailid,
          'e_emailid':e_emailid,
          'veid':veid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("visitor details : " + response.body);

    return VisitorDetailModel.fromJson(data);
  }
}