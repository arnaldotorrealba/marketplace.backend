import express from 'express'
import { getOrders } from '../../src/api/v1/controllers/orderController.js'

const router = express.Router()

router.get('/orders/:user_id', getOrders)

export default router
