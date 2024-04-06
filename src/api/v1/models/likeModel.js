import pool from '../../../../config/db/conectionDb.js'

const getLikes = async user_id => {
  const SQLquery = {
    text: 'SELECT products.* FROM products INNER JOIN likes ON products.id = likes.product_id WHERE likes.user_id = $1',
    values: [user_id]
  }
  const { rows } = await pool.query(SQLquery)

  return rows
}

const addLike = async (user_id, product_id) => {
  const SQLquery = {
    text: 'INSERT INTO likes (user_id, product_id) VALUES ($1, $2) RETURNING *',
    values: [user_id, product_id]
  }
  const { rows } = await pool.query(SQLquery)
  return rows[0]
}

export { getLikes, addLike }
