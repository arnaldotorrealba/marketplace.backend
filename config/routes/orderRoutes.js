import express from 'express'
import {
  getOrders,
  createOrders
} from '../../src/api/v1/controllers/orderController.js'

const router = express.Router()

router.get('/orders/:user_id', getOrders)
router.post('/orders', createOrders)

export default router
