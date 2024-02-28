import 'dart:math';

import 'field.dart';

class Board {
  final int rows;
  final int columns;
  final int minesQuantity;

  final List<Field> _fields = [];

  Board({
    required this.rows,
    required this.columns,
    required this.minesQuantity,
  }) {
    _createFields();
    _relateNeighbors();
    _drawMines();
  }

  void restart() {
    for (var field in _fields) {
      field.restart();
    }
    _drawMines();
  }

  void revealMines() {
    for (var field in _fields) {
      field.revealMine();
    }
  }

  void _createFields() {
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        _fields.add(Field(row: row, column: column));
      }
    }
  }

  void _relateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _drawMines() {
    int drawn = 0;

    if (minesQuantity > rows * columns) return;

    while (drawn < minesQuantity) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].hasMine) {
        drawn++;
        _fields[i].putMine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get solved {
    return _fields.every((field) => field.solved);
  }
}
