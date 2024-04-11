import pool from '../../../../config/db/conectionDb'

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

const deleteLike = async (user_id, product_id) => {
  const SQLQuery = {
    text: 'DELETE FROM likes WHERE user_id = $1 AND product_id = $2',
    values: [user_id, product_id]
  }

  const response = await pool.query(SQLQuery)

  if (response.rowCount === 0) {
    throw { code: 'invalidID' }
  }
}

export { getLikes, addLike, deleteLike }
