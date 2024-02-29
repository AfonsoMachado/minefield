import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/explosion_exception.dart';
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
    setState(() {
      _won = null;
      _board.restart();
    });
  }

  void _open(Field field) {
    if (_won != null) return;

    setState(() {
      try {
        field.open();
        if (_board.solved) _won = true;
      } on ExplosionException {
        _won = false;
        _board.revealMines();
      }
    });
  }

  void _onToggleMark(Field field) {
    if (_won != null) return;
    
    setState(() {
      field.toggleMark();
      if (_board.solved) _won = true;
    });
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
