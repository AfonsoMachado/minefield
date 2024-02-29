import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/board.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultWidget(
          won: null,
          onRestart: _restart,
        ),
        body: BoardWidget(
          board: Board(rows: 15, columns: 15, minesQuantity: 0),
          onOpen: _open,
          onToggleMark: _onToggleMark,
        ),
      ),
    );
  }
}
