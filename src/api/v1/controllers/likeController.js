import { getLikes, addLike, deleteLike } from '../models/likeModel.js'
import { findError } from '../utils/utils.js'

const getAllLikes = async (req, res) => {
  try {
    const { user_id } = req.params
    const likes = await getLikes(user_id)
    res.status(200).json(likes)
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los likes' })
  }
}

const addlikes = async (req, res) => {
  try {
    const { user_id, product_id } = req.params
    const newLike = await addLike(user_id, product_id)
    res.status(201).json({ like: newLike })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al crear el like' })
  }
}

const deleteLikes = async (req, res) => {
  try {
    const { user_id, product_id } = req.params
    await deleteLike(user_id, product_id)
    res.status(200).json({ message: 'Like eliminado con éxito' })
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al eliminar el producto' })
  }
}

export { getAllLikes, addlikes, deleteLikes }
