// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dob _$DobFromJson(Map<String, dynamic> json) => Dob(
      date: DateTime.parse(json['date'] as String),
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$DobToJson(Dob instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'age': instance.age,
    };
