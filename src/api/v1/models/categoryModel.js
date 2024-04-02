import pool from '../../../../config/db/conectionDb.js'

const getCategories = async () => {
  const SQLquery = { text: 'SELECT * FROM categories ORDER BY id' }
  const { rows } = await pool.query(SQLquery)
  return rows
}

export { getCategories }
