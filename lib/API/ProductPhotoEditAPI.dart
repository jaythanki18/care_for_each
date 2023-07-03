import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/ProductPhotoEditModel.dart';


class ProductPhotoEditAPI {
  ProductPhotoEditAPI();

  Future<ProductPhotoEditModel> phot(pid,pphoto) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/product_photo_edit.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'pid':pid,
          'pphoto':pphoto
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Product photo" + response.body);

    return ProductPhotoEditModel.fromJson(data);
  }
}