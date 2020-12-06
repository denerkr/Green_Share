import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  final int usuario;
  final Widget child;
  HomePage({Key key, this.child, this.usuario}) : super(key: key);
  _HomePageState createState() => _HomePageState(this.usuario);
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Sales, num>> _seriesLineData;
  List<charts.Series<Sales, num>> _seriesLineData2;
  List<charts.Series<Sales, num>> _seriesLineData3;
  final int usuario;
  _HomePageState(this.usuario);

  _generateData() async{
    print("chegou no grafico:$usuario");
    num v1 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/geracao/dia1").once()).value;
    print("v1:$v1");
    num v2 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/geracao/dia2").once()).value;
    num v3 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/geracao/dia3").once()).value;
    num v4 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/geracao/dia4").once()).value;
    num v5 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/geracao/dia5").once()).value;
    num v6 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/geracao/dia6").once()).value;
    num v7 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/geracao/dia7").once()).value;
    var linesalesdata1 = [
      new Sales(1, v1),
      new Sales(2, v2),
      new Sales(3, v3),
      new Sales(4, v4),
      new Sales(5, v5),
      new Sales(6, v6),
      new Sales(7, v7),
    ];

    num vc1 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/consumo/dia1").once()).value;
    num vc2 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/consumo/dia2").once()).value;
    num vc3 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/consumo/dia3").once()).value;
    num vc4 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/consumo/dia4").once()).value;
    num vc5 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/consumo/dia5").once()).value;
    num vc6 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/consumo/dia6").once()).value;
    num vc7 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/consumo/dia7").once()).value;
    var linesalesdata2 = [
      new Sales(1, vc1),
      new Sales(2, vc2),
      new Sales(3, vc3),
      new Sales(4, vc4),
      new Sales(5, vc5),
      new Sales(6, vc6),
      new Sales(7, vc7),
    ];

    num vcompra1 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/compra/dia1").once()).value;
    num vcompra2 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/compra/dia2").once()).value;
    num vcompra3 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/compra/dia3").once()).value;
    num vcompra4 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/compra/dia4").once()).value;
    num vcompra5 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/compra/dia5").once()).value;
    num vcompra6 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/compra/dia6").once()).value;
    num vcompra7 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/compra/dia7").once()).value;
    var linesalesdata3 = [
      new Sales(1, vcompra1),
      new Sales(2, vcompra2),
      new Sales(3, vcompra3),
      new Sales(4, vcompra4),
      new Sales(5, vcompra5),
      new Sales(6, vcompra6),
      new Sales(7, vcompra7),
    ];

    num vvenda1 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/venda/dia1").once()).value;
    num vvenda2 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/venda/dia2").once()).value;
    num vvenda3 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/venda/dia3").once()).value;
    num vvenda4 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/venda/dia4").once()).value;
    num vvenda5 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/venda/dia5").once()).value;
    num vvenda6 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/venda/dia6").once()).value;
    num vvenda7 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/acumulado/venda/dia7").once()).value;
    var linesalesdata4 = [
      new Sales(1, vvenda1),
      new Sales(2, vvenda2),
      new Sales(3, vvenda3),
      new Sales(4, vvenda4),
      new Sales(5, vvenda5),
      new Sales(6, vvenda6),
      new Sales(7, vvenda7),
    ];

    num vgeracaoi1 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo1").once()).value;
    num vgeracaoi2 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo2").once()).value;
    num vgeracaoi3 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo3").once()).value;
    num vgeracaoi4 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo4").once()).value;
    num vgeracaoi5 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo5").once()).value;
    num vgeracaoi6 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo6").once()).value;
    num vgeracaoi7 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo7").once()).value;
    num vgeracaoi8 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo8").once()).value;
    num vgeracaoi9 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo9").once()).value;
    num vgeracaoi10 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo10").once()).value;
    num vgeracaoi11 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo11").once()).value;
    num vgeracaoi12 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/geracao/intervalo12").once()).value;

    var linesalesdata5 = [
      new Sales(1, vgeracaoi1),
      new Sales(2, vgeracaoi2),
      new Sales(3, vgeracaoi3),
      new Sales(4, vgeracaoi4),
      new Sales(5, vgeracaoi5),
      new Sales(6, vgeracaoi6),
      new Sales(7, vgeracaoi7),
      new Sales(8, vgeracaoi8),
      new Sales(9, vgeracaoi9),
      new Sales(10, vgeracaoi10),
      new Sales(11, vgeracaoi11),
      new Sales(12, vgeracaoi12),
    ];

    num vconsumoi1 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo1").once()).value;
    num vconsumoi2 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo2").once()).value;
    num vconsumoi3 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo3").once()).value;
    num vconsumoi4 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo4").once()).value;
    num vconsumoi5 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo5").once()).value;
    num vconsumoi6 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo6").once()).value;
    num vconsumoi7 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo7").once()).value;
    num vconsumoi8 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo8").once()).value;
    num vconsumoi9 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo9").once()).value;
    num vconsumoi10 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo10").once()).value;
    num vconsumoi11 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo11").once()).value;
    num vconsumoi12 = (await FirebaseDatabase.instance.reference().child("usuarios/residencia$usuario/historico/intervalos/consumo/intervalo12").once()).value;

    var linesalesdata6 = [
      new Sales(1, vconsumoi1),
      new Sales(2, vconsumoi2),
      new Sales(3, vconsumoi3),
      new Sales(4, vconsumoi4),
      new Sales(5, vconsumoi5),
      new Sales(6, vconsumoi6),
      new Sales(7, vconsumoi7),
      new Sales(8, vconsumoi8),
      new Sales(9, vconsumoi9),
      new Sales(10, vconsumoi10),
      new Sales(11, vconsumoi11),
      new Sales(12, vconsumoi12),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution1',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution2',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );

    _seriesLineData2.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution3',
        data: linesalesdata3,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData2.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution4',
        data: linesalesdata4,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData3.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution5',
        data: linesalesdata5,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData3.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution6',
        data: linesalesdata6,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesLineData = List<charts.Series<Sales, num>>();
    _seriesLineData2 = List<charts.Series<Sales, num>>();
    _seriesLineData3 = List<charts.Series<Sales, num>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('Gráficos'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Histórico de geração e consumo de energia dos últimos 7 dias (verde:Geração, laranja:Consumo)',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                              _seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, includePoints:true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Tempo (dias)',
                                    behaviorPosition: charts.BehaviorPosition.bottom,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Energia gerada e consumida em (kW/h)',
                                    behaviorPosition: charts.BehaviorPosition.start,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Histórico de compra e venda de energia dos últimos 7 dias (verde:compra, laranja:venda)',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                              _seriesLineData2,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, includePoints:true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Tempo (dias)',
                                    behaviorPosition: charts.BehaviorPosition.bottom,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Energia comprada e vendida em (kW/h)',
                                    behaviorPosition: charts.BehaviorPosition.start,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Média de geração e consumo de energia por dia (verde:Geração, laranja:Consumo)',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                              _seriesLineData3,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, includePoints:true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Intervalo de tempo (2h)',
                                    behaviorPosition: charts.BehaviorPosition.bottom,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Energia gerada e consumida em (kW/h)',
                                    behaviorPosition: charts.BehaviorPosition.start,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Sales {
  num yearval;
  num salesval;
  Sales(this.yearval, this.salesval);
}
