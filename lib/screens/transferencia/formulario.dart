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
                rotulo: 'Numero Conta',
                dica: '0000',
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: 'Valor',
                  dica: '0.00',
                  icone: Icons.monetization_on),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => getsenha(),
              ),
            ],
          ),
        ));
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

void createData(){
  databaseReference.child("flutterDevsTeam1").set({
    'name': 'Deepak Nishad',
    'description': 'Team Lead'
  });
  databaseReference.child("flutterDevsTeam2").set({
    'name': 'Yashwant Kumar',
    'description': 'Senior Software Engineer'
  });
  databaseReference.child("flutterDevsTeam3").set({
    'name': 'Akshay',
    'description': 'Software Engineer'
  });
  databaseReference.child("flutterDevsTeam4").set({
    'name': 'Aditya',
    'description': 'Software Engineer'
  });
  databaseReference.child("flutterDevsTeam5").set({
    'name': 'Shaiq',
    'description': 'Associate Software Engineer'
  });
  databaseReference.child("flutterDevsTeam6").set({
    'name': 'Mohit',
    'description': 'Associate Software Engineer'
  });
  databaseReference.child("flutterDevsTeam7").set({
    'name': 'Naveen',
    'description': 'Associate Software Engineer'
  });
}

void readData(){
  databaseReference.child("usuarios").child("residencia6").child("cadastro").child("-MLuCXL5qbtHL-Ngbm1Z").once().then((DataSnapshot usuarios) {
      print('Data : ${usuarios.value}');
  });
}

Future<String> getsenha() async {
  String result = (await FirebaseDatabase.instance.reference().child("usuarios/residencia6/cadastro/-MLuCXL5qbtHL-Ngbm1Z/senha").once()).value;
  print(result);
  return result;
}