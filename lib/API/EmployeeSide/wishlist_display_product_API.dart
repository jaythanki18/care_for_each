import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';
import '../../Models/EmployeeSide/WishlistDisplayProductModel.dart';


class WishlistDisplayProductAPI {
  WishlistDisplayProductAPI();

  Future<WishlistDisplayProductModel> wishlist(e_emailid,wcid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/wishlist_display_product.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid':e_emailid,
          'wcid':wcid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("wishlist display product: " + response.body);

    return WishlistDisplayProductModel.fromJson(data);
  }
}