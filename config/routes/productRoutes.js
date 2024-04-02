import express from 'express'
import {
  getAllProducts,
  getProductsById,
  createProducts,
  updateProducts,
  deleteProducts
} from '../../src/api/v1/controllers/productControler.js'
import { validateParamsProduct } from '../../middlewares/validateParamsProduct.js'

const router = express.Router()

router.get('/products', getAllProducts)
router.get('/products/:id', getProductsById)
router.post('/products', validateParamsProduct, createProducts)
router.put('/products/:id', validateParamsProduct, updateProducts)
router.delete('/products/:id', deleteProducts)

export default router
