import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/board.dart';

main() {
  test('Win game', () {
    Board board = Board(rows: 2, columns: 2, minesQuantity: 0);
    board.fields[0].putMine();
    board.fields[3].putMine();

    board.fields[0].toggleMark();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].toggleMark();

    expect(board.solved, isTrue);
  });
}
