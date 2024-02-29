import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? won;
  final Function() onRestart;

  const ResultWidget({
    required this.won,
    required this.onRestart,
    super.key,
  });

  Color _getColor() {
    switch (won) {
      case null:
        return Colors.yellow;
      case true:
        return Colors.green[300]!;
      default:
        return Colors.red[300]!;
    }
  }

  IconData _getIcon() {
    switch (won) {
      case null:
        return Icons.sentiment_satisfied;
      case true:
        return Icons.sentiment_very_satisfied;
      default:
        return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: _getColor(),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: onRestart,
            icon: Icon(
              _getIcon(),
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
