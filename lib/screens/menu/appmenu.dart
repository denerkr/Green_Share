import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/transferencia/formulario.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:GreenShare/screens/menu/homepagecharts.dart';
import 'package:GreenShare/screens/login/logincompelto.dart';

import '../../main.dart';

class Menu extends StatefulWidget {
  final int usuario;

  const Menu({Key key, this.usuario}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MenuState(usuario);
  }
}

class MenuState extends State<Menu> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  final int usuario;

  MenuState(this.usuario);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                  child: Text('Alterar valor de compra e venda'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTransferencia(usuario: usuario,)
                    ));
                  }),
              RaisedButton(
                  child: Text('Modo Manual'),
                  onPressed: () => modoManual(usuario)
              ),
              RaisedButton(
                  child: Text('Modo Automatico'),
                  onPressed: () => modoAuto(usuario),
              ),
              RaisedButton(
                  child: Text('Graficos'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(usuario: usuario,)
                    ));
                  }),
            ],
          ),
        ));
  }}

void modoManual(usuario) async {
    databaseReference.child('usuarios/residencia$usuario/configuracoes').update({'Modo': 'Manual'});
  }

void modoAuto(usuario) async {
  databaseReference.child('usuarios/residencia$usuario/configuracoes').update({'Modo': 'Automatico'});
}