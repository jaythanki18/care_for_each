import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/CartDisplayModel.dart';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductDisplayModel.dart';
import 'package:http/http.dart' as http;


class CartDisplayAPI {
  CartDisplayAPI();

  Future<CartDisplayModel> cart(e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/cart_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid':e_emailid,
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Cart : " + response.body);

    return CartDisplayModel.fromJson(data);
  }
}