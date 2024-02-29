import 'package:flutter/material.dart';
import 'package:minefield/components/result_widget.dart';

class MinefieldApp extends StatelessWidget {
  const MinefieldApp({super.key});

  _restart() {
    print('Reiniciar...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultWidget(
          won: null,
          onRestart: _restart,
        ),
        body: Container(
          child: Text('Tabuleiro'),
        ),
      ),
    );
  }
}
