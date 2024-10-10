// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user/blocs/random_user_bloc.dart';

import '../../model/user.dart';

class SavedUsersTable extends StatefulWidget {
  const SavedUsersTable({super.key});

  @override
  State<SavedUsersTable> createState() => _SavedUsersTableState();
}

class _SavedUsersTableState extends State<SavedUsersTable> {
  List<User> usuarios = [];

  @override
  void initState() {
    super.initState();
    loadLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RandomUserBloc, RandomUserState>(
      listener: (context, state) {
        if (state is GotLocalUsersSuccessfull) {
          usuarios = state.users;
          setState(() {});
        }
        if(state is GotLocalUsersUserFailure){
          
        }
      },
      child: PaginatedDataTable(
        rowsPerPage: 4,
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Nombre'),
          ),
          DataColumn(
            label: Text('Correo'),
          ),
          DataColumn(
            label: Text('Fecha Nacimiento'),
          ),
        ],
        source: DataSource(
          usuarios: usuarios,
        ), //Fuente de data para poblar tabla.
      ),
    );
  }

  void loadLocalData() async {
    BlocProvider.of<RandomUserBloc>(context).add(
      GotLocalUsers(),
    );
  }
}

class DataSource extends DataTableSource {
  //Recibe lista de usuarios en tabla.
  final List<User> usuarios;

  DataSource({
    required this.usuarios,
  });

  @override
  DataRow? getRow(int index) {
    final user = usuarios[index];
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Text(user.nombre),
        ),
        DataCell(
          Text(user.correo),
        ),
        DataCell(
          Text(
            user.fechaNacimiento.toString(),
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => usuarios.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
