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
  }
}
