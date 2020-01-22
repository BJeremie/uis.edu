/*jshint esversion: 6 */

const express = require('express');
const app = express();

const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const path = require('path');

//var users = require('./routes/users');

var db = 'mongodb://localhost/take1';
mongoose.connect(db);



// User Model 

var Blog = require('./models/Blog');
app.set("view engine", "ejs");
app.set("views", __dirname + "/views");
app.set("view options", { layout: false });
app.use(bodyParser.json());

//app.use('/users', users);

app.use(bodyParser.urlencoded({ extended: true }));
// Global vars

app.use(function(req, res, next) {
    res.locals.errors = null;
    next();
});


// API ROUTES 
// Show 
app.get('/', (req, res) => {

    Blog.getUsers(function(err, users) {
        if (err) {
            throw err;
        }
        console.log(JSON.stringify(users));
        res.render('index.ejs', { users: users });

    });
});

// STORE
app.post('/users', (req, res) => {
    console.log('Add user');
    var user = req.body;
    Blog.addUser(user, (err, user) => {
        if (err) {
            throw err;
        }
        res.json(user);
    });
    // res.sendStatus(200);
    res.redirect('/');

    console.log('ADD USER TO DB');

});

// EDIT

app.get('/users/:_id', (req, res) => {
    var id = req.params._id;
    console.log("USER ID" + id);
    Blog.removeUser(id, (err, user) => {
        if (err) {
            throw err;
        }
        res.redirect('/');
    });
});


// app.get('/edit/:_id', (req, res) => {
//     console.log('TEST 123');
// });

app.get('/userBy/:_id', (req, res) => {
    Blog.getUserById(req.params._id, (err, posts) => {
        if (err) {
            throw err;
        }
        // res.render('edit.ejs', { users: users });
        res.render('edit.ejs', {
            title: 'Edit User',
            id: posts._id,
            titles: posts.titles,
            body: posts.body,
            slugs: posts.slugs,
            author: posts.author,
            comments: posts.comments,
            categories: posts.categories

            // titles: user.titles,
            // body: user.body,
            // slugs: user.slugs,
            // author: user.author,
            // comments: user.comments,
            // categories: user.categories

        });

        console.log('Test' + posts);
        // res.json(user);
    });
});

app.post('/edit/:_id', (req, res) => {
    var id = req.params._id;
    var user = req.body;
    Blog.updateUser(id, user, {}, (err, user) => {
        if (err) {
            throw err;
        }

        res.redirect('/');
        //res.json(user);
    });
});

app.listen(8000);
console.log('listening on port 8000...');