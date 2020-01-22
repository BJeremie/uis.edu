/*jshint esversion: 6 */

const express = require('express');
const app = express();

const bodyParser = require('body-parser');
const NodeCouchDb = require('node-couchdb');


/**
 * Express Validator 
 */

const { check } = require('express-validator');

// const expressValidator = require('express-validator');
// app.use(expressValidator());

//const methodOverride = require('method-override');

const flash = require('express-flash');
const cookieParser = require('cookie-parser');
const session = require('express-session');
app.use(cookieParser('keyboard cat'));
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 }
}));
app.use(flash());


const couch = new NodeCouchDb({
    auth: {
        user: 'admin',
        password: 'password'
    }

});

const dbName = 'customers';
const viewUrl = '_design/all_customers/_view/all';


couch.listDatabases().then(function(dbs) {
    console.log(dbs);

});

const path = require('path');

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/', function(req, res) {
    couch.get(dbName, viewUrl).then(
        function(data, headers, status) {
            console.log(data.data.rows);
            res.render('index', {
                customers: data.data.rows
            });
        },
        function(err) {
            res.send(err);
        });
});

app.post('/reviewed/add', [
    // username must be an email
    check('email').isEmail(), check('name').notEmpty()
], function(req, res) {
    const name = req.body.name;
    const email = req.body.email;
    const food = req.body.foodType;
    const phone = req.body.phone;
    const website = req.body.website;

    couch.uniqid().then(function(ids) {
        const id = ids[0];
        couch.insert('customers', {
            _id: id,
            name: name,
            email: email,
            food: food,
            phone: phone,
            website: website
        }).then(
            function(data, headers, status) {
                res.redirect('/');
            },
            function(err) {
                res.send(err);
            }
        );
    });


});

app.post('/newUpdate', function(req, res) {

    const id = req.params.id;
    const rev = req.body.rev;
    const name = req.body.name;
    const email = req.body.email;
    const food = req.body.foodType;
    const phone = req.body.phone;
    const website = req.body.website;

    couch.uniqid().then(function(ids) {
        const id = ids[0];
        couch.insert('customers', {
            _id: id,
            name: name,
            email: email,
            food: food,
            phone: phone,
            website: website
        }).then(
            function(data, headers, status) {
                res.redirect('/');
            },
            function(err) {
                res.send(err);
            }
        );
    });


});


app.post('/reviewed/delete/:id', function(req, res) {
    const id = req.params.id;
    const rev = req.body.rev;

    console.log(rev + " Get Rev doc id");

    couch.del(dbName, id, rev).then(
        function(data, headers, status) {
            res.redirect('/');
        },
        function(err) {
            res.send(err);
        });

});


app.get('/', function(req, res) {
    res.render('index');
});

app.get('/edit/:id', (req, res) => {

    var ids = req.params.id;
    const rev = req.body.rev;

    console.log(ids);
    console.log(rev);
    console.log('Edit Data Test big' + rev);
    couch.get(dbName, ids, rev).then(
        function(data, headers, status) {
            console.log(data.data, +'FROM DB');
            console.log('Edit Data Test');
            res.render('edit', {
                customers: data.data
            });
        },
        function(err) {
            res.send(err);
        });

});

app.listen(8000, function() {
    console.log('Server started On Port 8000');
});