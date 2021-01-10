import 'package:flutter/material.dart';
import 'package:flutter_exemplo/components/blue_button.dart';
import 'package:flutter_exemplo/pages/drawer_list.dart';
import 'package:flutter_exemplo/pages/hello_listview.dart';
import 'package:flutter_exemplo/utils/nav.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'hello_page2.dart';
import 'hello_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hello Flutter'),
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1"),
            Tab(text: "TAB 2"),
            Tab(text: "TAB 3"),
          ]),
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          )
        ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _onClickFab(),
              child: Icon(Icons.add),
            ),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab() {
    print("Adicionar");
  }

  _body(context) {
    return Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        ));
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img('assets/images/dog1.png'),
          _img('assets/images/dog2.png'),
          _img('assets/images/dog3.png'),
          _img('assets/images/dog4.png'),
          _img('assets/images/dog5.png'),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                Widget>[
              BlueButton('ListView',
                  onPressed: () => _onClickNavigator(context, HelloListView())),
              BlueButton('Page 2',
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton('Page 3',
                  onPressed: () => _onClickNavigator(context, HelloPage3())),
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BlueButton('Snack', onPressed: () => _onClickSnack(context)),
                  BlueButton('Dialog',
                      onPressed: () => _onClickDialog(context)),
                  BlueButton('Toast', onPressed: () => _onClickToast()),
                ])
          ],
        );
      },
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Olá Flutter'),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter é muito legal!"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  print("OK!!!");
                },
                child: Text("OK"),
              )
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickNavigator(context, Widget page) async {
    String s = await push(context, page);

    print('$s');
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
    //  'https://tudosobrecachorros.com.br/wp-content/uploads/2013/02/pastor_alemao_2.jpg');
    // 'https://statig0.akamaized.net/bancodeimagens/bm/s7/6b/bms76blg2zaea6p7625cszwjp.jpg');
  }

  _text() {
    return Text(
      'Hello World',
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }
}
