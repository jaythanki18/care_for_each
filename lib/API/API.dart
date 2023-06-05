

import 'dart:convert';

import '../Models/CompanyLoginModel.dart';
import 'package:http/http.dart' as http;

var LURL = "http://www.careforeach.com/new/company/company_api_jay/webservices";
class LoginApi{
  LoginApi();
  Future<CompanyLoginModel> loginList(email,password) async{
    var url = LURL + "/company_login.php";
    http.Response response = await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          "emailid":email,
          "pword":password

        }));
    var data = jsonDecode(response.body);
    print("SignIn" + response.body);
    return CompanyLoginModel.fromJson(data);
  }
}