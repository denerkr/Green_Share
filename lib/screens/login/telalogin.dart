import 'package:GreenShare/components/editor.dart';
import 'package:GreenShare/models/login.dart';
import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/login/telalogin.dart';
import 'package:GreenShare/screens/menu/appmenu.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TelaLoginState();
  }
}

class TelaLoginState extends State<TelaLogin> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: 'Email',
                dica: 'exemple@email.com',
                icone: Icons.alternate_email,
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: 'Senha',
                  dica: '*****',
                  icone: Icons.lock),
              RaisedButton(
                  child: Text('Logar'),
                  onPressed: () {
                    final Future<Transferencia> future = Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return Menu();
                    }));
                  }),
            ],
          ),
        ));
  }}