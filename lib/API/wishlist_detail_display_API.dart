import 'dart:convert';
import 'package:care_for_each/Models/WishlistDisplayCompanyModel.dart';
import 'package:http/http.dart' as http;

import '../Models/WishlistDetailDisplayModel.dart';

class WishlistDetailDisplayCompanyAPI {
  WishlistDetailDisplayCompanyAPI();

  Future<WishlistDetailDisplayCompanyModel> wishlistDetail(wcid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/whislist_detail_display_company.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body: {
          'wcid': wcid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Wishlist detail display" + response.body);

    return WishlistDetailDisplayCompanyModel.fromJson(data);
  }
}