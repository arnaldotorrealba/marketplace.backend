import { createProduct } from '../models/productModel.js'
import { findError } from '../utils/utils.js'

const createProducts = async (req, res) => {
  try {
    const product = req.body
    const newProduct = await createProduct(product)
    res.status(201).json({ product: newProduct })
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al crear el producto' })
  }
}

export { createProducts }
