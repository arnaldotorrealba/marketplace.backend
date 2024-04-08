import { getUserOrders } from '../models/orderModel.js'
import { findError } from '../utils/utils.js'

const getOrders = async (req, res) => {
  try {
    const { user_id } = req.params
    const AllOrders = await getUserOrders(user_id)
    res.status(200).json({ orders: AllOrders })
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los comentarios' })
  }
}

export { getOrders }
