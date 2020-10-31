import 'package:GreenShare/models/login.dart';
import 'package:GreenShare/screens/login/telalogin.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Lista de transferencia'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.login), onPressed: () {
        final Future<Login> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ListaTransferencias();
        }));
        },
      ),
    );
  }
}
