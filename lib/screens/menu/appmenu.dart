import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/transferencia/formulario.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

  final databaseReference = FirebaseDatabase.instance.reference();

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

void Apagar() async {
  databaseReference.child('flutterDevsTeam1').remove();
  databaseReference.child('flutterDevsTeam2').remove();
  databaseReference.child('flutterDevsTeam3').remove();
  databaseReference.child('flutterDevsTeam4').remove();
  databaseReference.child('flutterDevsTeam5').remove();
  databaseReference.child('flutterDevsTeam6').remove();
  databaseReference.child('flutterDevsTeam7').remove();
}

void readData(){
  databaseReference.child("usuarios").child("residencia6").child("cadastro").child("-MLuCXL5qbtHL-Ngbm1Z").once().then((DataSnapshot usuarios) {
    print('Data : ${usuarios.value}');
  });
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
              RaisedButton(
                  child: Text('Criar Devs no firebase'),
                  onPressed: () => createData(),
              ),
              RaisedButton(
                child: Text('Apagar Devs no firebase'),
                onPressed: () => Apagar(),
              ),
            ],
          ),
        ));
  }}