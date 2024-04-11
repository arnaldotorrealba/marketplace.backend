import pool from '../../../../config/db/conectionDb.js'
import { getProductById } from './productModel.js'

const getUserOrders = async user_id => {
  const SQLQuery = {
    text: `
      SELECT 
        orders.*, 
        json_agg(
          json_build_object(
            'id', products.id,
            'name', products.name,
            'description', products.description,
            'price', products.price,
            'quantity', order_products.quantity
          )
        ) AS products
      FROM orders
      JOIN order_products ON orders.id = order_products.order_id
      JOIN products ON order_products.product_id = products.id
      WHERE orders.user_id = $1
      GROUP BY orders.id
    `,
    values: [user_id]
  }

  const { rows } = await pool.query(SQLQuery)
  return rows
}

const createOrder = async ({
  user_id,
  address_id,
  total_quantity,
  total_amount,
  cart_products
}) => {
  const SQLquery = {
    text: 'INSERT INTO orders (user_id, address_id, total_quantity, total_amount) VALUES ($1, $2, $3, $4) RETURNING *',
    values: [user_id, address_id, total_quantity, total_amount]
  }
  const { rows } = await pool.query(SQLquery)
  const order_id = rows[0].id

  const addedProducts = await addProducts(order_id, cart_products)

  return { ...rows[0], products: addedProducts }
}

const addProducts = async (order_id, cart_products) => {
  const addedProducts = []
  for (const cartProduct of cart_products) {
    const product = await getProductById(cartProduct.product_id)
    const subtotal = product.price * cartProduct.quantity

    const addOrderProductsQuery = {
      text: 'INSERT INTO order_products (order_id, product_id, quantity, subtotal) VALUES ($1, $2, $3, $4) RETURNING *',
      values: [order_id, product.id, cartProduct.quantity, subtotal]
    }
    await pool.query(addOrderProductsQuery)
    addedProducts.push(product)
  }
  return addedProducts
}

export { getUserOrders, createOrder }
