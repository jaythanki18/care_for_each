import 'dart:convert';
import '../Models/Profile/CompanyProfileModel.dart';
import 'package:http/http.dart' as http;

class CompanyProfileApi {
  //CompanyProfileApi();

  Future<CompanyProfileModel> profileList(email) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/company_profile.ph";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        // "Authorization": token,
      },
      body: jsonEncode({
        'emailid': email,
      })
    );
    var data = jsonDecode(response.body);
    print("CompanyProfile" + response.body);

    return CompanyProfileModel.fromJson(data);
  }
}