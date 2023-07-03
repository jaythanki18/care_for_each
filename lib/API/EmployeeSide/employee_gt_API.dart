import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/EmployeeSide/EmployeeGT.dart';


class EmployeeGTAPI {
  EmployeeGTAPI();

  Future<EmployeeGT> gt(emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/gt.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid,

        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("gt : " + response.body);

    return EmployeeGT.fromJson(data);
  }
}