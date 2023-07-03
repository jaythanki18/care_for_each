import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeComplaintModel.dart';

import 'package:http/http.dart' as http;




class EmployeeComplaintAPI {
  EmployeeComplaintAPI();

  Future<EmployeeComplaintModel> complaint(emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_complain.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid,
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("employee leave: " + response.body);

    return EmployeeComplaintModel.fromJson(data);
  }
}