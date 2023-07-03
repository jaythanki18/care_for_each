import 'dart:convert';

import 'package:care_for_each/Models/EmployeeSide/EmployeeSubcatCategoryDisplayModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductInCartEditModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductSubCategoryDisplayModel.dart';
import 'package:http/http.dart' as http;


class EmployeeSubcatCategoryproductDisplayAPI {
  EmployeeSubcatCategoryproductDisplayAPI();

  Future<EmployeeSubcatCategoryDisplayModel> displayProduct(e_emailid,catid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/employe_subcat_category_product_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid': e_emailid,
          'catid' : catid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("subcat category display : " + response.body);

    return EmployeeSubcatCategoryDisplayModel.fromJson(data);
  }
}