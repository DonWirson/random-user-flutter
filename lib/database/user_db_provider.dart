import 'package:sqflite/sqflite.dart';

import '../core/constants.dart';
import '../model/user.dart';

//Variables de base de datos
const String tableUser = 'User';
const String columnId = 'id';
const String columnNombre = ' nombre';
const String columnCorreo = ' correo';
const String columnFechaNacimiento = ' fechaNacimiento';

class UserDbProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(Constants.databasePath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableUser  ( 
  $columnId integer primary key autoincrement, 
  $columnNombre text not null,
  $columnCorreo text not null,
  $columnFechaNacimiento text not null)
  ''');
    });
  }

  Future<User> insert(User user) async {
    await open();

    await db.insert(
      tableUser,
      user.toMap(),
    );
    return user;
  }

  Future<List<User>> getUsers() async {
    await open();

    List<User> users = [];
    List<Map> UsersMap = await db.query(
      tableUser,
      columns: [
        columnId,
        columnId,
        columnNombre,
        columnCorreo,
        columnFechaNacimiento,
      ],
    );
    //En caso de encontrar data en la base sqlite, la devuelve
    if (UsersMap.isNotEmpty) {
      for (var element in UsersMap) {
        users.add(User.fromMap(element as Map<String, dynamic>));
      }
    }
    return users; //Retorna lista vacia o lista de User.
  }

  Future close() async => db.close();
}
