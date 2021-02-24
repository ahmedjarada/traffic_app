import 'dart:core';

class User {
  String email;
  String firstName;
  String lastName;
  String gender;
  String password;
  String token;
  String state;
  bool isVerified;

  User(
      {this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.password,
      this.token,
      this.state,
      this.isVerified});

  toJson(User user) {
    return {
      "email": user.email,
      "password": user.password,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "gender": user.gender,
      "state": user.state,
      "token": user.token,
      "isVerified": user.isVerified,
    };
  }

  formJson(Map<String, dynamic> user, String password) {
    var ls= {"email": user['data']['user']['email'],
      "password": password,
      "firstName": user['data']['user']['first_name'],
      "lastName": user['data']['user']['last_name'],
      "gender": user['data']['user']['gender'],
      "state": user['data']['user']['state'],
      "token": user['data']['token'],
      "isVerified": user['data']['user']['is_verified'],
    };
    // print(ls);
    return User(
      email: user['data']['user']['email'],
      password: password,
      firstName: user['data']['user']['first_name'],
      lastName: user['data']['user']['last_name'],
      gender: user['data']['user']['gender'],
      state: user['data']['user']['state'],
      token: user['data']['token'],
      isVerified: user['data']['user']['is_verified'],
    );
  }
}

