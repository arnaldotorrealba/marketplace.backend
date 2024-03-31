import express from 'express'
import cors from 'cors'
import 'dotenv/config'
import loginRouter from './config/routes/loginRoutes.js'
// import { logger } from 'logger-express'

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())
app.use(cors())
app.use(loginRouter)
// app.use(logger())

app.listen(PORT, console.log(`¡Servidor encendido en el puerto! ${PORT}`))
