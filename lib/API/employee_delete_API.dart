import 'dart:convert';
import 'package:care_for_each/Models/EmployeeDeleteModel.dart';
import 'package:http/http.dart' as http;


class EmployeeDeleteAPI {
  EmployeeDeleteAPI();

  Future<EmployeeDeleteModel> employee(emailid,e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/employee_delete.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid,
          'e_emailid': e_emailid,

        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Employee delete" + response.body);

    return EmployeeDeleteModel.fromJson(data);
  }
}