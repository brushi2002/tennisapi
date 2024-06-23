const express = require('express');

function PlayerRoutes(Player){
    const playerRouter = express.Router();
    playerRouter.get('/', Player.findAll);
    playerRouter.get('/:email', Player.findAll);
    playerRouter.post('/', Player.Save);

    return playerRouter;
}

module.exports = PlayerRoutes;