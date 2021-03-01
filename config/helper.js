exports.isNumber = (num, rep = 0) => parseInt(!isNaN(num) ? num : rep);

exports.routerWrapper = (controller, ...args) => {

  return async (req, res) => {
    let values = args.map((arg) => (
      (arg || '').split('.').reduce((acc, val) => acc[val], req)
    ));

    try {
      let fireController = await controller(...values);
      res.status(200).send(fireController);
    } catch (err) {
      res.status(400).send(err);
    }
  };
}
