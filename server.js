// load the things we need
var { Client, Query } = require('pg');
var express = require('express');
const bodyParser = require('body-parser');
const app = express();
const moment = require('moment');
require('./script/index')

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

app.get('/', async (req, res) => {

    const query = 'SELECT * FROM "Account"'

    var mascots = await client.query( query )  

    res.render('pages/all', {
        mascots: mascots["rows"]
    });
});
// index page
app.get('/cliente', async (req, res) => {

    const query = 'SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Client' "

    var mascots = await client.query( query )  

    res.render('pages/index', {
        mascots: mascots["rows"]
    });
});

app.get('/cliente/edit', async (req, res) => {

    const { id } = req.query
    

    const query = 'SELECT * FROM "Account" WHERE "id" = ' + id
    var mascots = await client.query( query )

    res.render('partials/modalEditCliente', {
         mascots: mascots["rows"]
     });
});

app.post('/cliente/edited', async (req, res) => { 

    
    const { 

        name,
        password,
        cpf,
        type_hair_id,
        birthday,
        id
    
    } = await req.body

    const avatar = 1
    const active = moment().format('YYYY-MM-DD');
    var start_date = moment().format('YYYY-MM-DD');

    try{

        const query = 'UPDATE "Account" SET ' + 'name=' + "'" + name + "'" + ',password=' + "'" + password + "'" + ',cpf=' + "'" + cpf + "'" + ',type_hair_id=' + "'" + type_hair_id + "'" + ',start_date=' + "'" + start_date + "'" + ',birthday=' + "'" + birthday + "'" + ',active=' + "'" + active + "'" + ',avatar=' + "'" + avatar + "'" + ' WHERE id = ' + id
        
        await client.query( query )

        var mascots = await client.query('SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Client' ")        

        res.render('pages/index',{ 
            mascots: mascots["rows"]
        });
    }
    catch(erro){
        
        console.log(erro)
        res.sendStatus( 500 )

    }
});

app.delete('/cliente/delete', async (req, res) => {

    const { id } = req.query

    const query = 'DELETE FROM "Account" WHERE id = ' + id
    client.query( query )  

    var mascots = await client.query('SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Client' ")  

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

app.delete('/service/delete', async (req, res) => {

    const { id } = req.query

    const query = 'DELETE FROM "Service" WHERE id = ' + id
    client.query( query )  

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

app.delete('/empresas/delete', async (req, res) => {

    const { id } = req.query

    const query = 'DELETE FROM "Account" WHERE id = ' + id
    client.query( query )  

    var mascots = await client.query('SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Manager' ")  

    res.render('pages/services', {
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

app.delete('/funcionarios/delete', async (req, res) => {

    const { id } = req.query

    const query = 'DELETE FROM "Account" WHERE id = ' + id
    client.query( query )  

    var mascots = await client.query('SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Provider' ")  

    res.render('pages/services', {
        mascots: mascots["rows"]
    });
});

app.get('/cadastra/empresa', async (req, res) => { 

    res.render('partials/modalCreateEmpresa');
});

app.post('/cadastra/empresa', async (req, res) => { 

    const { 

        name, 
        password,
        cnpj,
        email
    
    } = await req.body

    const randonId = Math.floor(Math.random() * 99999)

    var start_date = moment().format('YYYY-MM-DD');
    var active = moment().format('YYYY-MM-DD');

    const queri3 = 'INSERT INTO "Email" (account_id, name, active, email) VALUES(' + randonId+","+ "'" + name +"'"+","+ "'" + "2023-01-01" +"'"+","+ "'" + email + "'" + ")"
    await client.query( queri3 )

    const query = 'INSERT INTO "Account"(id,name,password,cpf,cnpj,type_hair_id,start_date,birthday,active,avatar,"tipeAccount","account_id_Adress","account_id_Phone","account_id_Email","id_TypeAccount","id_Hair") VALUES('+randonId+","+"'"+name+"'"+","+"'"+password+"'"+","+null+","+cnpj+","+null+","+"'"+start_date+"'"+","+"'"+null+"'"+","+"'"+active+"'"+","+avatar+","+"'"+"Manager"+"'"+","+null+","+null+","+randonId+","+3+","+null+ ")"
    
    await client.query( query )

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

    const { name_client, name_provider, value, service, date_service} = req.body
    
    const randonId = Math.floor(Math.random() * 99999)
    const client_id = 1
    const id_account_service_provider = 1

    try{
        const queri = 'INSERT INTO "Service" (id, name_client, name_provider, client_id, value, service, id_account_service_provider, date_service) VALUES (' + randonId + "," + "'" + name_client + "'" + "," + "'" + name_provider + "'" + "," + "'" + client_id + "'" + "," + value + "," + "'" + service + "'" + "," + id_account_service_provider + "," + "'" + date_service + "'" + ')'
        await client.query( queri )
        res.render('partials/modalCreateServico');
    
    }catch(e) {
        console.log(e)
        res.status(500)

    }
    

});

app.get('/cadastra', async (req, res) => { 

    res.render('partials/modalCreate', {
        alerta: null
    });
});

app.post('/cadastra/user', async (req, res) => { 

    const { 

        name,
        email,
        password,
        cpf,
        type_hair_id,
        birthday
    
    } = await req.body

    const avatar = null
    const active = moment().format('YYYY-MM-DD');
    var start_date = moment().format('YYYY-MM-DD');

    const randonId = Math.floor(Math.random() * 99999)

    try{
        const queri1 = 'INSERT INTO "Adress" (account_id, city, neighborhood, road) VALUES('+ randonId +","+ "'" + "City A" + "'" +","+ "'" + "Neighborhood 1 "+"'"+","+ "'" + "Road 123" +"'" + ")"
        await client.query( queri1 )

        const queri2 = 'INSERT INTO "Phone" (account_id, phone, ddd, active, type) VALUES(' + randonId+","+ 123456789+","+ 11+","+ "'" + "2023-01-01" +"'" +","+ 1 +")"
        await client.query( queri2 )

        const queri3 = 'INSERT INTO "Email" (account_id, name, active, email) VALUES(' + randonId+","+ "'" + name +"'"+","+ "'" + "2023-01-01" +"'"+","+ "'" + email + "'" + ")"
        await client.query( queri3 )

        const query = 'INSERT INTO "Account"(id,name,password,cpf,cnpj,type_hair_id,start_date,birthday,active,avatar,"tipeAccount","account_id_Adress","account_id_Phone","account_id_Email","id_TypeAccount","id_Hair") VALUES('+randonId+","+"'"+name+"'"+","+"'"+password+"'"+","+cpf+","+null+","+type_hair_id+","+"'"+start_date+"'"+","+"'"+birthday+"'"+","+"'"+active+"'"+","+avatar+","+"'"+"Client"+"'"+","+randonId+","+randonId+","+randonId+","+1+","+type_hair_id+ ")"
        
        await client.query( query )

        const queryf = 'SELECT * FROM "Account" WHERE "tipeAccount" LIKE' + " 'Client' "

        mascots = await client.query( queryf )

        res.render('partials/index', {
            mascots: mascots["rows"]
        });
    }
    catch(erro){
        
        res.sendStatus( 500 )

    }
});

app.get('/nenhuma', async (req, res) => { 

    var mascots = await client.query('SELECT * FROM public."Account"')  

    res.render('pages/all', {
        mascots: mascots["rows"]
    });
});

app.get('/groupByTipoConta', async (req, res) => { 

    var mascots = await client.query('SELECT "tipeAccount", COUNT(id) AS total_clients FROM public."Account" GROUP BY "tipeAccount"  HAVING COUNT(id) > 1;')  

    res.render('pages/groupByTipoConta', {
        mascots: mascots["rows"]
    });

});

app.get('/joinLeft', async (req, res) => { 

    var mascots = await client.query('SELECT a.name AS client_name, e.email FROM public."Account" a LEFT JOIN public."Email" e ON a.id = e.account_id;')

    res.render('pages/joinLeft', {
        mascots: mascots["rows"]
    });
});

app.get('/joinRight', async (req, res) => { 

    var mascots = await client.query('SELECT e.email, a.name AS client_name FROM public."Email" e RIGHT JOIN public."Account" a ON e.account_id = a.id;')  

    res.render('pages/joinRight', {
        mascots: mascots["rows"]
    });
});

app.get('/rollup', async (req, res) => { 

    var mascots = await client.query('SELECT "tipeAccount", COUNT(id) AS total_accounts FROM public."Account" GROUP BY ROLLUP("tipeAccount");')  

    res.render('pages/rollup', {
        mascots: mascots["rows"]
    });
});

app.get('/funcoesAgregacao', async (req, res) => { 

    var mascots = await client.query('SELECT "TypeAccount".type, COUNT("Account".id) AS total_accounts, SUM("Purchase".amount_product) AS total_products_purchased, MIN("Purchase".value_product) AS min_purchase_value, MAX("Purchase".value_product) AS max_purchase_value FROM public."Account" JOIN public."TypeAccount" ON "Account"."id_TypeAccount" = "TypeAccount".id LEFT JOIN public."Purchase" ON "Account".id = "Purchase".id_account GROUP BY "TypeAccount".type;')  

    res.render('pages/funcoesAgregacao', {
        mascots: mascots["rows"]
    });
});

app.listen(8080);
console.log('Funcionando');