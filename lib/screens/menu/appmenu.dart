import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/transferencia/formulario.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

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
                  child: Text('Lista de Tranferencias'),
                  onPressed: () {
                    final Future<Transferencia> future = Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return ListaTransferencias();
                    }));
                  }),
              RaisedButton(
                  child: Text('Formulario de Tranferencias'),
                  onPressed: () {
                    final Future<Transferencia> future = Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }));
                  }),
            ],
          ),
        ));
  }}