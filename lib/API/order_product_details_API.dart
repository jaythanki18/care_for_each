import 'dart:convert';
import 'package:care_for_each/Models/OrderProductDetailsModel.dart';
import 'package:http/http.dart' as http;

import '../Models/OrderDetailDisplayModel.dart';


class OrderProductDetailsAPI {
  OrderProductDetailsAPI();

  Future<OrderProductDetailsModel> orderProductDetail(c_emailid,oid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/order_product_details.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid':c_emailid,
          'oid':oid,
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Orders product details:-" + response.body);

    return OrderProductDetailsModel.fromJson(data);
  }
}