const express = require('express');

function LeagueRoutes(League){
    const leageRouter = express.Router();
    leageRouter.get('/', League.findAll);
    //leageRouter.get('/:name', League.findAll);
    //leageRouter.post('/', League.Save);

    return leageRouter;
}

module.exports = LeagueRoutes;