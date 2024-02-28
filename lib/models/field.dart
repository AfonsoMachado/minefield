import 'package:minefield/models/explosion_exception.dart';

class Field {
  final int row;
  final int column;
  final List<Field> neighbors = [];

  bool _isOpened = false;
  bool _isMarked = false;
  bool _hasMine = false;
  bool _isExploded = false;

  Field({
    required this.row,
    required this.column,
  });

  void addNeighbor(Field neighbor) {
    final deltaRow = (row - neighbor.row).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaRow == 0 && deltaColumn == 0) return;

    if (deltaRow <= 1 && deltaColumn <= 1) neighbors.add(neighbor);
  }

  void open() {
    if (_isOpened) return;

    _isOpened = true;

    if (_hasMine) {
      _isExploded = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      for (var neighbor in neighbors) {
        neighbor.open();
      }
    }
  }

  void revealMine() {
    if (_hasMine) _isOpened = true;
  }

  void putMine() {
    _hasMine = true;
  }

  void toggleMark() {
    _isMarked = !_isMarked;
  }

  void restart() {
    _isOpened = false;
    _isMarked = false;
    _hasMine = false;
    _isExploded = false;
  }

  bool get solved {
    bool hasMineAndIsMarked = _hasMine && _isMarked;
    bool safeAndIsOpened = !_hasMine && _isOpened;
    return hasMineAndIsMarked || safeAndIsOpened;
  }

  // Nenhum dos vizinhos tem mina
  bool get safeNeighborhood {
    return neighbors.every((neighbor) => !neighbor._hasMine);
  }

  int get minesQuantityInTheNeighborhood {
    return neighbors.where((neighbor) => neighbor._hasMine).length;
  }

  bool get hasMine {
    return _hasMine;
  }

  bool get isExploded {
    return _isExploded;
  }

  bool get isOpened {
    return _isOpened;
  }

  bool get isMarked {
    return _isMarked;
  }
}
