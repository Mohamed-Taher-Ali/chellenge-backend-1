
exports.queryGetProducts = (catId, limit, offset) => {
  return (`
    select categories.name catName, products.name productName,
    providers.name providerName, MIN(product_provider.price) productPrice,
    product_provider.featured
    from product_provider
    JOIN products ON products.id = product_provider.product_id
    JOIN providers ON providers.id = product_provider.provider_id
    JOIN categories ON categories.id = products.category_id
    where
    categories.id = ${catId}
    and product_provider.available = 1
    GROUP by products.name
    order by
    product_provider.featured desc,
    product_provider.price
    limit ${limit}
    offset ${offset}
  `);
};

exports.queryUpdateFeatured = (condition) => {
  return (`
        update product_provider 
        set featured = 
        (1- (
            select featured
            from product_provider
            where ${condition}
            ))
        where ${condition}
    `);
}

exports.queryGetFeatured = (condition) => {
  return (`
  select featured
  from product_provider
  where ${condition}
`);
}