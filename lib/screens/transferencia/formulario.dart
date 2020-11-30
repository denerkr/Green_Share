import 'package:GreenShare/components/editor.dart';
import 'package:GreenShare/models/transferencia.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Transferência'),
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
                onPressed: () => attDados(context),
              ),
            ],
          ),
        ));
  }

void attDados(BuildContext context){
  final double numeroConta = double.tryParse(_controladorCampoNumeroConta.text);
  final double valor = double.tryParse(_controladorCampoValor.text);
    databaseReference.child('usuarios/residencia8/configuracoes').update({'Multiplicador maximo para compra': numeroConta});
    databaseReference.child('usuarios/residencia8/configuracoes').update({'Mutiplicador minimo para venda': valor});
}


  void _criaTransferencia(BuildContext context) {
    ///debugPrint('clicou no botão confirmar');
    final double numeroConta =
        double.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    // ignore: unrelated_type_equality_checks
    if (numeroConta != Null && valor != Null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
      ///debugPrint('criando Transferência');
      ///debugPrint('$transferenciaCriada');
    }
  }
}

Future<String> getsenha() async {
  String result = (await FirebaseDatabase.instance.reference().child("usuarios/residencia6/cadastro/-MLuCXL5qbtHL-Ngbm1Z/senha").once()).value;
  print(result);
  return result;
}