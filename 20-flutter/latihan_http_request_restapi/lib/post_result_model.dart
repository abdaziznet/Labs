import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;

  PostResult({
    this.id,
    this.name,
    this.job,
    this.created,
  });

  factory PostResult.fromJson(Map<String, dynamic> json) {
    return PostResult(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      created: json['createdAt'],
    );
  }

  static Future<PostResult> connectToAPI(
      String url, String name, String job) async {
    http.Response response =
        await http.post(url, body: {"name": name, "job": job});
    final jsonResponse = json.decode(response.body);
    return PostResult.fromJson(jsonResponse);
  }
}
