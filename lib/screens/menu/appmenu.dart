import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/transferencia/formulario.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

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
                    final Future<Transferencia> future = Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }));
                  }),
              RaisedButton(
                  child: Text('Modo Manual'),
                  onPressed: () => modoManual()
              ),
              RaisedButton(
                  child: Text('Modo Automatico'),
                  onPressed: () => modoAuto(),
              ),
            ],
          ),
        ));
  }}

void modoManual() async {
    databaseReference.child('usuarios/residencia8/configuracoes').update({'Modo': '1'});
  }

void modoAuto() async {
  databaseReference.child('usuarios/residencia8/configuracoes').update({'Modo': '0'});
}