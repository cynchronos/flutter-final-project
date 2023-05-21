import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class FetchService {
  Future<Object> fetchDestination() async {
    final destination = await http.get(Uri.parse('http://192.168.162.87:3000/destination'));

    
    return jsonDecode(destination.body);
  }
}
