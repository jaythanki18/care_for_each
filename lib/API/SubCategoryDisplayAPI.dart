import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/SubCategoryDisplayModel.dart';

class SubCategoryDisplayAPI {
  //CompanyProfileApi();

  Future<SubCategoryDisplayModel> subcategoryList(c_email) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/subcategory_display.php";
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
    print("Subcategory" + response.body);

    return SubCategoryDisplayModel.fromJson(data);
  }
}