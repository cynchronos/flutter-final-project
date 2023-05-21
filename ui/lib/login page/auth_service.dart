import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AuthService {
  Future<Object> databaseLogin(String username, String password) async {
    // connect to api and post data
    final response = await http.post(
      Uri.parse('http://192.168.162.87:3000/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }
}
