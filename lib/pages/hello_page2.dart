import 'package:flutter/material.dart';
import 'package:flutter_exemplo/components/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello Page2')),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        'Voltar',
        onPressed: () => _onClickVoltar(context),
        color: Colors.red,
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela2");
  }
}
