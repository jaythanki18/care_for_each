import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/CustomerListModel.dart';
import 'package:care_for_each/Models/EmployeeSide/SalesHistoryModel.dart';
import 'package:care_for_each/Models/VisitorDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';


class SalesHistoryAPI {
  SalesHistoryAPI();

  Future<SalesHistoryModel> sales(e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/sales_history.php";
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
    print("sales : " + response.body);

    return SalesHistoryModel.fromJson(data);
  }
}