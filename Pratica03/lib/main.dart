import 'package:flutter/material.dart';

void main() {
  String nome = "Guilherme/Gabriel";
  var dia = "24/08";
  runApp(
    Center(
      child: RichText(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: "Olá, ",
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.black,
          ), //TextStyle.
          children: <TextSpan>[
            TextSpan(
              text: '$nome, dia da semana $dia',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.double,
              ),
            ),
            TextSpan(
              text: '! \nBom dia!',
            ),
          ],
        ),
      ),
    ),
  );
}































































//Feito pelo grupo 15: Gabriel Augusto, Guilherme de Almeida e Guilherme Asevedo
