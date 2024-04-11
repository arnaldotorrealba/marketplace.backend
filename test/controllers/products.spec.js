import request from 'supertest'
import app from '../../server.js'
import { faker } from '@faker-js/faker'
import { createProduct } from '../../src/api/v1/models/productModel.js'

describe('products controller', () => {
  let existingProductId

  describe('GET /products', () => {
    it('response with status code 200', async () => {
      const response = await request(app).get('/products')
      expect(response.statusCode).toBe(200)
    })

    it('is instance of array', async () => {
      const response = await request(app).get('/products')
      const products = response.body
      expect(products).toBeInstanceOf(Array)
    })
  })

  describe('POST /products create products with valid params', () => {
    const payload = {
      user_id: 1,
      name: faker.commerce.productName(),
      description: faker.commerce.productDescription(),
      price: faker.commerce.price(),
      stock_quantity: faker.number.int({ max: 100 }),
      img_url: 'smartwatch_fitness_pro.jpg',
      categories: ['Otros']
    }

    it('response with status code 201', async () => {
      const response = await request(app).post('/products').send(payload)
      expect(response.statusCode).toBe(201)
    })

    it('returns a product property', async () => {
      const response = await request(app).post('/products').send(payload)
      expect(response.body).toHaveProperty('product')
    })

    it('returns an instance of object', async () => {
      const response = await request(app).post('/products').send(payload)
      const { product } = response.body
      expect(product).toBeInstanceOf(Object)
    })
  })

  describe('POST /products create products with missing params', () => {
    const payload = {
      name: faker.commerce.productName(),
      description: faker.commerce.productDescription(),
      stock_quantity: faker.number.int({ max: 100 }),
      img_url: 'smartwatch_fitness_pro.jpg',
      categories: ['Otros']
    }

    it('returns a 400 status code with missing price param', async () => {
      const response = await request(app).post('/products').send(payload)
      expect(response.statusCode).toBe(400)
    })

    it('returns a message', async () => {
      const response = await request(app).post('/products').send(payload)
      expect(response.body.error).toBe(
        'user_id, name, description, price and stock_quantity are necessary'
      )
    })
  })

  describe('PUT /products/:id update products with valid params', () => {
    beforeEach(async () => {
      const payload = {
        user_id: 1,
        name: faker.commerce.productName(),
        description: faker.commerce.productDescription(),
        price: faker.commerce.price(),
        stock_quantity: faker.number.int({ max: 100 }),
        img_url: 'smartwatch_fitness_pro.jpg',
        categories: ['Otros']
      }
      const product = await createProduct(payload)
      existingProductId = product.id
    })
    const data = {
      user_id: 1,
      name: faker.commerce.productName(),
      description: faker.commerce.productDescription(),
      price: faker.commerce.price(),
      stock_quantity: faker.number.int({ max: 100 }),
      img_url: 'Editsmartwatch_fitness_pro.jpg',
      categories: ['Otros']
    }
    it('response with status code 200', async () => {
      const response = await request(app)
        .put(`/products/${existingProductId}`)
        .send(data)
      expect(response.statusCode).toBe(200)
    })

    it('returns a product property', async () => {
      const response = await request(app)
        .put(`/products/${existingProductId}`)
        .send(data)
      expect(response.body).toHaveProperty('product')
    })

    it('returns a instance of object', async () => {
      const response = await request(app)
        .put(`/products/${existingProductId}`)
        .send(data)
      const { product } = response.body
      expect(product).toBeInstanceOf(Object)
    })

    it('returns an object with id eq existingTravelId', async () => {
      const response = await request(app)
        .put(`/products/${existingProductId}`)
        .send(data)
      const { product } = response.body
      expect(product.id).toEqual(existingProductId)
    })
  })

  describe('DELETE /products/:i delete products', () => {
    it('returns a 200 status code with valid existing id', async () => {
      const response = await request(app).delete(
        `/products/${existingProductId}`
      )
      expect(response.statusCode).toBe(200)
    })

    it('returns a message with no valid id', async () => {
      const response = await request(app).delete(
        `/products/${existingProductId}` // producto fue eliminado en el test anterior
      )
      expect(response.body.error).toBe(
        'No se encontró ningún registro con ese ID'
      )
    })
  })
})
