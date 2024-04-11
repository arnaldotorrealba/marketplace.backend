import pool from '../../../../config/db/conectionDb.js'

const getComments = async product_id => {
  const SQLquery = {
    text: 'SELECT comments.* FROM comments INNER JOIN products ON products.id = comments.product_id WHERE products.id = $1',
    values: [product_id]
  }
  const { rows } = await pool.query(SQLquery)

  return rows
}

const addComment = async ({ user_id, product_id, comment }) => {
  const SQLquery = {
    text: 'INSERT INTO comments (user_id, product_id, comment) VALUES ($1, $2, $3) RETURNING *',
    values: [user_id, product_id, comment]
  }
  const { rows } = await pool.query(SQLquery)
  return rows[0]
}

export { getComments, addComment }
