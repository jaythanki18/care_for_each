import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductDisplayModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductInCartEditModel.dart';
import 'package:http/http.dart' as http;


class ProductInCartEditAPI {
  ProductInCartEditAPI();

  Future<ProductIntCartEditModel> cart(emailid,action,pid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/product_in_cart_edit.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid,
          'pid':pid,

        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("products in cart edit : " + response.body);

    return ProductIntCartEditModel.fromJson(data);
  }
}