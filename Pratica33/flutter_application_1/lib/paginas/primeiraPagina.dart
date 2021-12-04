import 'package:flutter/material.dart';
import 'aluno.dart';

class PrimeiraPagina extends StatelessWidget {
  final Aluno aluno;
  PrimeiraPagina(this.aluno);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter & Node.js'),
      ),
      body: CorpoPrimeiraPagina(aluno), //(widget.listaAlunos),
    );
  }
}

class CorpoPrimeiraPagina extends StatefulWidget {
  final Aluno aluno;
  CorpoPrimeiraPagina(this.aluno);
  @override
  CorpoPrimeiraPaginaState createState() => CorpoPrimeiraPaginaState();
}

class CorpoPrimeiraPaginaState extends State<CorpoPrimeiraPagina> {
  final chaveFormulario = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cursoController = TextEditingController();
  final TextEditingController notaController = TextEditingController();
  late dynamic resp;
//Método de finalização:
  @override
  void dispose() {
    this.idController.dispose();
    this.nomeController.dispose();
    this.cursoController.dispose();
    this.notaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Form(
                key: this.chaveFormulario,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    campoTexto(
                      nome: 'id',
                      textoController: this.idController,
                      autoFoco: true,
                    ),
                    campoTexto(
                      nome: 'nome',
                      textoController: this.nomeController,
                      autoFoco: true,
                    ),
                    campoTexto(
                      nome: 'curso',
                      textoController: this.cursoController,
                      autoFoco: true,
                    ),
                    campoTexto(
                      nome: 'nota',
                      textoController: this.notaController,
                      autoFoco: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        botao(tipo: 'Inserir'),
                        botao(tipo: 'Atualizar'),
                        botao(tipo: 'Excluir'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget campoTexto({
    required String nome,
    required TextEditingController textoController,
    required bool autoFoco,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        cursorColor: Colors.red,
        controller: textoController,
        autofocus: autoFoco,
        validator: (valor) {
          if (valor == null || valor.isEmpty) {
            return '$nome não informado.';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => textoController.clear(),
            icon: Icon(Icons.clear),
          ),
          border: OutlineInputBorder(),
          labelText: nome,
        ),
      ),
    );
  }

  Widget botao({required String tipo}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 40,
      ),
      child: ElevatedButton(
        child: Text(tipo),
        onPressed: () => setState(
          () {
            if (chaveFormulario.currentState!.validate()) {
              widget.aluno.id = int.parse(idController.text);
              widget.aluno.nome = nomeController.text;
              widget.aluno.curso = cursoController.text;
              widget.aluno.nota = double.parse(notaController.text);
              idController.clear();
              nomeController.clear();
              cursoController.clear();
              notaController.clear();
            }
            if (tipo == 'Inserir')
              widget.aluno.inserirAluno();
            else if (tipo == 'Atualizar')
              widget.aluno.atualizarAluno();
            else if (tipo == 'Excluir') widget.aluno.excluirAluno();
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
