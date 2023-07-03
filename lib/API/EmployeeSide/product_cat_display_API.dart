import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLeaveModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductCatDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/EmployeeProfileModel.dart';



class ProductCatDisplayAPI {
  ProductCatDisplayAPI();

  Future<ProductCategoryDisplayModel> cat(e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/product_cat_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid':e_emailid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("product category : " + response.body);

    return ProductCategoryDisplayModel.fromJson(data);
  }
}