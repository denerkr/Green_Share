class Transferencia {
  final double valor;
  final double numeroconta;

  Transferencia(
    this.valor,
    this.numeroconta,
  );

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroconta: $numeroconta}';
  }
}
