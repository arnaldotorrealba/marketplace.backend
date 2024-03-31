import express from 'express'
import { createUsers } from '../../src/api/v1/controllers/userControler.js'
import { validateParamsUser } from '../../middlewares/validateParamsUser.js'
// import { isLogin } from '../../middlewares/isLogin.js'

const router = express.Router()

router.post('/users', validateParamsUser, createUsers)
// router.get('/usuarios', isLogin, getUsers)

export default router
