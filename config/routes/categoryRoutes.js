import express from 'express'
import {
  getAllCategories,
  createCategories,
  updateCategories,
  deleteCategories
} from '../../src/api/v1/controllers/categoryController.js'

const router = express.Router()

router.get('/categories', getAllCategories)
router.post('/categories', createCategories)
router.put('/categories/:id', updateCategories)
router.delete('/categories/:id', deleteCategories)

export default router
