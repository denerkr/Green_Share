import 'package:GreenShare/components/editor.dart';
import 'package:GreenShare/models/transferencia.dart';
import 'package:flutter/material.dart';

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
                onPressed: () => _criaTransferencia(context),
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
