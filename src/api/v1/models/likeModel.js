import pool from '../../../../config/db/conectionDb.js'

const getLikes = async user_id => {
  const SQLquery = {
    text: 'SELECT products.* FROM products INNER JOIN likes ON products.id = likes.product_id WHERE likes.user_id = $1',
    values: [user_id]
  }
  const { rows } = await pool.query(SQLquery)

  return rows
}

export { getLikes }
