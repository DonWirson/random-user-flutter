import 'package:json_annotation/json_annotation.dart';

import 'dob.dart';
import 'login.dart';
import 'name.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  String gender;
  Name name;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  String nat;

  Result({
    required this.gender,
    required this.name,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.nat,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}
