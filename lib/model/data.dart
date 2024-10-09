// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Result> results;

  Data({
    required this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
