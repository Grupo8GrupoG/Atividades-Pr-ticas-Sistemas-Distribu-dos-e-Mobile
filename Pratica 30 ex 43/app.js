const express = require('express');
const path = require('path');
const app = express();
const port = 8050;
const hostname = '127.0.0.1';
const dir_css = path.join(__dirname, 'css');


app.use(express.static(dir_css));

//Iniciar:
app.listen(port, hostname, function () {
    console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}.`);
    
});
//URL: http://127.0.0.1:8030/
app.get('/', function (req, res) {
    res.send(dir);
});


//URL: http://127.0.0.1:8050/carcteristicas/:peso/:altura
app.get('/carcteristicas/:peso/:altura', function(req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
  
    let altura = parseFloat(req.params.altura)
    let peso = parseFloat(req.params.peso)
    let imc = peso/(altura*altura);
    let situacao
    if(imc<18.5){
      situacao = "Abaixo do peso"
    }else if(imc>18.5||imc <24.9){
      situacao = "Peso ideal(Parabéns)"
    }else if(imc>25||imc <29.9){
      situacao = "Levemente acima do peso"
    }else if(imc>30||imc <34.9){
      situacao = "Obesidade Grau I"
    }else if(imc>35||imc <39.9){
      situacao = "Obesidade Grau II(Severa)"
    }else if(imc>40){
      situacao = "Obesidade Grau III(Mórbida)"
    }
    console.log(imc)
    console.log(`IMC ${imc}`);
    let pagina =
        `<html>
 <head>
 <title>Cáclulo IMC</title>
 <link rel="stylesheet" href="/estilos.css">
 </head>
 <body>
 <h1>Cálculo IMC</h1>
 <div class="prod">Altura: ${altura}</div>
 <div class="prod">Peso: ${peso}</div>
 <div class="prod">situação: ${situacao}</div>
 <img src="https://i.pinimg.com/originals/31/fb/d7/31fbd7aabdf5fb2795d2673553b1dd43.gif" alt="Presentão">
 </body>
 </html>`
    res.send(pagina);
});