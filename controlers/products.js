let connection = require('../config/db'),
    {queryGetProducts} = require('../config/queries');


exports.getProducts = async(catId, limit, offset) => {
    console.log({catId, limit, offset});
    let query = queryGetProducts(catId, limit, offset),
        res = await connection.query(query);

    return res.map(r=>({
        ...r,
        featured: Boolean(Number(r.featured))
    }));
}