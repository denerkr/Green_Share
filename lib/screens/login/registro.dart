import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/login/logincompelto.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RegistroState();
}

// Used for controlling whether the user is login or creating an account
enum FormType {
  register
}

class RegistroState extends State<Registro> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _password2Filter = new TextEditingController();
  String _email = "";
  String _password = "";
  String _password2 = "";
  FormType _form = FormType.register; // our default setting is to login, and we should switch to creating an account when the user chooses to

  RegistroState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _password2Filter.addListener(_password2Listen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _password2Listen() {
    if (_password2Filter.text.isEmpty) {
      _password2 = "";
    } else {
      _password2 = _password2Filter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Registro"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                  labelText: 'Email'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                  labelText: 'Senha'
              ),
              obscureText: true,
            ),
          ),
          new Container(
            child: new TextField(
              controller: _password2Filter,
              decoration: new InputDecoration(
                  labelText: 'Confirme senha'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget _buildButtons() {
    if (_form == FormType.register) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
                child: new Text('Crie a conta'),
                onPressed: () {
                  final Future<Transferencia> future = Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                }),
            ],
        ),
      );
    }}}