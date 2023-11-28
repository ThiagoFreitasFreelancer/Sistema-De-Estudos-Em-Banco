// load the things we need
var { Client } = require('pg');
var express = require('express');
const app = express();

// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname));

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

app.get('/cadastras', async (req, res) => { 

    res.render('partials/modalCreate');
});

app.listen(8080);
console.log('Funcionando');