// import 'dart:html';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/userInfo.dart';

class UserPreference {
  SharedPreferences preferences;

  UserPreference() {
    init();
  }

  void init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<Map<String, String>> getUserInfo() async {
    preferences = await SharedPreferences.getInstance();

    String email, firstName, lastName, gender, state;
    try {
      email = preferences.getString("email");
      firstName = preferences.getString("firstName");
      lastName = preferences.getString("lastName");
      gender = preferences.getString("gender");
      state = preferences.getString("state");
    } catch (e) {
      return {
        "email": null,
        "firstName": null,
        "lastName": null,
        "gender": null,
        "state": null,
      };
    }
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "state": state,
    };
  }

  Future<Map<String, dynamic>> getToken() async {
    preferences = await SharedPreferences.getInstance();
    String token;
    try {
      token = preferences.getString("AuthBToken");
    } catch (e) {
      return {
        "token": null,
      };
    }
    return {
      "token": token,
    };
  }

  Future<Map<String, dynamic>> getLoginInfo() async {
    preferences = await SharedPreferences.getInstance();

    String email, password;
    try {
      email = preferences.getString("email");
      password = preferences.getString("secretKeyP");
    } catch (e) {
      return {
        "email": null,
        "password": null,
      };
    }
    return {
      "email": email,
      "password": password,
    };
  }

  Future<bool> setUserInfo(User user) async {
    preferences = await SharedPreferences.getInstance();

    try {

      if (user.email != null || user.email != "")
        preferences.setString("email", user.email);
      if (user.password != null || user.password != "")
        preferences.setString("secretKeyP", user.password);
      if (user.firstName != null || user.firstName != "")
        preferences.setString("firstName", user.firstName);
      if (user.firstName != null || user.firstName != "")
        preferences.setString("firstName", user.firstName);
      if (user.lastName != null || user.lastName != "")
        preferences.setString("lastName", user.lastName);
      if (user.gender != null || user.gender != "")
        preferences.setString("gender", user.gender);
      if (user.state != null || user.state != "")
        preferences.setString("state", user.state);
      if (user.token != null || user.token != "")
        preferences.setString("AuthBToken", user.token);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> setToken(User user) async {
    preferences = await SharedPreferences.getInstance();

    try {
      preferences.setString("AuthBToken", user.token);
    } catch (e) {
      return false;
    }
    return true;
  }
  Future<bool> setSignUpInfo(User user) async {
    var ls= {"email": user.email, "password": user.password, "token": user.token};
    print(ls);
    try {
      //email: user['data']['user']['email'],
      //       password: password,
      //       firstName: user['data']['user']['first_name'],
      //       lastName: user['data']['user']['last_name'],
      //       gender: user['data']['user']['gender'],
      //       state: user['data']['user']['state'],
      //       token: user['token'],
      // if (preferences.containsKey("verification")){
      //
      // }else{
      //   preferences.setString("verification", "False");
      // }

      if(preferences.containsKey("email")){
        preferences.remove("email");
      }
      if(preferences.containsKey("secretKeyP")){
        preferences.remove("secretKeyP");
      }
      if(preferences.containsKey("firstName")){
        preferences.remove("firstName");
      }
      if(preferences.containsKey("lastName")){
        preferences.remove("lastName");
      }
      if(preferences.containsKey("AuthBToken")){
        preferences.remove("AuthBToken");
      }
      if(preferences.containsKey("isVerification")){
        preferences.remove("isVerification");
      }
      preferences.setString("email", user.email);
      preferences.setString("secretKeyP", user.password);
      preferences.setString("firstName", user.firstName);
      preferences.setString("lastName", user.lastName);
      preferences.setString("AuthBToken", user.token);
      preferences.setBool('isVerification', user.isVerified);

    } catch (e) {
      print("set login info false");
      return false;
    }
    print("set login info true");
    return true;
  }
  Future<bool> setLoginInfo(User user) async {
    preferences = await SharedPreferences.getInstance();

    var ls= {"email": user.email, "password": user.password, "token": user.token};
    print(ls);
    try {
      //email: user['data']['user']['email'],
      //       password: password,
      //       firstName: user['data']['user']['first_name'],
      //       lastName: user['data']['user']['last_name'],
      //       gender: user['data']['user']['gender'],
      //       state: user['data']['user']['state'],
      //       token: user['token'],
      // if (preferences.containsKey("verification")){
      //
      // }else{
      //   preferences.setString("verification", "False");
      // }

      if(preferences.containsKey("email")){
        preferences.remove("email");
      }
      if(preferences.containsKey("secretKeyP")){
        preferences.remove("secretKeyP");
      }
      if(preferences.containsKey("firstName")){
        preferences.remove("firstName");
      }
      if(preferences.containsKey("lastName")){
        preferences.remove("lastName");
      }
      if(preferences.containsKey("AuthBToken")){
        preferences.remove("AuthBToken");
      }
      if(preferences.containsKey("isVerification")){
        preferences.remove("isVerification");
      }
      preferences.setString("email", user.email);
      preferences.setString("secretKeyP", user.password);
      preferences.setString("firstName", user.firstName);
      preferences.setString("lastName", user.lastName);
      preferences.setString("AuthBToken", user.token);
      preferences.setBool('isVerification', user.isVerified);

    } catch (e) {
      print("set login info false");
      return false;
    }
    print("set login info true");
    return true;
  }
  Future<bool> deleteUserInfo() async{
    preferences = await SharedPreferences.getInstance();
    try {
      if (preferences.containsKey("email"))preferences.remove("email");
      if (preferences.containsKey("secretKeyP"))preferences.remove("secretKeyP");
      if (preferences.containsKey("firstName")) preferences.remove("firstName");
      if (preferences.containsKey("lastName")) preferences.remove("lastName");
      if (preferences.containsKey("gender")) preferences.remove("gender");
      if (preferences.containsKey("state")) preferences.remove("state");
      if (preferences.containsKey("AuthBToken")) preferences.remove("AuthBToken");
      if (preferences.containsKey("isVerification")) preferences.remove("isVerification");
    } catch (e) {
      return false;
    }
    return true;
  }
}
