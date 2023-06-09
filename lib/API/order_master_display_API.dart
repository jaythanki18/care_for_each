import 'dart:convert';
import 'package:care_for_each/Models/OrderMasterDisplayModel.dart';
import 'package:http/http.dart' as http;


class OrderMasterDisplayAPI {
  OrderMasterDisplayAPI();

  Future<OrderMasterDisplayModel> orderList(c_emailid,duration,e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/ordermaster_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid':c_emailid,
          'duration':duration,
          'e_emailid':e_emailid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Orders :-" + response.body);

    return OrderMasterDisplayModel.fromJson(data);
  }
}