import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProceedWithWCIDModel.dart';
import 'package:care_for_each/Models/EmployeeSide/WishlistToCartModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';
import '../../Models/EmployeeSide/WishlistDisplayProductModel.dart';


class EmployeeLeaveAPI {
  EmployeeLeaveAPI();

  Future<EmployeeLeaveModel> leave(emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employee_leave.php";
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
    print("employee leave: " + response.body);

    return EmployeeLeaveModel.fromJson(data);
  }
}