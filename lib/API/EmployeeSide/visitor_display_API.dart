import 'dart:convert';
import 'package:care_for_each/Models/VisitorDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';


class VisitorDisplayAPI {
  VisitorDisplayAPI();

  Future<VisitorDisplayModel> visitor(c_emailid,e_emailid) async {
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
          'e_emailid':e_emailid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("visitor display : " + response.body);

    return VisitorDisplayModel.fromJson(data);
  }
}