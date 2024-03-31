import pool from '../../../../config/db/conectionDb.js'
import bcrypt from 'bcryptjs'

const getUsers = async () => {
  const SQLquery = { text: 'SELECT * FROM users ORDER BY id' }
  const { rows } = await pool.query(SQLquery)
  return rows
}

const createUser = async ({
  username,
  name,
  lastname,
  phonenumber,
  email,
  password
}) => {
  const hashedPassword = bcrypt.hashSync(password)
  const SQLquery = {
    text: 'INSERT INTO users (username, name, lastname, phonenumber, email, password) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
    values: [username, name, lastname, phonenumber, email, hashedPassword]
  }
  const { rows } = await pool.query(SQLquery)
  return rows[0]
}

export { getUsers, createUser }
