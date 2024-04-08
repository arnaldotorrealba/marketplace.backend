import { getAddresses, addAddress } from '../models/addressModel.js'
import { findError } from '../utils/utils.js'

const getAllAddresses = async (req, res) => {
  try {
    const { user_id } = req.params
    const addresses = await getAddresses(user_id)
    res.status(200).json({ addresses })
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar las direcciones' })
  }
}

const addAddresses = async (req, res) => {
  try {
    const address = req.body
    const newAddress = await addAddress(address)
    res.status(201).json({ address: newAddress })
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al crear la dirección' })
  }
}

export { getAllAddresses, addAddresses }
