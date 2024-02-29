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
  Board? _board;

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int columnsQuantity = 15;
      double fieldSize = width / columnsQuantity;
      int rowsQuantity = (height / fieldSize).floor();

      _board = Board(
        rows: rowsQuantity,
        columns: columnsQuantity,
        minesQuantity: 50,
      );
    }
    return _board!;
  }

  void _restart() {
    setState(() {
      _won = null;
      _board!.restart();
    });
  }

  void _open(Field field) {
    if (_won != null) return;

    setState(() {
      try {
        field.open();
        if (_board!.solved) _won = true;
      } on ExplosionException {
        _won = false;
        _board!.revealMines();
      }
    });
  }

  void _toggleMark(Field field) {
    if (_won != null) return;

    setState(() {
      field.toggleMark();
      if (_board!.solved) _won = true;
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
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return BoardWidget(
                board: _getBoard(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onOpen: _open,
                onToggleMark: _toggleMark,
              );
            },
          ),
        ),
      ),
    );
  }
}
