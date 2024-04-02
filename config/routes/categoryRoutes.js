import express from 'express'
import {
  getAllCategories,
  createCategories,
  updateCategories
} from '../../src/api/v1/controllers/categoryController.js'

const router = express.Router()

router.get('/categories', getAllCategories)
router.post('/categories', createCategories)
router.put('/categories/:id', updateCategories)

export default router
