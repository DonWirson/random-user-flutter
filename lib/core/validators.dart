///Clase que contiene validators de formulario
class Validators {
  ///Validaciones de campo nombre de formulario
  static String? nameValidator(String? value) {
    if (value != null && value.isEmpty) return "No puede quedar vacio";
    if (value!.trim().isEmpty) return "No puede tener solo espacios en blanco";
    return null;
  }

  ///Validaciones de campo email de formulario
  static String? emailValidator(String? value) {
    //Patron regex usado para validar formato de email, es más facil utilizar el package de validate_email, pero bueno.
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value != null && value.isEmpty) return "No puede quedar vacio";
    if (value!.trim().isEmpty) return "No puede tener solo espacios en blanco";
    if (!regex.hasMatch(value)) return "Formato de correo no valido ";
    return null;
  }

  ///Validaciones de campo fecha de nacimiento
  static String? birthDateValidator(String? value) {
    if (value != null && value.isEmpty) return "No puede quedar vacio";
    return null;
  }

  ///Validaciones de campo contraseña de formulario
  static String? passwordValidator(String? value) {
    if (value != null && value.isEmpty) return "No puede quedar vacio";
    if (value!.trim().length < 6) {
      return "Contraseña no puede ser menor a 6 caracteres";
    }
    return null;
  }
}
