import 'package:http/http.dart' as http;
import 'dart:convert';

class Aluno {
  int? id;
  String? nome;
  double? nota;
  String? curso;
  Future<List>? listaFuturaAlunos;
  Aluno({
    required this.id,
    required this.nome,
    required this.curso,
    required this.nota,
  });
  Aluno.full() {
    lerTodosAlunos();
  }
  factory Aluno.fromJSON(Map<String, dynamic> alunoJson) {
    return Aluno(
      id: alunoJson['id'],
      nome: alunoJson['nome'],
      curso: alunoJson['curso'],
      nota: alunoJson['nota'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "curso": curso,
        "nota": nota,
      };
  void lerTodosAlunos() => listaFuturaAlunos = _ler();
  void inserirAluno() => listaFuturaAlunos = _inserir();
  void atualizarAluno() => listaFuturaAlunos = _atualizar();
  void excluirAluno() => listaFuturaAlunos = _excluir();
  void inserirTodosAlunosTeste() => listaFuturaAlunos = _inserirTodosTeste();
  void excluirTodosAlunosTeste() => listaFuturaAlunos = _excluirTodosTeste();
  Future<List> _ler() async {
    print('*----- Ler Todos os Alunos -----*');
    Uri url = Uri.parse("http://localhost:8030/alunos");
    final resposta =
        await http.get(url, headers: {"Accept": "application/json"});
    return getLista(resposta);
  }

  Future<List> _inserir() async {
    print('*----- Inserir um Aluno -----*');
    var aluno = json.encode(toJson());
    print("Aluno inserido: $aluno \n\n");
    Uri url = Uri.parse("http://localhost:8030/alunos");
    final resposta = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: aluno,
      encoding: Encoding.getByName("utf-8"),
    );
    return getLista(resposta);
  }

  Future<List> _atualizar() async {
    print('*----- Atualizar um Aluno -----*');
    var aluno = json.encode(toJson());
    print("Aluno atualizado: $aluno \n\n");
    Uri url = Uri.parse("http://localhost:8030/alunos");
    final resposta = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: aluno,
      encoding: Encoding.getByName("utf-8"),
    );
    return getLista(resposta);
  }

  Future<List> _excluir() async {
    print('*----- Excluir um Aluno -----*');
    var aluno = json.encode(toJson());
    print("Aluno excluído: $aluno \n\n");
    Uri url = Uri.parse("http://localhost:8030/alunos");
    final resposta = await http.delete(
      url,
      headers: {"Content-Type": "application/json"},
      body: aluno,
      encoding: Encoding.getByName("utf-8"),
    );
    return getLista(resposta);
  }

  Future<List> _inserirTodosTeste() async {
    print('*----- Inserir Todos os Alunos de Teste -----*');
    Uri url = Uri.parse("http://localhost:8030/alunos/todos");
    final resposta = await http.post(
      url,
//headers: {"Content-Type": "application/json; charset=utf-8"},
      headers: {"Content-Type": "application/json"},
      encoding: Encoding.getByName("utf-8"),
    );
    return getLista(resposta);
  }

  Future<List> _excluirTodosTeste() async {
    print('*----- Excluir Todos os Alunos -----*');
    Uri url = Uri.parse("http://localhost:8030/alunos/todos");
    final resposta = await http.delete(
      url,
      headers: {"Content-Type": "application/json"},
      encoding: Encoding.getByName("utf-8"),
    );
    return getLista(resposta);
  }

  List getLista(final resposta) {
    print("Código da resposta HTTP: ${resposta.statusCode} \n\n");
    print("Corpo da mensagem HTTP: ${json.decode(resposta.body)} \n\n");
    if (resposta.statusCode == 200) {
      List lista = json
          .decode(resposta.body)
          .map((alunoJSON) => Aluno.fromJSON(alunoJSON))
          .toList();
      print('Dados baixados: ${resposta.body}');
      return lista;
    } else {
      throw Exception('Aluno - erro no carregamento.');
    }
  }
}
