import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/CustomerListModel.dart';
import 'package:care_for_each/Models/VisitorDisplayModel.dart';
import 'package:http/http.dart' as http;

import '../../Models/EmployeeSide/WishlistCustDisplayModel.dart';


class CustomerListAPI {
  CustomerListAPI();

  Future<CustomerListModel> customer(e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/customer_list.php";
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
    print("customers : " + response.body);

    return CustomerListModel.fromJson(data);
  }
}