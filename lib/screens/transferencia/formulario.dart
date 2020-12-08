import 'package:GreenShare/components/editor.dart';
import 'package:GreenShare/models/transferencia.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FormularioTransferencia extends StatefulWidget {
  final int usuario;

  const FormularioTransferencia({Key key, this.usuario}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState(usuario);
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final int usuario;

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferenciaState(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Compra e Venda'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: 'Multiplicador maximo para compra',
                dica: '1.5',
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: 'Mutiplicador minimo para venda',
                  dica: '1.5',
                  icone: Icons.monetization_on),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => attDados(context, usuario),
              ),
            ],
          ),
        ));
  }

  void attDados(BuildContext context, usuario) {
    final double numeroConta = double.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    databaseReference.child('usuarios/residencia$usuario/configuracoes').update({'MultiplicadorMaximoParaCompra': numeroConta});
    databaseReference.child('usuarios/residencia$usuario/configuracoes').update({'MutiplicadorMinimoParaVenda': valor});
  }
}