const Player = require("../models/player.js");

exports.findAll = (req, res) => {
    const name = req.params.name
    console.log(name)

    Player.getAll(name, (err,data) =>{
        if(err)
            res.status(500).send({
                message:
                    err.message || "some error bro"
            });
        else res.send(data);
    });
};

exports.Save = (req, res) =>{
    const id = req.params.id
}
