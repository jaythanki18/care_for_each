import 'dart:convert';
import '../Models/Profile/CompanyProfileModel.dart';
import 'package:http/http.dart' as http;

class CategoryDisplayAPI {
  //CompanyProfileApi();

  Future<CompanyProfileModel> categoryList(c_email,e_email) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/category_display.ph";
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          // "Authorization": token,
        },
        body: jsonEncode({
          'c_emailid': c_email,
          'e_emailid': e_email
        })
    );
    var data = jsonDecode(response.body);
    print("CompanyProfile" + response.body);

    return CompanyProfileModel.fromJson(data);
  }
}