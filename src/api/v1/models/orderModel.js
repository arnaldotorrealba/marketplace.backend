import pool from '../../../../config/db/conectionDb.js'

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

export { getUserOrders }
