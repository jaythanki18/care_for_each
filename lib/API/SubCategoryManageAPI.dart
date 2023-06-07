import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/SubCategoryManageModel.dart';

class SubCategoryManageAPI {
  SubCategoryManageAPI();

  Future<SubCategoryManageModel> subcategoryManage(c_email,subcatname,type,catid,subcat_id) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/subcategory_manage.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'c_emailid': c_email,
          'subcatname':subcatname,
          'type':type,
          'cat_id':catid,
          'subcat_id':subcat_id
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Sub Category Manage :- " + response.body);

    return SubCategoryManageModel.fromJson(data);
  }
}