import {
  getProducts,
  getProductById,
  getProductByUserId,
  getSelledProductByUserId,
  getAllProductsByCategory,
  createProduct,
  updateProduct,
  deleteProduct
} from '../models/productModel.js'
import { findError } from '../utils/utils.js'

const getAllProducts = async (req, res) => {
  try {
    const products = await getProducts()
    res.status(200).json(products)
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los productos' })
  }
}

const getProductsById = async (req, res) => {
  try {
    const { id } = req.params
    const productById = await getProductById(id)
    res.status(200).json({ product: productById })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar el producto' })
  }
}

const getProductsByUserId = async (req, res) => {
  try {
    const { user_id } = req.params
    const productsByUserId = await getProductByUserId(user_id)
    res.status(200).json({ products: productsByUserId })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los productos' })
  }
}

const getSelledProductsByUserId = async (req, res) => {
  try {
    const { user_id } = req.params
    const selledProductsByUserId = await getSelledProductByUserId(user_id)
    res.status(200).json({ products: selledProductsByUserId })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los productos' })
  }
}

const getProductsByCategory = async (req, res) => {
  try {
    const { category } = req.params
    const productsByCategory = await getAllProductsByCategory(category)
    res.status(200).json({ products: productsByCategory })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar el producto' })
  }
}

const createProducts = async (req, res) => {
  try {
    const product = req.body
    const newProduct = await createProduct(product)
    res.status(201).json({ product: newProduct })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al crear el producto' })
  }
}

const updateProducts = async (req, res) => {
  try {
    const { id } = req.params
    const product = req.body
    const newProduct = await updateProduct(id, product)
    res.status(200).json({ product: newProduct })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al actualizar el producto' })
  }
}

const deleteProducts = async (req, res) => {
  try {
    const { id } = req.params
    await deleteProduct(id)
    res.status(200).json({ message: 'Producto Eliminado con éxito' })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al eliminar el producto' })
  }
}

export {
  getAllProducts,
  getProductsById,
  getProductsByUserId,
  getSelledProductsByUserId,
  getProductsByCategory,
  createProducts,
  updateProducts,
  deleteProducts
}
