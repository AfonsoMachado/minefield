import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/field.dart';

main() {
  group('field', () {
    test('Open field with explosion', () {
      Field field = Field(row: 0, column: 0);
      field.putMine();

      expect(field.open, throwsException);
    });
    test('Open field without explosion', () {
      Field field = Field(row: 0, column: 0);
      field.open();

      expect(field.isOpened, isTrue);
    });

    test('Add no neighbor', () {
      Field field1 = Field(row: 0, column: 0);
      Field field2 = Field(row: 1, column: 3);
      field1.addNeighbor(field2);

      expect(field1.neighbors.isEmpty, isTrue);
    });

    test('Add neighbor', () {
      Field field1 = Field(row: 3, column: 3);
      Field field2 = Field(row: 3, column: 4);
      Field field3 = Field(row: 2, column: 2);
      Field field4 = Field(row: 4, column: 4);

      field1.addNeighbor(field2);
      field1.addNeighbor(field3);
      field1.addNeighbor(field4);

      expect(field1.neighbors.length, 3);
    });

    test('Mines in the neighborhood', () {
      Field field1 = Field(row: 3, column: 3);
      Field field2 = Field(row: 3, column: 4);
      field2.putMine();
      Field field3 = Field(row: 2, column: 2);
      Field field4 = Field(row: 4, column: 4);
      field4.putMine();

      field1.addNeighbor(field2);
      field1.addNeighbor(field3);
      field1.addNeighbor(field4);

      expect(field1.minesQuantityInTheNeighborhood, 2);
    });
  });
}
