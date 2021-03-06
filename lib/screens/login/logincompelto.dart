import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/login/registro.dart';
import 'package:GreenShare/screens/menu/appmenu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType {
  login,
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  String _email = "";
  String _password = "";
  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
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
      title: new Text("Login"),
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
              decoration: new InputDecoration(labelText: 'Email'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
    Text("The user wants a password reset request sent to $_email");
  }

  void getSenha() async {
    int casa = (await FirebaseDatabase.instance.reference().child("totalUsuarios").once()).value;
    for (var i = 0; i <= casa; i++) {
      Text('Carregando...',style: TextStyle(fontSize: 8.0,fontWeight: FontWeight.bold),);
      String pathsenha = "usuarios/residencia$i/cadastro/senha";
      String pathlogin = "usuarios/residencia$i/cadastro/email";
      String senha = (await FirebaseDatabase.instance.reference().child(pathsenha).once()).value;
      String login = (await FirebaseDatabase.instance.reference().child(pathlogin).once()).value;
      if (senha == _password && login == _email) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(usuario: i,)
        ));
      }

    }
  }

  // ignore: missing_return
  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: () => getSenha(),
            ),
            new FlatButton(
               child: new Text('Registre-se aqui'),
              onPressed: () {
                 final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Registro();
                }));
             }),
              new FlatButton(
               child: new Text('Esqueceu a senha?'),
               onPressed: _passwordReset,
             )
          ],
        ),
      );
    }
  }
}
