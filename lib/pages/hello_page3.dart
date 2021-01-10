import 'package:flutter/material.dart';
import 'package:flutter_exemplo/components/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello Page3')),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        'Voltar',
        onPressed: () => _onClickVoltar(context),
      ),
    );
  }

  void _onClickVoltar(context) {
    Navigator.pop(context, "Tela3");
  }
}
