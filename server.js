import express from 'express'
import cors from 'cors'
import 'dotenv/config'
import loginRouter from './config/routes/loginRoutes.js'
import userRouter from './config/routes/userRoutes.js'
import productRouter from './config/routes/productRoutes.js'
import categoryRouter from './config/routes/categoryRoutes.js'
import likeRoutes from './config/routes/likeRoutes.js'
import commentRoutes from './config/routes/commentRoutes.js'
import orderRoutes from './config/routes/orderRoutes.js'

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())
app.use(cors())
app.use(loginRouter)
app.use(userRouter)
app.use(productRouter)
app.use(categoryRouter)
app.use(likeRoutes)
app.use(commentRoutes)
app.use(orderRoutes)

app.listen(PORT, console.log(`¡Servidor encendido en el puerto! ${PORT}`))
