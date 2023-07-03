const sql = require("./db.js");

const League = function(name, type, startdate, enddate){
    this.name = name;
    this.type = type;
    this.startdate = startdate;
    this.enddate = enddate;
}

League.getAll = (name, result) => {
    let query = "SELECT L.LeagueID,  " +
                    "L.Name, " +
                    "LT.TypeDescr, " +
                    "L.StartDate, " +
                    "L.EndDate, " +
                    "L.Active " +
                "FROM League L, LeagueType LT " +
                "WHERE L.TypeID = LT.TypeID ;"

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

module.exports = League;