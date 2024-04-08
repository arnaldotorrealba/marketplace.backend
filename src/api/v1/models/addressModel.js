import pool from '../../../../config/db/conectionDb.js'

const getAddresses = async user_id => {
  const SQLquery = {
    text: 'SELECT addresses.* FROM addresses INNER JOIN users ON users.id = addresses.user_id WHERE addresses.user_id = $1',
    values: [user_id]
  }
  const { rows } = await pool.query(SQLquery)

  return rows
}

const addAddress = async ({
  user_id,
  street,
  city,
  state,
  country,
  postal_code
}) => {
  const SQLquery = {
    text: 'INSERT INTO addresses (user_id, street, city, state, country, postal_code) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
    values: [user_id, street, city, state, country, postal_code]
  }
  const { rows } = await pool.query(SQLquery)
  return rows[0]
}

export { getAddresses, addAddress }
