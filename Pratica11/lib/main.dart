import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class SegundaRota extends StatelessWidget {
  String titulo1;
  String titulo2;
  String texto;
  SegundaRota({this.titulo1, this.titulo2, this.texto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo1),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                titulo2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              margin: EdgeInsets.all(20),
            ),
            Container(
              child: Text(
                texto,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              margin: EdgeInsets.all(50),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álbum"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213781/pexels-photo-213781.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Nova York', titulo2: 'Nova York é um estado dos EUA', texto: 'Nova York é a maior cidade dos Estados Unidos. É um dos grandes centros culturais e empresariais do mundo. Seu ritmo acelerado e sua atividade constante lhe renderam o apelido de “cidade que nunca dorme”.')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213782/pexels-photo-213782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Montanhas', titulo2: 'Local desconhecido', texto: 'Montanha ou monte (do latim montanea, de mons, montis) é uma forma de relevo. Uma sequência de montanhas denomina-se cordilheira.')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213783/pexels-photo-213783.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Praia', titulo2: 'Local desconhecido', texto: 'Praia é uma formação geológica composta por partículas soltas de mineral ou rocha na forma de areia, cascalho, seixo ou calhaus')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213784/pexels-photo-213784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Lagoa', titulo2: 'Local desconhecido', texto: 'Uma lagoa é um corpo de água com pouco fluxo, mas geralmente sem água estagnada, podendo ser natural ou feita pelo Homem (artificial)')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213785/pexels-photo-213785.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Mar', titulo2: 'Local desconhecido', texto: 'Mar é um grande corpo de água salgada cercado por terra em parte ou em totalidade')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213786/pexels-photo-213786.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Lagoa com uma cabana', titulo2: 'Local desconhecido', texto: 'Cabana, mucambo, mocambo, palhoça, palhota , tejupar, cubata ou choupana são denominações dadas a moradias construídas artesanalmente')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213787/pexels-photo-213787.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Chapada', titulo2: 'Local desconhecido', texto: 'Chapada é um termo das áreas de Geografia e Geologia que corresponde a uma área de terra elevada, de dimensões consideráveis, com topo relativamente ou essencialmente plano.')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213788/pexels-photo-213788.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Deserto', titulo2: 'Local desconhecido', texto: 'Deserto, em geografia, é uma região que recebe pouca precipitação pluviométrica. Muitos desertos têm um índice pluviométrico anual abaixo de 400 mm. Como consequência são áridos, tendo a reputação de serem capazes de sustentar pouca vida.')));
                }),
            FlatButton(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.pexels.com/photos/213789/pexels-photo-213789.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaRota(titulo1: 'Samambaia', titulo2: 'NEPHROLEPIS EXALTATA', texto: 'As samambaias, ou fetos, são vegetais vasculares membros do táxon das pteridófitas. Elas possuem tecidos vasculares, folhas verdadeiras, se reproduzem através de esporos e não produzem sementes ou flores.')));
                }),
          ],
        ),
      ),
    );
  }
}
















































































//Feito pelo grupo 15: Gabriel Augusto, Guilherme de Almeida e Guilherme Asevedo
