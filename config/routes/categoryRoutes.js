import express from 'express'
import { getAllCategories } from '../../src/api/v1/controllers/categoryController.js'

const router = express.Router()

router.get('/categories', getAllCategories)

export default router
