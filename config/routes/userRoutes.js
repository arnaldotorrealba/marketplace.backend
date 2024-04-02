import express from 'express'
import {
  getAllUsers,
  getUsersByEmail,
  updateUsersByEmail,
  createUsers
} from '../../src/api/v1/controllers/userControler.js'
import { isLogin } from '../../middlewares/isLogin.js'
import { validateParamsUser } from '../../middlewares/validateParamsUser.js'

const router = express.Router()

router.get('/users', isLogin, getAllUsers) // admin - superadmin
router.get('/user', isLogin, getUsersByEmail) // logged in user detail
router.put('/users', isLogin, updateUsersByEmail) // logged in user update
router.post('/users', validateParamsUser, createUsers)

export default router
