const sql = require("./db.js");

// constructor
const Player = function(name, rating, email){
    this.name = name;
    this.Rating = rating;
    this.email = email;
}

Player.getAll = (name, result) => {
    let query = "SELECT * FROM Player P";

    if(name) {
        query += ` WHERE Name LIKE '%${name}%'`;
    }

    sql.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }

        console.log("Players: ", res);
        result(null, res);
    });
}

Player.Save = (name, rating, email, result) => {
    let query = `INSERT INTO Player (name, rating, email) VALUES ('${name}', ${rating}, '${email}')`;

    //if(this.name) {
    //    query += "UPDATE Player"
    //}
    //else
    //{
    //    query += "INSERT INTO Player "
    //}
    sql.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }

        console.log("Players: ", res);
        result(null, res);
    });
}


module.exports = Player;