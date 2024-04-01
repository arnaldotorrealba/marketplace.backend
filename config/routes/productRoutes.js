import express from 'express'
import {
  getAllProducts,
  getProductsById,
  createProducts
} from '../../src/api/v1/controllers/productControler.js'
import { validateParamsProduct } from '../../middlewares/validateParamsProduct.js'

const router = express.Router()

router.get('/products', getAllProducts)
router.get('/products/:id', getProductsById)
router.post('/products', validateParamsProduct, createProducts)

export default router
