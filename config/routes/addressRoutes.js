import express from 'express'
import {
  getAllAddresses,
  addAddresses
} from '../../src/api/v1/controllers/addressController.js'

const router = express.Router()

router.get('/addresses/:user_id', getAllAddresses)
router.post('/addresses', addAddresses)

export default router
