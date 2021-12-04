import 'package:flutter/material.dart';
import 'aluno.dart';

class SegundaPagina extends StatefulWidget {
  final Aluno aluno;
  SegundaPagina(this.aluno);
  @override
  SegundaPaginaState createState() => SegundaPaginaState();
}

class SegundaPaginaState extends State<SegundaPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter & Node.js'),
      ),
      body: CorpoSegundaPagina(aluno: widget.aluno),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () => setState(
          () {
            widget.aluno.lerTodosAlunos();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Processando...'),
                duration: Duration(milliseconds: 987),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CorpoSegundaPagina extends StatelessWidget {
  Aluno? aluno;
  CorpoSegundaPagina({required this.aluno});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List>(
        future: aluno!.listaFuturaAlunos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, indice) {
                  aluno = snapshot.data![indice];
                  Text id = Text(
                    aluno!.id.toString(),
                    style: TextStyle(
                      color: indice % 2 == 0
                          ? Colors.amber[600]
                          : Colors.green[600],
                      fontWeight: FontWeight.bold,
                    ),
                  );
                  Text nome = Text(
                    aluno!.nome!,
                    style: TextStyle(
                      color: indice % 2 == 0
                          ? Colors.amber[600]
                          : Colors.green[600],
                      fontWeight: FontWeight.bold,
                    ),
                  );
                  Text curso = Text(
                    aluno!.curso!,
                    style: TextStyle(
                      color: indice % 2 == 0
                          ? Colors.amber[600]
                          : Colors.green[600],
                      fontWeight: FontWeight.bold,
                    ),
                  );
                  Text nota = Text(
                    aluno!.nota!.toStringAsFixed(2),
                    style: TextStyle(
                      color: aluno!.nota! >= 70 ? Colors.blue : Colors.red,
                    ),
                  );
                  return Card(
                    child: ListTile(
                      leading: id,
                      title: nome,
                      subtitle: curso,
                      trailing: nota,
                    ),
                    color:
                        indice % 2 == 0 ? Colors.amber[100] : Colors.green[100],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Erro ao receber os dados: ${snapshot.error}',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
