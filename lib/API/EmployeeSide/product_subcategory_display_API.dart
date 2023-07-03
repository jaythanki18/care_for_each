import 'dart:convert';

import 'package:care_for_each/Models/EmployeeSide/ProductSubCategoryDisplayModel.dart';
import 'package:http/http.dart' as http;

class ProductSubCategoryDisplayAPI {
  ProductSubCategoryDisplayAPI();

  Future<ProductSubCategoryDisplayModel> subcat(catid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/sub_cat_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'catid':catid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("product subcategory : " + response.body);

    return ProductSubCategoryDisplayModel.fromJson(data);
  }
}