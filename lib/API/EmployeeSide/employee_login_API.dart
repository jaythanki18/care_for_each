import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:http/http.dart' as http;


class EmployeeLoginAPI {
  EmployeeLoginAPI();

  Future<EmployeeLoginModel> login(emailid,pword) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_login.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid': emailid,
          'pword':pword
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Login : " + response.body);

    return EmployeeLoginModel.fromJson(data);
  }
}