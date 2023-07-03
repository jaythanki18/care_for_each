import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveModel.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeSubcatProductDisplayModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductCatDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/EmployeeProfileModel.dart';



class EmployeeSubcatProductDisplayAPI {
  EmployeeSubcatProductDisplayAPI();

  Future<EmployeeSubcatProductDisplayModel> cat(e_emailid,catid,subcatid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employe_subcat_product_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid':e_emailid,
          'catid':catid,
          'subcatid':subcatid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("employee subcat product display: " + response.body);

    return EmployeeSubcatProductDisplayModel.fromJson(data);
  }
}