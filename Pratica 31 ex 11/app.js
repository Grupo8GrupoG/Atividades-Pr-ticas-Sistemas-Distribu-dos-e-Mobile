/*
* Baixar o Express.
* No terminal: npm install express --save
*/
//Rodar: node .\02_aula_02.js
const express = require('express');
const app = express();
const port = 8030;
const hostname = '127.0.0.1';
//Iniciar:
app.listen(port, hostname, function () {
  console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}`);
});
//URL: http://127.0.0.1:8030?nomeAluno=Ana <-- Query String.
app.get('/', function (req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');




  var preco1 = parseFloat(req.query.preco1);
  var preco2 = parseFloat (req.query.preco2);
  var preco3 = parseFloat(req.query.preco3);


  var precoMaior;
  var precoMenor;
  var media;
  media = (preco1 + preco2 + preco3)/3

  if (preco1 > preco2 && preco1 > preco3) {
     precoMaior = preco1
    console.log("teste1")
  }
  else if (preco2 > preco1 && preco2 > preco3) {
    precoMaior = preco2
    console.log("teste2")
  }
  else if (preco3 > preco1 && preco3 > preco2) {
    console.log("teste3")
    precoMaior = preco3
  }
  
  if (preco1 < preco2 && preco1 < preco3) {
    precoMenor = preco1
   console.log("teste1")
 }
 else if (preco2 < preco1 && preco2 < preco3) {
   precoMenor = preco2
   console.log("teste2")
 }
 else if (preco3 < preco1 && preco3 < preco2) {
   console.log("teste3")
   precoMenor = preco3
 }

  console.log(preco1)
  console.log(preco2)
  console.log(preco3)
  console.log(precoMaior)
  console.log(precoMenor)
  res.send(`A média dos preços é: ${media}, o maior preço é ${precoMaior} e o menor preço é ${precoMenor}`);
});
