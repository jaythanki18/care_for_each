import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/WishlistToCartModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';
import '../../Models/EmployeeSide/WishlistDisplayProductModel.dart';


class WishlistToCartAPI {
  WishlistToCartAPI();

  Future<WishlistToCartModel> wishlist(wcid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/wishlistocart.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'wcid':wcid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("wishlist to cart: " + response.body);

    return WishlistToCartModel.fromJson(data);
  }
}