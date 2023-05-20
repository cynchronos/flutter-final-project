// import 'package:http/http.dart' as http;

class AuthService {
  Future<Object> databaseLogin(String username, String password) async {
    // connect to api and post data

    Map data = {
        'success': true,
        'message': '',
      };

    if (username == 'dev' && password == 'dev') {
      data['success'] = true;

      return data;
    } else {

      data['success'] = false;
      data['message'] = 'Username atau password salah';

      return data;
    }
  }
}
