import 'package:flutter/material.dart';
import 'package:random_user/core/constants.dart';

class SavedUserTable extends StatefulWidget {
  const SavedUserTable({super.key});

  @override
  State<SavedUserTable> createState() => _SavedUserTableState();
}

class _SavedUserTableState extends State<SavedUserTable> {
  int rowsPerPage = 4;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              color: Color(
                Constants.blueColor,
              ),
            ),
            children: [
              Text(
                "Nombre",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                "Correo",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                "Fecha Nacimiento",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ]),
        const TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
              ),
            children: [
              Text(
                "atata1",
                textAlign: TextAlign.center,
              ),
              Text(
                "atata2",
                textAlign: TextAlign.center,
              ),
              Text(
                "atata3",
                textAlign: TextAlign.center,
              ),
            ]),
        TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            children: const [
              Text("atata1"),
              Text("atata2"),
              Text("atata3"),
            ]),
      ],
    );
  }
}
