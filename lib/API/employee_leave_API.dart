import 'dart:convert';
import 'package:care_for_each/Models/CategoryDisplayModel.dart';

import '../Models/CompanyProfileModel.dart';
import 'package:http/http.dart' as http;

import '../Models/EmployeeLeaveModel.dart';

class EmployeeLeaveAPI {
  EmployeeLeaveAPI();

  Future<EmployeeLeaveModel> leave(emailid,status) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/employee_leave.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid': emailid,
          'status':status
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Employee leave :- " + response.body);

    return EmployeeLeaveModel.fromJson(data);
  }
}