// load the things we need
var { Client } = require('pg');
var express = require('express');
const app = express();

// set the view engine to ejs
app.set('view engine', 'ejs');

// Banco de dados
const client = new Client({
    host: 'ep-calm-fire-33130223.us-east-2.aws.neon.tech',
    port: 5432,
    database: 'BD1',
    user: 'ThiagoFreitasFreelancer',
    password: 'j5sa6dJLNBlK',
    ssl: {
        require: true
    },
    types: {
        options: 'project=ep-calm-fire-33130223'
    }
});

client.connect();
// use res.render to load up an ejs view file

// index page
app.get('/', function(req, res) {
    var mascots = [
        { name: 'Sammy', organization: "DigitalOcean", birth_year: 2012},
        { name: 'Tux', organization: "Linux", birth_year: 1996},
        { name: 'Moby Dock', organization: "Docker", birth_year: 2013}
    ];
    var tagline = "No programming concept is complete without a cute animal mascot.";

    res.render('pages/index', {
        mascots: mascots,
        tagline: tagline
    });
});

// about page
app.get('/about', function(req, res) {
    res.render('pages/about');
});



app.listen(8080);
console.log('8080 is the magic port');