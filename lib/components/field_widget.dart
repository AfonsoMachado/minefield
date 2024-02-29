import 'package:flutter/material.dart';
import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onToggleMark;

  const FieldWidget({
    super.key,
    required this.field,
    required this.onOpen,
    required this.onToggleMark,
  });

  Widget _getImage() {
    int minesQuantity = field.minesQuantityInTheNeighborhood;

    switch (field.isOpened) {
      case true:
        if (field.hasMine && field.isExploded) {
          return Image.asset('assets/images/bomba_0.jpeg');
        } else if (field.hasMine) {
          return Image.asset('assets/images/bomba_1.jpeg');
        } else {
          return Image.asset('assets/images/aberto_$minesQuantity.jpeg');
        }
      case false:
        if (field.isMarked) {
          return Image.asset('assets/images/bandeira.jpeg');
        } else {
          return Image.asset('assets/images/fechado.jpeg');
        }
      default:
        return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onToggleMark(field),
      child: _getImage(),
    );
  }
}
