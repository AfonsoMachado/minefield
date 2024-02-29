import 'package:flutter/material.dart';
import 'package:minefield/components/field_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/explosion_exception.dart';
import 'package:minefield/models/field.dart';

class MinefieldApp extends StatelessWidget {
  const MinefieldApp({super.key});

  void _restart() {
    print('Reiniciar...');
  }

  void _open(Field field) {
    print('Abrir');
  }

  void _onToggleMark(Field field) {
    print('Alternar marcação');
  }

  @override
  Widget build(BuildContext context) {
    Field field = Field(row: 0, column: 0);
    try {
      field.putMine();
      field.open();
    } on ExplosionException {}

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultWidget(
          won: null,
          onRestart: _restart,
        ),
        body: Container(
          child: FieldWidget(
            field: field,
            onOpen: _open,
            onToggleMark: _onToggleMark,
          ),
        ),
      ),
    );
  }
}
