import { getComments, addComment } from '../models/commentModel.js'
import { findError } from '../utils/utils.js'

const getAllComments = async (req, res) => {
  try {
    const { product_id } = req.params
    const comments = await getComments(product_id)
    res.status(200).json(comments)
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los comentarios' })
  }
}

const addComments = async (req, res) => {
  try {
    const Comment = req.body
    const newComment = await addComment(Comment)
    res.status(201).json({ comment: newComment })
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al crear el comentario' })
  }
}

export { getAllComments, addComments }
