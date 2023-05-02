const sql = require("./db.js");

// constructor
const Player = function(player){
    this.ID = player.ID
    this.name = player.name;
    this.Rating = player.Rating;
}

Player.getAll = (name, result) => {
    let query = "SELECT * FROM Player";

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

Player.Save = ()


module.exports = Player;