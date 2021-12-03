const express = require('express');
const path = require('path');
const app = express();
const port = 8030;
const hostname = '127.0.0.1';
const dir_css = path.join(__dirname, 'css');
const dir_img = path.join(__dirname, 'img')

app.use(express.static(dir_css));
app.use(express.static(dir_img));
//Iniciar:
app.listen(port, hostname, function () {
    console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}.`);
});
//URL: http://127.0.0.1:8030/
app.get('/', function (req, res) {
    res.send(dir);
});


//URL: http://127.0.0.1:8030/notas/:nota1/:nota2/:nota3
app.get('/aluno/nota/:nota1/:nota2/:nota3', function(req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
  
    let nota1 = parseFloat(req.params.nota1);
    let nota2 = parseFloat(req.params.nota2);
    let nota3 = parseFloat(req.params.nota3);
    let media = (nota1 + nota2 + nota3) / 3;
    let resp;
    let imagem = "/errado.png"
    if (media >= 0 && media < 3)
      resp = "reprovado";
    else if (media >= 3 && media < 7)
      resp = "em exame";
    else {
      resp = "aprovado";
      imagem = "/certo.png"
    }
    let pagina =
        `<html>
 <head>
 <title>Calculo de notas</title>
 <link rel="stylesheet" href="/estilos.css">
 </head>
 <body>
 <h1>Calculo de notas</h1>
 <div class="celsius">Nota1: ${nota1}</div>
 <div class="fahrenheit">Nota2: ${nota2}</div>
 <div class="fahrenheit">Nota3: ${nota3}</div>
 <div class="Media">Media: ${media}</div>
 <div class="Media">Situação: ${resp}</div>
 <img src="${imagem}" alt="imagem de aprovação ou reprovação">
 </body>
 </html>`
    res.send(pagina);
});