import 'dart:convert';
import 'package:care_for_each/Models/EmployeeEditConfirmModel.dart';
import 'package:care_for_each/Models/EmployeeTodayAttendanceModel.dart';
import 'package:http/http.dart' as http;


class EmployeeEditConfirmAPI {
  EmployeeEditConfirmAPI();

  Future<EmployeeEditConfirmModel> employee(c_emailid,fname,value,e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/employee_edit_confirm.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid':c_emailid,
          'fname':fname,
          'value':value,
          'e_emailid':e_emailid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Employee edit :-" + response.body);

    return EmployeeEditConfirmModel.fromJson(data);
  }
}