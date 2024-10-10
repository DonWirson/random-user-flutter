// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:random_user/core/utils/date_formatters.dart';

import 'result.dart';

//Modelo de datos creado para ser utilizado en App
class User {
  String nombre;
  String correo;
  String fechaNacimiento;
  User({
    required this.nombre,
    required this.correo,
    required this.fechaNacimiento,
  });

  //Usado para convertir respuesta de la api a Usuario.
  //Usado en bloc
  static User usuarioMapper(Result resultado) {
    print("FECHA REAL :${resultado.dob.date}");
    return User(
        nombre: "${resultado.name.first} ${resultado.name.last}",
        correo: resultado.email,
        fechaNacimiento: DateFormatters.DDMMyyyFormat(resultado.dob.date),);
  }

  //Métodos utiles, generados con una extensión

  User copyWith({
    String? nombre,
    String? correo,
    String? fechaNacimiento,
  }) {
    return User(
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nombre': nombre,
      'correo': correo,
      'fechaNacimiento': fechaNacimiento,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nombre: map['nombre'] as String,
      correo: map['correo'] as String,
      fechaNacimiento: map['fechaNacimiento'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(nombre: $nombre, correo: $correo, fechaNacimiento: $fechaNacimiento)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.nombre == nombre &&
        other.correo == correo &&
        other.fechaNacimiento == fechaNacimiento;
  }

  @override
  int get hashCode =>
      nombre.hashCode ^ correo.hashCode ^ fechaNacimiento.hashCode;
}
