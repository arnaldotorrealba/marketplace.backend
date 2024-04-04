import { getLikes } from '../models/likeModel.js'
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

export { getAllLikes }
