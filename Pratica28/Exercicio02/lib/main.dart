import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  double valor = 0;
  String resp = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Indicador de Progresso',
        ),
      ),
      body: corpo(),
    );
  }

  corpo() {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.deepPurple,
            strokeWidth: 10,
            value: valor,
          ),
          SizedBox(height: 50),
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.deepPurple,
            minHeight: 10,
            value: valor,
          ),
          SizedBox(height: 50),
          ElevatedButton(
            child: Text("Download"),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.deepPurple,
              padding: EdgeInsets.all(30),
            ),
            onPressed: () {
              valor = 0;
              resp = '';
              simularDownload();
            },
          ),
          Container(
            child: Text(
              resp,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30,
              ),
            ),
            padding: EdgeInsets.all(30),
          ),
        ],
      ),
    );
  }

  void simularDownload() {
    Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(
          () {
            resp = valor.toStringAsFixed(1);
            if (valor >= 1) {
              timer.cancel();
              print('Fim');
              resp = 'Dados recebidos!';
            } else {
              valor += 0.1;
              print(valor);
            }
          },
        );
      },
    );
  }
}
