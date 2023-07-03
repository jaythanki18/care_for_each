import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/EmployeeLoginLogoutModel.dart';


class EmployeeLoginLogutAPI {
  EmployeeLoginLogutAPI();

  Future<EmployeeLoginLogoutModel> login(e_emailid,late,long,address,attendance_type) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_login_logout.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid': e_emailid,
          'late': late,
          'long' : long,
          'address' : address,
          'attendance_type' : attendance_type
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Login logout : " + response.body);

    return EmployeeLoginLogoutModel.fromJson(data);
  }
}