const validateParamsProduct = (req, res, next) => {
  const product = req.body
  if (
    !product.name ||
    !product.description ||
    !product.price ||
    !product.stock_quantity
  ) {
    return res.status(400).json({
      error: 'name, description, price and stock_quantity are necessary'
    })
  }
  next()
}

export { validateParamsProduct }
