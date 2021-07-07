import express from 'express'

import { HttpServer } from './http/index'
import { createContainer as createCoreContainer } from './core/container'

import { createContainer as createInfraContainer } from './infrastructure/container'

export class App {
  public app: express.Application

  constructor() {
    const infraContainer = createInfraContainer()

    const coreContainer = createCoreContainer(infraContainer)

    const httpServer = new HttpServer(coreContainer)
    this.app = httpServer.httpApp()
  }
}
