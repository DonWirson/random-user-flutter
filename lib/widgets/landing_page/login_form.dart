import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../core/utils/date_formatters.dart';

import '../../blocs/random_user_bloc.dart';
import '../../core/utils/snackbar.dart';
import '../../core/validators.dart';
import '../../model/user.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscurePasswordText = true; //Controlla

  //Almacenan valores y estado de formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Estados de bloc emitidos
    return BlocListener<RandomUserBloc, RandomUserState>(
      listener: (context, state) {
        //Estados de inserción de usuario
        //acá podría ir un spinner de carga :D
        if (state is InsertedNewUserInProgress) {}
        if (state is InsertedNewUserSuccessfull) {
          //En caso de insertar un usuario de forma exitosa, llama a evento que busca usuarios de forma local.
          //:D
          BlocProvider.of<RandomUserBloc>(context).add(
            GotLocalUsers(),
          );
        }
        if (state is InsertedNewUserUserFailure) {
          showSnackbar(
            context,
            "Error registrando nuevo usuario",
          );
        }

        //Estados de llamada a la api para buscar usuario random.
        if (state is GotRandomUserSuccessfull) {
          final user = state.randomUser;
          nameController.text = user.nombre;
          emailController.text = user.correo;
          birthDateController.text = user.fechaNacimiento.toString();

          showSnackbar(
            context,
            "Usuario encontrado exitosamente :D",
          );
          setState(() {});
        }
        if (state is GotRandomUserFailure) {
          showSnackbar(
            context,
            "Error al buscar usuario aleatorio",
            color: Colors.red,
          );
        }
        if (state is GotRandomUserInProgress) {
          showSnackbar(
            context,
            "Buscando usuario aleatorio....",
            color: Colors.grey,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              validator: Validators.nameValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Nombre Completo",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: emailController,
              validator: Validators.emailValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: "Correo Electrónico",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: birthDateController,
              readOnly: true,
              validator: Validators.birthDateValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: "Fecha Nacimiento",
                prefixIcon: Icon(
                  Icons.calendar_month,
                ),
              ),
              onTap: () {
                showCalendar();
              },
            ),
            // TextFormField(
            //   controller: birthDateController,
            //   validator: Validators.birthDateValidator,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   decoration: const InputDecoration(
            //   ),
            // ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: passwordController,
              validator: Validators.passwordValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscurePasswordText,
              decoration: InputDecoration(
                hintText: "Contraseña",
                suffixIcon: IconButton(
                  icon: Icon(obscurePasswordText
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        obscurePasswordText = !obscurePasswordText;
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: () => registerNewUser(),
              child: const Text(
                "Registrar",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: () => getRandomUser(),
              child: const Text(
                "Obtener Desde API",
              ),
            ),
          ],
        ),
      ),
    );
  }

  //TODO: Editar locale, para mostrar calendario en español.
  Future<void> showCalendar() async {
    final dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (dateSelected != null) {
      birthDateController.text = DateFormatters.DDMMyyyFormat(dateSelected);
    }
  }

  //Dispara evento de bloc para insertar usuario nuevo a sqlite
  void registerNewUser() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<RandomUserBloc>(context).add(
        InsertedNewUser(
          user: User(
            nombre: nameController.text,
            correo: emailController.text,
            fechaNacimiento: birthDateController.text,
          ),
        ),
      );
    }
  }

  //Dispara evento de bloc para mandar a buscar a usuario random a api.
  void getRandomUser() {
    BlocProvider.of<RandomUserBloc>(context).add(
      GotRandomUser(),
    );
  }
}
