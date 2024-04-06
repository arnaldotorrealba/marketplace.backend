import express from 'express'
import {
  getAllLikes,
  addlikes
} from '../../src/api/v1/controllers/likeController.js'

const router = express.Router()

router.get('/likes/:user_id', getAllLikes)
router.post('/likes/:user_id/:product_id', addlikes)

export default router
