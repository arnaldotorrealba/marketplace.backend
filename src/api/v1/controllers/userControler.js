import { createUser, getUsers } from '../models/userModel.js'
import { findError } from '../utils/utils.js'

const getAllUsers = async (req, res) => {
  try {
    const users = await getUsers()
    res.status(200).json(users)
  } catch (error) {
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al mostrar los usuarios' })
  }
}

const createUsers = async (req, res) => {
  try {
    const user = req.body
    const newUser = await createUser(user)
    res.status(201).json({ user: newUser })
  } catch (error) {
    console.log(error)
    const errorFound = findError(error.code)
    return errorFound.length
      ? res.status(errorFound[0].status).json({ error: errorFound[0].message })
      : res.status(500).json({ error: 'Error al crear el usuario' })
  }
}

export { getAllUsers, createUsers }
