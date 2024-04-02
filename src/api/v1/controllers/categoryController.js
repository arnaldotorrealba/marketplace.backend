import {
  getCategories,
  createCategory,
  updateCategory,
  deleteCategory
} from '../models/categoryModel.js'
import { findError } from '../utils/utils.js'

const getAllCategories = async (req, res) => {
  try {
    const categories = await getCategories()
    res.status(200).json(categories)
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar las categorías' })
  }
}

const createCategories = async (req, res) => {
  try {
    const category = req.body
    const newCategory = await createCategory(category)
    res.status(201).json({ category: newCategory })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al crear la categoría' })
  }
}

const updateCategories = async (req, res) => {
  try {
    const { id } = req.params
    const category = req.body
    const newCategory = await updateCategory(id, category)
    res.status(200).json({ category: newCategory })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al actualizar la categoría' })
  }
}

const deleteCategories = async (req, res) => {
  try {
    const { id } = req.params
    await deleteCategory(id)
    res.status(200).json({ message: 'Categoría eliminada con éxito' })
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al eliminar la categoría' })
  }
}

export {
  getAllCategories,
  createCategories,
  updateCategories,
  deleteCategories
}
