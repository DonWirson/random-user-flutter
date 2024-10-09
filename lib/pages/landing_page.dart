import 'package:flutter/material.dart';
import 'package:random_user/widgets/landing_page/login_form.dart';
import 'package:random_user/widgets/landing_page/saved_user_table.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var obscurePassword = true;

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
                  LoginForm(),
                  SizedBox(
                    height: 20,
                  ),
                  SavedUserTable(),
                ],
              ),
            )),
      ),
    );
  }
}
