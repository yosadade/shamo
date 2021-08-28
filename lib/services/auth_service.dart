import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  // buat function
  Future<UserModel> register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    var url = Uri.tryParse('$baseUrl/register');
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(url!, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      data['user']['token'] = 'Bearer ' + data['access_token'];
      UserModel user = UserModel.fromJson(data['user']);
      return user;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    var url = Uri.tryParse('$baseUrl/login');
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(url!, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      data['user']['token'] = 'Bearer ' + data['access_token'];
      UserModel user = UserModel.fromJson(data['user']);
      return user;
    } else {
      throw Exception('Gagal login');
    }
  }
}
