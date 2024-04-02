import { getCategories } from '../models/categoryModel.js'
import { findError } from '../utils/utils.js'

const getAllCategories = async (req, res) => {
  try {
    const categories = await getCategories()
    res.status(200).json(categories)
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los productos' })
  }
}

export { getAllCategories }
