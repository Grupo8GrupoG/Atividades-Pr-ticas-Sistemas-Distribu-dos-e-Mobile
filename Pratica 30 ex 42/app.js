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


//URL: http://127.0.0.1:8030/produtos/:codigo
app.get('/produtos/:codigo', function(req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
  
    let codigoProd = parseFloat(req.params.codigo);
    let produto;
    let precoProduto;
    let imagem = "/presentão.png"
    if(codigoProd==1){
      produto = "Sapato"
      precoProduto = "R$ 99,99"
    }else if(codigoProd==2){
      produto = "Bolsa"
      precoProduto = "R$ 103,89"
    }else if(codigoProd==3){
      produto = "Camisa"
      precoProduto = "R$ 49,98"
    }else if(codigoProd==4){
      produto = "Calça"
      precoProduto = "R$ 89,72"
    }
    else if(codigoProd==5){
      produto = "Blusa"
      precoProduto = "R$ 97,35"
    }
    

    let pagina =
        `<html>
 <head>
 <title>Estoque da loja</title>
 <link rel="stylesheet" href="/estilos.css">
 </head>
 <body>
 <h1>Estoque da loja</h1>
 <div class="prod">Produto: ${produto} , preço: ${precoProduto}</div>
 <img src="${imagem}" alt="Presentão">
 </body>
 </html>`
    res.send(pagina);
});