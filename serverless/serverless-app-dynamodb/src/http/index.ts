import express from 'express'

import { Container } from '../types/core'
import { UserController } from './controllers/user'

export class HttpServer {
  private readonly container: Container
  private readonly controllers: any[]

  constructor(container: Container) {
    this.container = container
    this.controllers = [new UserController(this.container)]
  }

  httpApp(): express.Application {
    const app = express()
    app.use(express.json({ limit: '10mb' }))

    this.controllers.forEach((route: any) => {
      const router = express.Router()
      route.register(router)
      app.use(router)
    })

    return app
  }
}
