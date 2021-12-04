import 'package:flutter/material.dart';
import 'aluno.dart';

class TerceiraPagina extends StatelessWidget {
  final Aluno aluno;
  TerceiraPagina(this.aluno);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter & Node.js'),
      ),
      body: CorpoTerceiraPagina(aluno),
    );
  }
}

class CorpoTerceiraPagina extends StatelessWidget {
  final Aluno aluno;
  CorpoTerceiraPagina(this.aluno);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            botao(
              context: context,
              tipo: 'Incluir Teste',
            ),
            botao(
              context: context,
              tipo: 'Excluir Teste',
            ),
          ],
        ),
      ),
    );
  }

  Widget botao({required BuildContext context, required String tipo}) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        child: Text(tipo),
        onPressed: () {
          if (tipo == 'Incluir Teste')
            aluno.inserirTodosAlunosTeste();
          else if (tipo == 'Excluir Teste') aluno.excluirTodosAlunosTeste();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Processando...'),
              duration: Duration(milliseconds: 987),
            ),
          );
        },
      ),
    );
  }
}
