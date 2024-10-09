// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      gender: json['gender'] as String,
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String,
      login: Login.fromJson(json['login'] as Map<String, dynamic>),
      dob: Dob.fromJson(json['dob'] as Map<String, dynamic>),
      registered: Dob.fromJson(json['registered'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      cell: json['cell'] as String,
      nat: json['nat'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'email': instance.email,
      'login': instance.login,
      'dob': instance.dob,
      'registered': instance.registered,
      'phone': instance.phone,
      'cell': instance.cell,
      'nat': instance.nat,
    };
