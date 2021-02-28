const
router = require('express').Router(),
{routerWrapper} = require('../config/helper'),
{getProducts} = require('../controlers/products');


/*
example::
http://localhost:5000/api/products?catId=19&page=2
notice:: i made return count equal 2 because of no much set data
*/

router.get('/', routerWrapper(getProducts, 'query.catId', 'paggination.limit', 'paggination.offset'))


module.exports = router;