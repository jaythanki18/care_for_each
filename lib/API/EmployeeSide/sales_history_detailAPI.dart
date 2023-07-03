import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/CustomerListModel.dart';
import 'package:care_for_each/Models/EmployeeSide/SalesHistoryDetailModel.dart';
import 'package:care_for_each/Models/VisitorDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';


class SalesHistoryDetailAPI {
  SalesHistoryDetailAPI();

  Future<SalesHistoryDetailModel> sales(oid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/sales_history_details.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'oid':oid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("customers : " + response.body);

    return SalesHistoryDetailModel.fromJson(data);
  }
}