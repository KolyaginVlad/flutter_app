import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Решение квадратного уравнения',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double a;
  double b;
  double c;
  double x1;
  double x2;
  String noAns = "";

  void _setStringA(String s) {
    setState(() {
      try {
        a = double.parse(s);
      } on FormatException {
        if (s == "") a = null;
      }
    });
  }

  void _setStringB(String s) {
    setState(() {
      try {
        b = double.parse(s);
      } on FormatException {
        if (s == "") b = null;
      }
    });
  }

  void _setStringC(String s) {
    setState(() {
      try {
        c = double.parse(s);
      } on FormatException {
        if (s == "") c = null;
      }
    });
  }

  void onPressed() {
    setState(() {
      noAns = "";
      x1 = null;
      x2 = null;
      if (a != 0) {
        double d = b * b - 4 * a * c;
        if (d > 0) {
          x1 = (-b + sqrt(d)) / 2 * a;
          x2 = (-b - sqrt(d)) / 2 * a;
        } else if (d == 0) {
          x1 = -b / 2 * a;
          x2 = -b / 2 * a;
        } else {
          noAns = "Нет решений";
        }
      } else {
        noAns = "Квадрат х не может иметь коэффициент 0";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Решение квадратного уравнения"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ((a == null) ? "" : a.toString()) +
                  "x^2+(" +
                  ((b == null) ? "" : b.toString()) +
                  "x)+(" +
                  ((c == null) ? "" : c.toString()) +
                  ")=0",
            ),
            TextField(
              onChanged: _setStringA,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: "a", icon: Icon(Icons.input)),
            ),
            TextField(
              onChanged: _setStringB,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: "b", icon: Icon(Icons.input)),
            ),
            TextField(
              onChanged: _setStringC,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: "c", icon: Icon(Icons.input)),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text("Решить"),
            ),
            Text((x1 == null && x2 == null)
                ? noAns
                : "x1 = " + x1.toString() + "\n" + "x2 = " + x2.toString())
          ],
        ),
      ),
    );
  }
}
