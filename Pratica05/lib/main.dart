import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain, // Permite aumentar o tamanho do logo.
          child: const FlutterLogo(),
        ),
      ),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image(
            image: NetworkImage(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
      ),
      Text(
        'Google Flutter.',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.yellow,
        ),
      ),
    ],
  ));
}
































































//Feito pelo grupo 15: Gabriel Augusto, Guilherme de Almeida e Guilherme Asevedo
