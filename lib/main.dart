import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app_theme.dart';
import 'blocs/random_user_bloc.dart';
import 'core/observer/app_bloc_observer.dart';
import 'pages/landing_page.dart';

void main() {
  sqfliteFfiInit(); //Necesario para base sqlite
  Bloc.observer = AppBlocObserver(); //Logger para eventos de bloc
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random User',
      theme: AppTheme.theme,
      home: BlocProvider(
        create: (context) => RandomUserBloc(),
        child: const LandingPage(),
      ),
    );
  }
}
