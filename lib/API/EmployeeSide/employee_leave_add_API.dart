import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveAddModel.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/EmployeeProfileModel.dart';



class EmployeeLeaveAddAPI {
  EmployeeLeaveAddAPI();

  Future<EmployeeLeaveAddModel> leave(emailid,reason,enddate,startdate,e_token) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_leave_insert.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid,
          'reason':reason,
          'startdate':startdate,
          'enddate':enddate,
          'e_token':e_token
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("employee leave: " + response.body);

    return EmployeeLeaveAddModel.fromJson(data);
  }
}