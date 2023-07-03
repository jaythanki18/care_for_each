import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/ProceedWithWCIDModel.dart';
import 'package:care_for_each/Models/EmployeeSide/WishlistToCartModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';
import '../../Models/EmployeeSide/WishlistDisplayProductModel.dart';


class ProceedWithWCIDAPI {
  ProceedWithWCIDAPI();

  Future<ProceedWithWCIDModel> proceed(wcid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/proceedwithwcid.php";
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
    print("proceed with wcid: " + response.body);

    return ProceedWithWCIDModel.fromJson(data);
  }
}