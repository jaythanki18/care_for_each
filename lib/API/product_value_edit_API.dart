import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/ProductValueEditModel.dart';
import '../Models/SingleProductDisplayModel.dart';

class ProductValueEditAPI {
  // SingleProductDisplayAPI();

  Future<ProductValueEditModel> productEditList(pid,fname,value) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/product_value_edit.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'pid': pid,
          'fname':fname,
          'value':value
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print(" Product Edit" + response.body);

    return ProductValueEditModel.fromJson(data);
  }
}