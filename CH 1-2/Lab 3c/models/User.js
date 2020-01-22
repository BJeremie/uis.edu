/*jshint esversion: 6 */

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var UserSchema = new Schema({

    name: {
        type: String,
        require: true
    },

    email: {
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
        name: user.name,
        email: user.email
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