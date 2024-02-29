import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/field.dart';

class MinefieldApp extends StatefulWidget {
  const MinefieldApp({super.key});

  @override
  State<MinefieldApp> createState() => _MinefieldAppState();
}

class _MinefieldAppState extends State<MinefieldApp> {
  bool? _won;
  final Board _board = Board(rows: 12, columns: 12, minesQuantity: 3);

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
          won: _won,
          onRestart: _restart,
        ),
        body: BoardWidget(
          board: _board,
          onOpen: _open,
          onToggleMark: _onToggleMark,
        ),
      ),
    );
  }
}
