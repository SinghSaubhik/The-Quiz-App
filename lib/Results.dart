import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:quizzler/Result.dart';
import 'package:quizzler/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ResultPage extends StatelessWidget {
  Result result;

  ResultPage(Result result) {
    this.result = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Results(this.result),
        ),
      ),
    );
  }
}

class Results extends StatefulWidget {
  Result result;

  Results(result) {
    this.result = result;
  }

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  Map<String, double> dataMap = new Map();
  List<Color> colorList = [Colors.blue, Colors.red, Colors.white30];
  int c;
  int i;

  @override
  void initState() {
    super.initState();

    c = widget.result.correct;
    i = widget.result.incorrect;
    dataMap.putIfAbsent("Correct", () => c.ceilToDouble());
    dataMap.putIfAbsent("Incorrect", () => i.ceilToDouble());
    dataMap.putIfAbsent("Unattempted", () => 0);

    print(widget.result.correct);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Total: ${(c + i).round()}",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              Text(
                "Correct: $c",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              Text(
                "Incorrect: $i",
                style: TextStyle(color: Colors.white, fontSize: 26),
              )
            ],
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          PieChart(
            dataMap: dataMap,
            legendFontColor: Colors.white,
            legendFontSize: 10.0,
            legendFontWeight: FontWeight.w600,
            animationDuration: Duration(milliseconds: 900),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery
                .of(context)
                .size
                .width / 1.5,
            showChartValuesInPercentage: true,
            showChartValues: true,
            showChartValuesOutside: false,
            chartValuesColor: Colors.white.withOpacity(0.9),
            colorList: colorList,
            showLegends: false,
            decimalPlaces: 1,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Attempt again",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            elevation: 10,
          )
        ],
      ),
    );
  }
}
