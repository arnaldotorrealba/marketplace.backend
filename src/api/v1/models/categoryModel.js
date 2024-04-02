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

const updateCategory = async (id, { name }) => {
  const SQLquery = {
    text: 'UPDATE categories SET name = $2 WHERE id = $1 RETURNING *',
    values: [id, name]
  }

  const { rows } = await pool.query(SQLquery)

  if (rows.length === 0) {
    throw new Error('Category not found')
  }

  return rows[0]
}

export { getCategories, createCategory, updateCategory }
