import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/EmployeeLeaveModel.dart';
import '../Models/EmployeeLeaveStatusChangeModel.dart';

class EmployeeLeaveStatusChangeAPI {
  EmployeeLeaveStatusChangeAPI();

  Future<EmployeeLeaveStatusChangeModel> status(emailid,lrid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/employe_leave_statuschange.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid': emailid,
          'lrid':lrid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Employee leave status:- " + response.body);

    return EmployeeLeaveStatusChangeModel.fromJson(data);
  }
}