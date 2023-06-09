import 'dart:convert';
import 'package:care_for_each/Models/EmployeeComplainModel.dart';
import 'package:care_for_each/Models/EmployeeDataModel.dart';
import 'package:http/http.dart' as http;
import '../Models/ProductInsertModel.dart';

class EmployeeComplainAPI {
  EmployeeComplainAPI();

  Future<EmployeeComplainModel> complainList(emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/employee_complain.php";
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
    print("Complaints :-" + response.body);

    return EmployeeComplainModel.fromJson(data);
  }
}