let connection = require('../config/db'),
    {queryUpdateFeatured, queryGetFeatured} = require('../config/queries');

exports.toggleFeatured = async (providerId, productId, id = false) => {
    let
        ret = false,
        cond = id ? `id = ${id}` :
            `provider_id=${providerId}
            and product_id=${productId}`;

    let
        queryUpd = queryUpdateFeatured(cond),
        res = await connection.query(queryUpd);

    if (res) {
        let queryGetFeat = queryGetFeatured(cond);
        ret = await connection.query(queryGetFeat);
        return { featured: Boolean(ret[0].featured) }
    }
    else return {error: true};
    
}