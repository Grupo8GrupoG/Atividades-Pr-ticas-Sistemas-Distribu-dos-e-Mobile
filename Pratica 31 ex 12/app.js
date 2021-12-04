/*
* Baixar o Express.
* No terminal: npm install express --save
*/
//Rodar: node .\02_aula_02.js
const express = require('express');
const app = express();
const port = 8040;
const hostname = '127.0.0.1';
//Iniciar:
app.listen(port, hostname, function () {
  console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}`);
});
//URL: http://127.0.0.1:8040?nomeAluno=Ana <-- Query String.
app.get('/', function (req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');




  var lado1 = parseFloat(req.query.lado1);
  var lado2 = parseFloat(req.query.lado2);
  var lado3 = parseFloat(req.query.lado3);
  var triangulo = "";

  if (lado1 > lado2 + lado3||lado2>lado1+lado3||lado3>lado1+lado2) {
    console.log("ari nem ai")
    triangulo = "Isso não é um triâgulo";
  } else {
    console.log("ai")
    triangulo = "Isso é um triângulo";
  }
  console.log(lado1)
  console.log(lado2)
  console.log(lado3)

  res.send(`${triangulo}`);
});
