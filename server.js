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
    var mascots = await client.query('SELECT * FROM public."Account"')  

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

// about page
app.get('/about', function(req, res) {
    res.render('pages/about');
});



app.listen(8080);
console.log('8080 is the magic port');