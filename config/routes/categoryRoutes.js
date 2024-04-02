import express from 'express'
import {
  getAllCategories,
  createCategories
} from '../../src/api/v1/controllers/categoryController.js'

const router = express.Router()

router.get('/categories', getAllCategories)
router.post('/categories', createCategories)

export default router
