import express from 'express'
import {
  getAllProducts,
  getProductsById,
  getProductsByUserId,
  getSelledProductsByUserId,
  getProductsByCategory,
  createProducts,
  updateProducts,
  deleteProducts
} from '../../src/api/v1/controllers/productControler.js'
import { validateParamsProduct } from '../../middlewares/validateParamsProduct.js'

const router = express.Router()

router.get('/products', getAllProducts)
router.get('/product/:id', getProductsById)
router.get('/product-by-user/:user_id', getProductsByUserId)
router.get('/selled-products-by-user/:user_id', getSelledProductsByUserId)
router.get('/products/:category', getProductsByCategory)
router.post('/products', validateParamsProduct, createProducts)
router.put('/products/:id', validateParamsProduct, updateProducts)
router.delete('/products/:id', deleteProducts)

export default router
