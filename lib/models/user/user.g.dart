// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['name'] as String,
      json['password'] as String?,
      json['email'] as String,
      json['gender'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'email': instance.email,
      'gender': instance.gender,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
    };
