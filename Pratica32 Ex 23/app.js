/*
 Baixar o Express. No terminal: npm install express --save
 Baixar o body-parser. No terminal: npm install body-parser --save
*/
//Rodar: node .\01_aula_03.js
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
//Para dados enviados no corpo (body) da mensagem no formato JSON-encoded:
app.use(express.json());
/*Para dados enviados no corpo (body) da mensagem no formato URL-encoded:
 OBS: bodyParser.urlencoded ([opções]):
 Retorna um objeto contendo os dados da requisição em req.body.
 Este objeto conterá pares na forma chave-valor em que o valor pode
 ser uma string ou array (quando extended é falso), ou qualquer tipo
 (quando extended é verdadeiro).
*/
app.use(express.urlencoded({
    extended: true
}));
var port = 8030;
var hostname = 'localhost';
app.listen(port, hostname, function () {
    console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}`);
});
//URL: http://127.0.0.1:8030
app.post('/equacao', function (req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain; charset=utf-8');
    var mesnsagem = "";
    var resultado1 = "";
    var resultado2 = "";
    var a = req.body.a;
    var b = req.body.b;
    var c = req.body.c;
    var raiz1 = (-b + Math.sqrt(delta)) / (2 * a);
    var raiz2 = (-b - Math.sqrt(delta)) / (2 * a);
    var delta = b * b - 4 * a * c;


    console.log(raiz1)

    if (a == 0 && b == 0 && c != 0) {
        mensagem = "Coeficientes informados incorretamente"
    } else if (c == 0) {
        mensagem = "Igualdade confirmada: 0 = 0"
    } else if (a == 0 && b != 0) {

        var raiz1 = (c / -b);
        resultado1 = `${raiz1}`;
        console.log(raiz1)
        mensagem = `Esta é uma equação de primeiro grau, o resultado : ${resultado1}`
    } else if (delta < 0) {
        mensagem = "Esta equação não possui raízes reais"

    } else if (delta == 0) {
        var raiz1 = (-b + Math.sqrt(delta)) / (2 * a);
        var raiz2 = (-b - Math.sqrt(delta)) / (2 * a);
        resultado1 = `${raiz1}`;
        resultado2 = `${raiz2}`;
        mensagem = `Esta equação possui duas raízes reais iguais, o resultado X1:${resultado1}`
    } else if (delta > 0) {
        var raiz1 = (-b + Math.sqrt(delta)) / (2 * a);
        var raiz2 = (-b - Math.sqrt(delta)) / (2 * a);

        resultado1 = `${raiz1}`;
        resultado2 = `${raiz2}`;
        mensagem = `Esta equação possui duas raízes reais diferentes, o resultado X1:${resultado1}  |  X2: ${resultado2}`
    }

    console.log(req.body);
    res.send(`${mensagem}`);
});