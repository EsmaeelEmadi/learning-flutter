import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

// @JsonSerializable()
// class Gender {
//   static const String male = 'MALE';
//   static const String female = 'FEMALE';
//
//   factory Gender.fromJson(json) => _$GenderFromJson(json);
//
//   Map<String, dynamic> toJson() => _$GenderToJson(this);
// }

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String? password;
  final String email;
  final String gender;
  final String firstName;
  final String lastName;
  final String username;

  User(this.id, this.name, this.password, this.email, this.gender,
      this.firstName, this.lastName, this.username);

  String get initials {
    final parts = name.split(" ");
    if (parts.length >= 2) {
      return "${parts.first[0]}${parts.last[0]}";
    }

    return parts.single[0];
  }

  factory User.fromJson(json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
