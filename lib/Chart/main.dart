import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Perkembangan Keuangan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _UangData {
  _UangData(this.hari, this.nominal);
  final double hari;
  final double nominal;
}

class _MyHomePageState extends State<MyHomePage> {
 List<_UangData> data = [
    _UangData(10, 1000000),
    _UangData(15, 200000),
    _UangData(20, 300000),
    _UangData(25, 500000),
    _UangData(30, 700000)
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Align(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),
                  child:ElevatedButton.icon(
                    icon: const Icon(Icons.close, size: 30),
                    label: const Text("Kembali", style: TextStyle(fontSize: 16)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )
                      )
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                )
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 0),
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Perkembangan Keuangan Bulan Maret'),
                          legend: Legend(isVisible: true),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<_UangData, double>>[
                            LineSeries<_UangData, double>(
                              dataSource: data,
                              xValueMapper: (_UangData nominal, _) => nominal.hari,
                              yValueMapper: (_UangData nominal, _) => nominal.nominal,
                              name: 'Keuangan',
                              dataLabelSettings: const DataLabelSettings(isVisible: true))
                          ]
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                      ),
                      
                      
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  )
                ),
              )
          ],
        ),
      ),
      
    );
  }
}
