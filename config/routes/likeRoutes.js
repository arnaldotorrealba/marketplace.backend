import express from 'express'
import { getAllLikes } from '../../src/api/v1/controllers/likeController.js'

const router = express.Router()

router.get('/likes/:user_id', getAllLikes)

export default router
