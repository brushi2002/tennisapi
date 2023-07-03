const League = require("../models/league.js");

exports.findAll = (req, res) => {
    const name = req.params.name
    console.log(name)

    League.getAll(name, (err,data) =>{
        if(err)
            res.status(500).send({
                message:
                    err.message || "some error bro"
            });
        else res.send(data);
    });
};

/*exports.Save = (req, res) => {
    
    const name = req.body.name
    const rating = req.body.rating
    const email = req.body.email
    //const Player = new Player(name, rating, email)
    Player.Save(name, rating, email, (err, data) => {
        if(err)
            res.status(500).send({
                message: 
                    err.message || "some Error Saving"
            });
        else
            res.send(data)
    })
}*/
