function editRecord(id) {
    // Lógica para editar o registro com o ID fornecido
    window.location.href = "http://localhost:8080/cadastra";
}

function deleteCliente( id ) {
    // Lógica para excluir o registro com o ID fornecido
    $.ajax({
        url: "http://localhost:8080/cliente/delete?id=" + id,
        type: 'DELETE',
        success: function (res) {
            window.location.reload();
            return false;
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
            alert("Error deleting");
            return false;
        }
    });
}

function deleteServico( id ) {
    // Lógica para excluir o registro com o ID fornecido
    $.ajax({
        url: "http://localhost:8080/service/delete?id=" + id,
        type: 'DELETE',
        success: function (res) {
            window.location.reload();
            return false;
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
            alert("Error deleting");
            return false;
        }
    });
}

function deleteEmpresa( id ) {
    // Lógica para excluir o registro com o ID fornecido
    console.log(id)
    $.ajax({
        url: "http://localhost:8080/empresas/delete?id=" + id,
        type: 'DELETE',
        success: function (res) {
            window.location.reload();
            return false;
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
            alert("Error deleting");
            return false;
        }
    });
}

function deleteFuncionario( id ) {
    // Lógica para excluir o registro com o ID fornecido
    console.log(id)
    $.ajax({
        url: "http://localhost:8080/funcionarios/delete?id=" + id,
        type: 'DELETE',
        success: function (res) {
            window.location.reload();
            return false;
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
            alert("Error deleting");
            return false;
        }
    });
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

function closeModalService() {
    //document.getElementById('modalBackground').style.display = 'none';
    window.location.href = "http://localhost:8080/services"
}

function criadoComSucesso( resposta ) {

    alert( resposta )

}

function selecionaOpcao( resposta ) {
    
    window.location.href = "http://localhost:8080/" + resposta

}