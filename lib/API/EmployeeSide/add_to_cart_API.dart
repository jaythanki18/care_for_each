import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/AddToCartModel.dart';


class AddToCartAPI {
  AddToCartAPI();

  Future<AddToCartModel> products(emailid,pid,qty,sprice) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/add_to_cart.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid': emailid,
          'pid':pid,
          'qty':qty,
          'sprice':sprice
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Add to cart : " + response.body);

    return AddToCartModel.fromJson(data);
  }
}