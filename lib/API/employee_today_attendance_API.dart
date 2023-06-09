import 'dart:convert';
import 'package:care_for_each/Models/EmployeeTodayAttendanceModel.dart';
import 'package:care_for_each/Models/VisitorDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../Models/OrderDetailDisplayModel.dart';


class EmployeeTodayAttendanceAPI {
  EmployeeTodayAttendanceAPI();

  Future<EmployeeTodayAttendanceModel> employee(c_emailid,date) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/employee_today_attendance.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid':c_emailid,
          'date':date,

        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Attendance :-" + response.body);

    return EmployeeTodayAttendanceModel.fromJson(data);
  }
}