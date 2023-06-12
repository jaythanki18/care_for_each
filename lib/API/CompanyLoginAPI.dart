import 'dart:convert';
import 'package:care_for_each/Models/CompanyLoginModel.dart';

import '../Models/CompanyProfileEditModel.dart';
import '../Models/CompanyProfileModel.dart';
import 'package:http/http.dart' as http;

class CompanyLoginAPI {
  CompanyLoginAPI();

  Future<CompanyLoginModel> login(emailid,pword) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/company_login.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body: {
          'emailid': emailid,
          'pword':pword
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Profile edit" + response.body);

    return CompanyLoginModel.fromJson(data);
  }
}