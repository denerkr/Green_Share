import 'package:GreenShare/models/login.dart';
import 'package:GreenShare/screens/login/telalogin.dart';
import 'package:GreenShare/screens/menu/appmenu.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {

  final List<Login> _login = List();

  @override
  State<StatefulWidget> createState() {
    return TelaLoginState();
  }
}

class TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text('email'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text('senha'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.login), onPressed: () {
        final Future<Login> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Menu();
        }));
        future.then((transferenciaRecebida) {
          Future.delayed(Duration(seconds: 5), (){
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() {
                widget._login.add(transferenciaRecebida);
              });
            }
          });
        });
      },
      ),
    );
  }
}

class ItemLogin extends StatelessWidget {
  final Login _login;

  ItemLogin(this._login);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_login.senha.toString()),
        subtitle: Text(_login.login.toString()),
      ),
    );
  }
}
