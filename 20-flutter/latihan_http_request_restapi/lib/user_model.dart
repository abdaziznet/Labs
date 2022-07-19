import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  static Future<User> getUser(String url, String id) async {
    final response = await http.get(url + id);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var userData = jsonResponse['data'];
      return User.fromJson(json.decode(userData));
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<List<User>> getUsers(String url, String page) async {
    final response = await http.get(url + page);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<dynamic> usersData = (jsonResponse as Map<String, dynamic>)['data'];
      List<User> users = [];
      for (var user in usersData) {
        users.add(User.fromJson(json.decode(user)));
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
