import 'dart:convert';
import 'package:care_for_each/Models/EmployeeDataModel.dart';
import 'package:http/http.dart' as http;
import '../Models/EmployeeAddModel.dart';
import '../Models/ProductInsertModel.dart';

class EmployeeAddAPI {
  EmployeeAddAPI();

  Future<EmployeeAddModel> employeeAdd(emailid,e_emailid,ename,dob,joiningdate,designation,edu,mobilenum,address,password,photo) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://www.careforeach.com/new/company/company_api_jay/webservices/employee_add.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'emailid':emailid,
          'e_emailid':e_emailid,
          'ename':ename,
          'dob':dob,
          'joiningdate':joiningdate,
          'designation':designation,
          'edu':edu,
          'mobilenum':mobilenum,
          'address':address,
          'password':password,
          'photo':photo
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Employee add" + response.body);

    return EmployeeAddModel.fromJson(data);
  }
}