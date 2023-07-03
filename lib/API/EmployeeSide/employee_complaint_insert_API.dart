import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveAddModel.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/EmployeeComplaintInsertModel.dart';
import '../../Models/EmployeeSide/EmployeeProfileModel.dart';



class EmployeeComplaintInsertAPI {
  EmployeeComplaintInsertAPI();

  Future<EmployeeComplaintInsert> complaint(emailid,subject,description) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_complain_insert.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid,
          'subject':subject,
          'descripton':description
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("employee complaint insert: " + response.body);

    return EmployeeComplaintInsert.fromJson(data);
  }
}