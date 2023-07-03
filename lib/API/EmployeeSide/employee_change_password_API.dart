import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeChangePasswordModel.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductCatDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/EmployeeProfileModel.dart';



class EmployeeChangePasswordAPI {
  EmployeeChangePasswordAPI();

  Future<EmployeeChangePasswordModel> password(e_emailid,op,np) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_change_password.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid':e_emailid,
          'op':op,
          'np':np
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("password change : " + response.body);

    return EmployeeChangePasswordModel.fromJson(data);
  }
}