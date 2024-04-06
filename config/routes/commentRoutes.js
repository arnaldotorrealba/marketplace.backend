import express from 'express'
import {
  getAllComments,
  addComments
} from '../../src/api/v1/controllers/commentController.js'

const router = express.Router()

router.get('/comments/:product_id', getAllComments)
router.post('/comments', addComments)

export default router
