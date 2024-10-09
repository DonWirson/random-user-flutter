import 'package:flutter/material.dart';
import '../../core/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscurePasswordText = true; //Controlla

  //Variables that store the form data
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            validator: Validators.birthDateValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              hintText: "Fecha Nacimiento",
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            controller: passwordController,
            validator: Validators.nameValidator,
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
            onPressed: () => registerUser(),
            child: const Text("Registrar"),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton(
            onPressed: () => getRandomUser(),
            child: const Text("Obtener Desde API"),
          ),
        ],
      ),
    );
  }

  void registerUser() {}
  void getRandomUser() {}
}
