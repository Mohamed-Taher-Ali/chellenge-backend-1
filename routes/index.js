const
  bodyParser = require('body-parser'),
  cors = require('cors'),
  
  products = require('./products'),
  productsProviders = require('./productsProviders'),
  {paginationMiddleWareV2} = require('../config/middleware')

  

module.exports = (app) => {
  app.use(cors());
  app.use(bodyParser.json());
  app.use(paginationMiddleWareV2);

  let routers = {
    products,
    productsProviders
  };

  for (var key in routers)
    app.use(`/api/${key}`, routers[key]);
};