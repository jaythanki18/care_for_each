import 'dart:convert';
import 'package:care_for_each/Models/CategoryDisplayModel.dart';
import 'package:care_for_each/Models/CategoryManageModel.dart';

import '../Models/CompanyProfileModel.dart';
import 'package:http/http.dart' as http;

class CategoryManageAPI {
  CategoryManageAPI();

  Future<CategoryManageModel> categoryManage(c_email,catname,gst,type,catid) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/category_manage.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid': c_email,
          'catname':catname,
          'gst':gst,
          'type':type,
          'cat_id':catid,
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Category Manage" + response.body);

    return CategoryManageModel.fromJson(data);
  }
}