import pool from '../../../../config/db/conectionDb.js'

const getCategories = async () => {
  const SQLquery = { text: 'SELECT * FROM categories ORDER BY id' }
  const { rows } = await pool.query(SQLquery)
  return rows
}

const createCategory = async ({ name }) => {
  const SQLquery = {
    text: 'INSERT INTO categories (name) VALUES ($1) RETURNING *',
    values: [name]
  }
  const { rows } = await pool.query(SQLquery)

  return rows[0]
}

export { getCategories, createCategory }
