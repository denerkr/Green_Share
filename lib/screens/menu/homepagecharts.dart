import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final int usuario;
  final Widget child;
  HomePage({Key key, this.child, this.usuario}) : super(key: key);
  _HomePageState createState() => _HomePageState(this.usuario);
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Sales, int>> _seriesLineData;
  final int usuario;
  _HomePageState(this.usuario);

  _generateData(){
    print("chegou no grafico:$usuario");
    var linesalesdata1 = [
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 1),
      new Sales(4, 51),
      new Sales(5, 20),
      new Sales(6, 35),
      new Sales(7, 45),
    ];

    var linesalesdata2 = [
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 1),
      new Sales(4, 45),
      new Sales(5, 30),
      new Sales(6, 20),
      new Sales(7, 25),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
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
                          'Histórico de geração e consumo de energia',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
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
                                new charts.ChartTitle('Energia gerada e consumida em (kW/h',
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
  int yearval;
  int salesval;
  Sales(this.yearval, this.salesval);
}
