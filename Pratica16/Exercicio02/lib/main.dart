import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

class Preco {
  double etanol;
  double gasolina;
  Preco(this.etanol, this.gasolina);
  razao() => etanol / gasolina;
}

class PrimeiraRota extends StatefulWidget {
  @override
  State<PrimeiraRota> createState() => _PrimeiraRotaState();
}

class _PrimeiraRotaState extends State<PrimeiraRota> {
  final TextEditingController etanolController = TextEditingController();

  final TextEditingController gasolinaController = TextEditingController();

  String resp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: etanolController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => etanolController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço do etanol',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: gasolinaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => gasolinaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço da gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              double etanol = double.parse(etanolController.text);
              double gasolina = double.parse(gasolinaController.text);
              Preco preco = Preco(
                etanol,
                gasolina,
              );
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SegundaRota(preco)))
                  .then((resposta) => setState(() => resp = resposta));
            },
            child: Text('Ir para a Segunda Rota'),
          ),
          Text(resp),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Preco preco;
  SegundaRota(this.preco);
  @override
  Widget build(BuildContext context) {
    String resp = 'Gasolina';
    if (preco.razao() < 0.7) {
      resp = 'Etanol';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${preco.etanol.toStringAsFixed(2)} / ${preco.gasolina.toStringAsFixed(2)} = ${preco.razao().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Abasteça com $resp',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context, resp);
              },
            ),
          ],
        ),
      ),
    );
  }
}

















































































//Feito pelo grupo 15: Gabriel Augusto, Guilherme de Almeida e Guilherme Asevedo
