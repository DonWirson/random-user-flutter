// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'info.dart';
import 'result.dart';

part 'data.g.dart';

Data welcomeFromJson(String str) => Data.fromJson(json.decode(str));

String welcomeToJson(Data data) => json.encode(data.toJson());

@JsonSerializable()
class Data {
  List<Result> results;
  Info info;

  Data({
    required this.results,
    required this.info,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
      };
}
