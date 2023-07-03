import 'dart:convert';
import 'package:care_for_each/Models/EmployeeSide/AddWishlistModel.dart';
import 'package:http/http.dart' as http;


class AddWishlistAPI {
  AddWishlistAPI();

  Future<AddWishlistModel> wishlist(e_emailid,custname,cmobile,caddress,expecteddate,custemailid,ccn,description) async {
    // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    // var token = prefs.getString("userToken");

    var url =  "http://careforeach.com/new/employee/webservices/add_wishlist.php";
    http.Response response = await http.post(
        Uri.parse(url),
        // headers: {
        //   // "Authorization": token,
        // },
        body:{
          'e_emailid':e_emailid,
          'custname':custname,
          'cmobile':cmobile,
          'caddress':caddress,
          'expecteddate':expecteddate,
          'custemailid':custemailid,
          'ccn':ccn,
          'description':description
        }
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    print("Wishlist : " + response.body);

    return AddWishlistModel.fromJson(data);
  }
}