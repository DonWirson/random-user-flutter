import 'result.dart';

//Modelo de datos creado para ser utilizado en App
class User {
  String nombre;
  String correo;
  DateTime fechaNacimiento;
  User({
    required this.nombre,
    required this.correo,
    required this.fechaNacimiento,
  });

  //Usado para convertir respuesta de la api a Usuario.
  //Usado en bloc
  static User usuarioMapper(Result resultado) {
    return User(
      nombre: "${resultado.name.first} ${resultado.name.last}",
      correo: resultado.email,
      fechaNacimiento: resultado.dob.date,
    );
  }
}
