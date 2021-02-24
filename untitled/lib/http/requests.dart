import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/userInfo.dart';
import 'package:untitled/SharedPreference/Preference.dart';
class Request {
  var baseUrl = 'http://85.184.241.67:8181';
  String token;
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Connection': 'keep-alive',
    'Accept-Encoding': 'gzip, deflate, br',
  };
  signUp(Map<String, dynamic> registeringInfo) async {
    final url= "$baseUrl/account/signup/";
    var response = await http.post(url, body: convert.jsonEncode(registeringInfo), headers: requestHeaders);
    var data= convert.jsonDecode(response.body);
    if(response.statusCode == 200){
      var userPrefs= UserPreference();
      User user = new User().formJson(data, registeringInfo["password"]);
      userPrefs.setLoginInfo(user);
      return {"status": true, "data": data["data"]["user"], "msg": data["msg"]};
    }
    else if(response.statusCode == 403) {
      print({"status": false, "errors": data["errors"], "msg": data["msg"]});
      return {"status": false, "errors": data["errors"], "msg": data["msg"]};
    }
    else return null;

  }
  login(Map<String, dynamic> loginInfo) async {
    final url= "$baseUrl/account/login/";
    var response = await http.post(url, body: convert.jsonEncode(loginInfo), headers: requestHeaders);
    var data= convert.jsonDecode(response.body);
    if(response.statusCode == 200){
      var userPrefs= UserPreference();
      User user = new User().formJson(data, loginInfo["password"]);
      userPrefs.deleteUserInfo();
      userPrefs.setLoginInfo(user);
      return {"status": true, "data": data["data"]["user"], "msg": data["msg"]};
    }
    else if(response.statusCode == 403) {
      print({"status": false, "errors": data["errors"], "msg": data["msg"]});
      return {"status": false, "errors": data["errors"], "msg": data["msg"]};
    }
    else return null;

  }

  logout() async {
    final url= "$baseUrl/account/logout/";
    var userPrefs= UserPreference();
    var getToken= await userPrefs.getToken();
    var bToken = getToken["token"];
    requestHeaders['Authorization'] = "Token $bToken";
    var response = await http.post(url, headers: requestHeaders);
    var data= convert.jsonDecode(response.body);

    if(response.statusCode == 200) {
      userPrefs.deleteUserInfo();
      return {"status": true, "msg": data["msg"]};
    }
    else if(response.statusCode ==401){
      userPrefs.deleteUserInfo();
      return {"status": false, "msg": data["detail"]};
    }
    else return null;

  }
  reset(Map<String, dynamic> resetInfo) async {
    final url= "$baseUrl/account/reset/request/";
    var response = await http.post(url,body: convert.jsonEncode(resetInfo), headers: requestHeaders);
    if(response.statusCode == 200) return convert.jsonDecode(response.body);
    else return null;

  }
  resetCode(String pin) async {
    final url= "$baseUrl/account/reset/check/";
    var response = await http.post(url,body: convert.jsonEncode({"pin": pin}), headers: requestHeaders);
    final data = convert.jsonDecode(response.body);
    if(response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("pinReset", pin);

      return {"status": true, "msg": data["msg"]};

    }
    if(response.statusCode == 403) {
      return {"status": false, "msg": data["msg"]};
    }

    else return null;

  }
  resetPassword(String password) async {
    final url= "$baseUrl/account/reset/confirm/";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final pin = preferences.getString("pinReset");
    var response = await http.post(url,body: convert.jsonEncode({"pin": pin, "password": password, "confirm_password": password}), headers: requestHeaders);
    final data = convert.jsonDecode(response.body);
    if(response.statusCode == 200) {
      preferences.remove("pinReset");
      return {"status": true, "msg": data["msg"]};

    }
    if(response.statusCode == 403) {
      return {"status": false, "msg": data["msg"]};
    }

    else return null;

  }


  me() async {
    final url= "$baseUrl/account/reset/";
    requestHeaders['token'] = token;
    var response = await http.get(url, headers: requestHeaders);

    if(response.statusCode == 200) {

    }
    else if(response.statusCode ==401){

    }
    else return null;

  }
  requestVerificationCode() async{
    final url = "$baseUrl/account/verify/request/";
    var userPrefs= UserPreference();
    var getToken= await userPrefs.getToken();
    var bToken = getToken["token"];
    requestHeaders['Authorization'] = "Token $bToken";
    var response = await http.post(url, headers: requestHeaders);
    var data= convert.jsonDecode(response.body);

    if(response.statusCode == 200) {
      // SharedPreferences preferences= await SharedPreferences.getInstance();
      // preferences.setString("verification", "True");
      return {"status":data["status"] , "msg": data["msg"]};
    }
    else if(response.statusCode ==401){
      return {"status": false, "msg": data["detail"]};
    }
    else if(response.statusCode ==403){
      return {"status": data["status"], "msg": data["msg"]};
    }
    else return null;
  }
  verify(String pin) async{
    final url = "$baseUrl/account/verify/confirm/";
    var userPrefs= UserPreference();
    var getToken= await userPrefs.getToken();
    var bToken = getToken["token"];
    requestHeaders['Authorization'] = "Token $bToken";
    var response = await http.post(url, headers: requestHeaders, body:convert.jsonEncode({"pin": pin}));
    var data= convert.jsonDecode(response.body);

    if(response.statusCode == 200) {
      SharedPreferences preferences= await SharedPreferences.getInstance();
      preferences.setString("verification", "True");
      return {"status": true, "msg": data["msg"]};
    }
    else if(response.statusCode ==401){
      return {"status": false, "msg": data["detail"]};
    }
    else return null;
  }


  // placeAPI(input) async{
  //     final API_KEY= "AIzaSyAk2bYULYrBxz9fXQi3VAzJoYeveaK-tiM";
  //     var response = await http.get('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=(cities)&language=ar&key=$API_KEY');
  //     var data= convert.jsonDecode(response.body);
  //     print(data);
  //
  // }


}
