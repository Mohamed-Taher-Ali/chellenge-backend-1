const
router = require('express').Router(),
{routerWrapper} = require('../config/helper'),
{toggleFeatured} = require('../controlers/productsProviders');

/*
example::
http://localhost:5000/api/productsProviders/toggleFeatured?providerId=6&productId=50
OR
http://localhost:5000/api/productsProviders/toggleFeatured/1
*/

router
.post('/toggleFeatured/:id', routerWrapper(toggleFeatured, null, null, 'params.id'))
.post('/toggleFeaturedByProvProd', routerWrapper(toggleFeatured, 'query.providerId', 'query.productId'))


module.exports = router;