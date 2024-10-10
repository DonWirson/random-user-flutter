import 'package:flutter/material.dart';

import '../database/user_db_provider.dart';
import '../widgets/landing_page/login_form.dart';
import '../widgets/landing_page/saved_user_table.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var obscurePassword = true;

  @override
  void dispose() {
    super.dispose();
    UserDbProvider().close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text(
            "Registro de usuario",
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginForm(),//Vista de formulario
                SizedBox(
                  height: 20,
                ),
                SavedUsersTable(),//Tabla que muestra usuarios
              ],
            ),
          ),
        ),
      ),
    );
  }
}
