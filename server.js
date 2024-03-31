import express from 'express'
import cors from 'cors'
import 'dotenv/config'
import loginRouter from './config/routes/loginRoutes.js'
import userRouter from './config/routes/userRoutes.js'
import productRouter from './config/routes/productRoutes.js'

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())
app.use(cors())
app.use(loginRouter)
app.use(userRouter)
app.use(productRouter)

app.listen(PORT, console.log(`¡Servidor encendido en el puerto! ${PORT}`))
