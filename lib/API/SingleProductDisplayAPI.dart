import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/SingleProductDisplayModel.dart';

class SingleProductDisplayAPI {
 // SingleProductDisplayAPI();

  Future<SingleProductDisplayModel> productList(c_email,pid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/single_product_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid': c_email,
          'pid':pid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Single Product display" + response.body);

    return SingleProductDisplayModel.fromJson(data);
  }
}