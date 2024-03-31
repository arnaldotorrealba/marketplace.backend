const validateParametersUser = (req, res, next) => {
  const user = req.body
  if (
    !user.username ||
    !user.name ||
    !user.lastname ||
    !user.email ||
    !user.password
  ) {
    return res.status(400).json({
      error: 'username, name, lastname, email and password are necessary'
    })
  }
  next()
}

export { validateParametersUser }
