import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/EmployeeProfileModel.dart';



class EmployeeProfileAPI {
  EmployeeProfileAPI();

  Future<EmployeeProfileModel> profile(emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_profile.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("employee profile: " + response.body);

    return EmployeeProfileModel.fromJson(data);
  }
}