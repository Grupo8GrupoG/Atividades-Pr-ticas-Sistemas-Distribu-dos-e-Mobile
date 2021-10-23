function validar() {

    var nome = document.getElementById("name");

    var email = document.getElementById("email");

    var data = document.getElementById("date");

    var sexo = document.getElementById("sexo");


    // verificar se o nome está vazio
    if (nome.value == "") {
        alert("Nome não informado");

        // Deixa o input com o focus
        nome.focus();
        // retorna a função e não olha as outras linhas
        return;
    }

    if (email.value == "") {
        alert("E-mail não informado");
        email.focus();
        return;
    }
    if (data.value == "") {
        alert("Data de nascimento não informado");
        email.focus();
        return;
    }


    if (sexo.value == "") {
        alert("Sexo não informado");
        sexo.focus();
        return;
    }
    alert("Formulário enviado!");
    // envia o formulário
    //formulario.submit();
}