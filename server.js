// load the things we need
var { Client } = require('pg');
var express = require('express');
const bodyParser = require('body-parser');
const app = express();

// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname));
app.use(bodyParser.urlencoded({ extended: true }));

// Banco de dados
const client = new Client({
    host: '127.0.0.1',
    port: 5433,
    database: 'GerenciadorDeSalao',
    user: 'thiago',
    password: '354430'
});

client.connect();
// use res.render to load up an ejs view file

// index page
app.get('/', async (req, res) => {

    const query = 'SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Client' "

    var mascots = await client.query( query )  

    res.render('pages/index', {
        mascots: mascots["rows"]
    });
});

// services page
app.get('/services', async (req, res) => {
    
    var mascots = await client.query('SELECT * FROM public."Service"')  

    res.render('pages/services', {
        mascots: mascots["rows"]
    });
});

// empresas page
app.get('/empresas', async (req, res) => {

    const query = 'SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Manager' "

    var mascots = await client.query( query )   

    res.render('pages/empresas', {
        mascots: mascots["rows"]
    });
});

// funcionarios page
app.get('/funcionarios', async (req, res) => {
    
    const query = 'SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Provider' "

    var mascots = await client.query( query )  

    res.render('pages/funcionarios', {
        mascots: mascots["rows"]
    });
});

app.get('/cadastra/empresa', async (req, res) => { 

    res.render('partials/modalCreateEmpresa');
});

app.post('/cadastra/empresa', async (req, res) => { 

    
});

app.get('/cadastra/funcionario', async (req, res) => { 

    res.render('partials/modalCreateFuncionario');
});

app.post('/cadastra/funcionario', async (req, res) => { 

    
});

app.get('/cadastra/servico', async (req, res) => { 

    res.render('partials/modalCreateServico');
});

app.post('/cadastra/servico', async (req, res) => { 

    
});

app.get('/cadastra', async (req, res) => { 

    res.render('partials/modalCreate');
});

app.post('/cadastra/user', async (req, res) => { 

    const { 

        name, 
        password,
        cpf,
        cnpj,
        type_hair_id,
        start_date,
        birthday,
        tipeAccount,
        id_TypeAccount,
        id_Hair
    
    } = await req.body

    const avatar = null
    const active = '1990-01-01'

    const randonId = Math.floor(Math.random() * 99999)
    console.log( randonId )

    const queri1 = 'INSERT INTO "Adress" (account_id, city, neighborhood, road) VALUES('+ randonId +","+ "'" + "City A" + "'" +","+ "'" + "Neighborhood 1 "+"'"+","+ "'" + "Road 123" +"'" + ")"
    await client.query( queri1 )
    console.log("1")

    const queri2 = 'INSERT INTO "Phone" (account_id, phone, ddd, active, type) VALUES(' + randonId+","+ 123456789+","+ 11+","+ "'" + "2023-01-01" +"'" +","+ 1 +")"
    await client.query( queri2 )
    console.log("2")

    const queri3 = 'INSERT INTO "Email" (account_id, name, active, email) VALUES(' + randonId+","+ "'" + "john@example.com" +"'"+","+ "'" + "2023-01-01" +"'"+","+ "'" + "john@example.com" + "'" + ")"
    await client.query( queri3 )
    console.log("3")

    const query = 'INSERT INTO "Account"(id,name,password,cpf,cnpj,type_hair_id,start_date,birthday,active,avatar,"tipeAccount","account_id_Adress","account_id_Phone","account_id_Email","id_TypeAccount","id_Hair") VALUES('+randonId+","+"'"+name+"'"+","+"'"+password+"'"+","+cpf+","+cnpj+","+type_hair_id+","+"'"+start_date+"'"+","+"'"+birthday+"'"+","+"'"+active+"'"+","+avatar+","+"'"+tipeAccount+"'"+","+randonId+","+randonId+","+randonId+","+id_TypeAccount+","+id_Hair+ ")"
    
    console.log(query)
    await client.query( query )

    res.status( 200 ).render('pages/index')
    
});

app.listen(8080);
console.log('Funcionando');