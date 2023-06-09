import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/OrderDetailDisplayModel.dart';


class OrderDetailDisplayAPI {
  OrderDetailDisplayAPI();

  Future<OrderDetailDisplayModel> orderDetailList(c_emailid,oid,eid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/orderdetail_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid':c_emailid,
          'oid':oid,
          'eid':eid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Orders details:-" + response.body);

    return OrderDetailDisplayModel.fromJson(data);
  }
}