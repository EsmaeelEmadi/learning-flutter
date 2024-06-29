import 'package:home/models/user/gender.dart';

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? username;
  Gender? gender;

  User(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.username,
      this.gender});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    gender = parseGender(json['gender']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['username'] = username;
    data['gender'] = gender;
    return data;
  }
}