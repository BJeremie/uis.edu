/*jshint esversion: 6 */

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var UserSchema = new Schema({

    titles: {
        type: String,
        require: true
    },

    body: {
        type: String,
        default: true
    },

    slugs: {
        type: String,
        default: true
    },
    author: {
        type: mongoose.Schema.Types.ObjectId,
        required: false
    },

    // Enable for production
    comments: { user_id: String, comment: String, approved: Boolean, date: { type: Date, default: new Date() } },
    // category: { user_id: String, name: String }
    // category: {
    //     type: String,
    //     default: true
    // },

    categories: {
        type: String,
        default: true
    }

});

const User = mongoose.model('User', UserSchema);
module.export = User;



// Get All Users  getUsers
module.exports.getUsers = (callback, limit) => {
    User.find(callback).limit();
}

// Get User by Id 
module.exports.getUserById = (id, callback) => {
    // User.findById(limit, (callback, limit) => {});



};

// Add User

module.exports.addUser = (users, user) => {
    User.create(users).then(function(user) {});
    console.log("Add new user");
};


module.exports.getUserById = (id, callback) => {
    User.findById(id, callback);
};

module.exports.updateUser = (id, user, options, callback) => {
    var query = { _id: id };
    var update = {
        titles: user.titles,
        body: user.body,
        slugs: user.slugs,
        author: user.author,
        comments: user.comments,
        categories: user.categories

    };
    User.findOneAndUpdate(query, update, options, callback);

    console.log("Update User Infos");

};

// // Remove User

module.exports.removeUser = (id, callback) => {
    // User.removeUser(callback).id();
    var query = { _id: id };
    User.remove(query, callback);
    console.log("Delete new user");

};