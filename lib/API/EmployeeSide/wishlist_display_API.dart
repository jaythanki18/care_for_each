import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/EmployeeLoginModel.dart';
import 'package:care_for_each/Models/EmployeeSide/ProductDisplayModel.dart';
import 'package:care_for_each/Models/EmployeeSide/WishlistDisplayModel.dart';
import 'package:http/http.dart' as http;


class WishlistDisplayAPI {
  WishlistDisplayAPI();

  Future<WishlistDisplayModel> wishlist(custemailid,emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/wishlist_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'custemailid':custemailid,
          'emailid':emailid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("wishlist display : " + response.body);

    return WishlistDisplayModel.fromJson(data);
  }
}