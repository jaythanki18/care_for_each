import 'dart:convert';
import 'package:care_for_each/Models/CategoryDisplayModel.dart';

import '../Models/CompanyProfileModel.dart';
import 'package:http/http.dart' as http;

class CategoryDisplayAPI {
  //CompanyProfileApi();

  Future<CategoryDisplayModel> categoryList(c_email) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/category_display.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid': c_email,

        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Category display :- " + response.body);

    return CategoryDisplayModel.fromJson(data);
  }
}