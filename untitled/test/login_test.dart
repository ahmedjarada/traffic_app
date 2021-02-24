import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/http/requests.dart';

void main() {
  test('Testing request Http login', () async {
     final response= await Request().login({"email": "ahmedjarada@hotmail.com", "password": "Aj1331997"});

     expect(response["status"], true);
  });
  test('Testing preference with after login', () async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    
    expect(sharedPreferences.containsKey("email"), true);
  });
}
