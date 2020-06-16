import 'package:calculadoraimcflutter/tabs/tab_imc.dart';
import 'package:calculadoraimcflutter/tabs/tab_simples_calc.dart';
import 'package:flutter/material.dart';

void main() => runApp(CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Calculadora"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "IMC",
              ),
              Tab(text: "Simples Calc"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TabIMC(),
            TabSimplesCalc(),
          ],
        ),
      ),
    );
  }
}
