const {isNumber} = require('./helper');

exports.paginationMiddleWareV2 = (req, res, next) => {
  let { page } = req.query;
  
  page = isNumber(page, 1)

  let limit = 2,
      offset = (page - 1) * limit;

  req.paggination = {
    offset,
    limit
  };

  next();
};

//deprecated
exports.paginationMiddleWareV1 = (apiFunction)=> {

  return async(req, res, next) => {

      let arr = await apiFunction()
  
      let { page=1, pageSize= 2 } = req.query,
          limit = pageSize,
          offset = (parseInt(page) - 1) * limit;

    if (!Array.isArray(arr))
      return res.status(500).send("response is not array !");
    else res.send(arr.splice(offset, limit));
  }

}