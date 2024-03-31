import express from 'express'
import { createProducts } from '../../src/api/v1/controllers/productControler.js'
import { validateParamsProduct } from '../../middlewares/validateParamsProduct.js'

const router = express.Router()

router.post('/products', validateParamsProduct, createProducts)

export default router
