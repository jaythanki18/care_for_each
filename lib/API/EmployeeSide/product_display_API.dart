import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductDisplayModel.dart';
import 'package:http/http.dart' as http;


class EmpProductDisplayAPI {
  EmpProductDisplayAPI();

  Future<EmpProductDisplayModel> products(c_emailid,e_emailid,pid,catid,subcatid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/product_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid': c_emailid,
          'e_emailid':e_emailid,
          'pid':pid,
          'catid':catid,
          'subcatid':subcatid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("products : " + response.body);

    return EmpProductDisplayModel.fromJson(data);
  }
}