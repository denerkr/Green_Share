import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: ListadeTransferencias(),
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ));

class ListadeTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(100.00, 100.000)),
        ItemTransferencia(Transferencia(200.00, 200.000)),
        ItemTransferencia(Transferencia(300.00, 500.000)),
        ItemTransferencia(Transferencia(400.00, 700.000)),
        ItemTransferencia(Transferencia(500.00, 900.000)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroconta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final double numeroconta;

  Transferencia(this.valor, this.numeroconta);
}
