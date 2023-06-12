import 'dart:convert';
import 'package:care_for_each/Models/WishlistDisplayCompanyModel.dart';
import 'package:http/http.dart' as http;

class WishlistDisplayCompanyAPI {
  WishlistDisplayCompanyAPI();

  Future<WishlistDisplayCompanyModel> wishlist(c_emailid,duration,e_emailid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/whislist_display_company.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body: {
          'c_emailid': c_emailid,
          'duration':duration,
          'e_emailid':e_emailid
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Wishlist display" + response.body);

    return WishlistDisplayCompanyModel.fromJson(data);
  }
}