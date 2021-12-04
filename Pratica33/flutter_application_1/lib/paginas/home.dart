import 'package:flutter/material.dart';
import 'aluno.dart';
import 'primeiraPagina.dart';
import 'segundaPagina.dart';
import 'terceiraPagina.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int abaCorrente = 1;
  late List paginas;
  Aluno aluno = Aluno.full();
  @override
  void initState() {
    super.initState();
    paginas = [
      PrimeiraPagina(aluno),
      SegundaPagina(aluno),
      TerceiraPagina(aluno),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[this.abaCorrente],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.abaCorrente,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: (indice) {
          setState(
            () {
              aluno.lerTodosAlunos();
              this.abaCorrente = indice;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'CRUD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outline),
            label: 'Teste',
          ),
        ],
      ),
    );
  }
}
