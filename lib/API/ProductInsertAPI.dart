import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/ProductInsertModel.dart';

class ProductInsertAPI {
  ProductInsertAPI();

  Future<ProductInsertModel> productList(pname,pcode,pdesc,price,stock,minimum_stock,subcategory,c_emailid,sprice,pphoto) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/product_insert.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'pname': pname,
          'pcode':pcode,
          'pdesc':pdesc,
          'price':price,
          'stock':stock,
          'minimum_stock':minimum_stock,
          'subcategory':subcategory,
          'c_emailid':c_emailid,
          'sprice':sprice,
          'pphoto':pphoto
          
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Product insert" + response.body);

    return ProductInsertModel.fromJson(data);
  }
}