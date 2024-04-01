import pool from '../../../../config/db/conectionDb.js'

const getProducts = async () => {
  const SQLquery = { text: 'SELECT * FROM products ORDER BY id' }
  const { rows } = await pool.query(SQLquery)
  return rows
}

const getProductById = async id => {
  const SQLquery = {
    text: 'SELECT * FROM products WHERE id = $1',
    values: [id]
  }
  const { rowCount, rows } = await pool.query(SQLquery)
  if (rowCount === 0) {
    throw { code: 'invalidID' }
  }
  return rows[0]
}

const createProduct = async ({
  name,
  description,
  price,
  stock_quantity,
  img_url,
  categories
}) => {
  const SQLquery = {
    text: 'INSERT INTO products (name, description, price, stock_quantity, img_url) VALUES ($1, $2, $3, $4, $5) RETURNING *',
    values: [name, description, price, stock_quantity, img_url]
  }
  const { rows } = await pool.query(SQLquery)
  const productId = rows[0].id

  const addedCategories = await addCategories(productId, categories)

  return { ...rows[0], categories: addedCategories }
}

const deleteProduct = async id => {
  const deleteProductCategoriesQuery = {
    text: 'DELETE FROM product_categories WHERE product_id = $1',
    values: [id]
  }
  await pool.query(deleteProductCategoriesQuery)

  const deleteProductQuery = {
    text: 'DELETE FROM products WHERE id = $1',
    values: [id]
  }
  const response = await pool.query(deleteProductQuery)

  if (response.rowCount === 0) {
    throw { code: 'invalidID' }
  }
}

const addCategories = async (productId, categories) => {
  const addedCategoriesNames = []
  for (const categoryName of categories) {
    const getCategoryIdQuery = {
      text: 'SELECT id FROM categories WHERE name = $1',
      values: [categoryName]
    }
    const { rows } = await pool.query(getCategoryIdQuery)

    if (rows.length === 0) {
      console.log(`"${categoryName}" category doesn't exist.`)
      continue
    }
    const categoryId = rows[0].id

    const addCategoryQuery = {
      text: 'INSERT INTO product_categories (product_id, category_id) VALUES ($1, $2) RETURNING *',
      values: [productId, categoryId]
    }
    await pool.query(addCategoryQuery)
    addedCategoriesNames.push(categoryName)
  }
  return addedCategoriesNames
}

export { getProducts, getProductById, createProduct, deleteProduct }
