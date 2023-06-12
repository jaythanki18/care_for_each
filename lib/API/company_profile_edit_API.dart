import 'dart:convert';
import '../Models/CompanyProfileEditModel.dart';
import '../Models/CompanyProfileModel.dart';
import 'package:http/http.dart' as http;

class CompanyProfileEditApi {
  CompanyProfileEditApi();

  Future<CompanyProfileEditModel> profileEdit(c_emailid,fname,value) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/company_edit.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body: {
          'c_emailid': c_emailid,
          'fname':fname,
          'value':value
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Profile edit" + response.body);

    return CompanyProfileEditModel.fromJson(data);
  }
}