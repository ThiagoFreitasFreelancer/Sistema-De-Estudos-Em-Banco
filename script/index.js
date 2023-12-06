function editRecord(id) {
    // Lógica para editar o registro com o ID fornecido
    console.log("Editar registro com ID: " + id);
}

function deleteRecord(id) {
    // Lógica para excluir o registro com o ID fornecido
    console.log("Excluir registro com ID: " + id);
}

function createNewRecord() {
    // Lógica para criar um novo registro
    console.log("Criar novo registro");
}

function openModal() {
    //document.getElementById('modalBackground').style.display = 'flex';
    window.location.href = "http://localhost:8080/cadastra"
}

function openModalEmpresa() {
    //document.getElementById('modalBackground').style.display = 'flex';
    window.location.href = "http://localhost:8080/cadastra/empresa"
}

function openModalFuncionario() {
    //document.getElementById('modalBackground').style.display = 'flex';
    window.location.href = "http://localhost:8080/cadastra/funcionario"
}

function openModalServico() {
    //document.getElementById('modalBackground').style.display = 'flex';
    window.location.href = "http://localhost:8080/cadastra/servico"
}

function closeModal() {
    //document.getElementById('modalBackground').style.display = 'none';
    window.location.href = "http://localhost:8080/"
}

function criadoComSucesso( resposta ) {

    alert( resposta )

}

function selecionaOpcao( resposta ) {
    
    window.location.href = "http://localhost:8080/" + resposta

}