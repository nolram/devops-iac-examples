import { Router, Request, Response } from 'express'

import { Container } from '../../types/core'
import { IUserService } from '../../types/user'

import { validatorMiddleware } from '../../middleware/validator'
import { insertUserSchema, getUserSchema } from '../schemas/user'

export class UserController {
  protected userService: IUserService

  constructor(container: Container) {
    this.userService = container.userService
  }

  register(router: Router): void {
    router.get(
      '/user',
      validatorMiddleware(getUserSchema),
      this.getUser.bind(this)
    )
    router.post(
      '/user',
      validatorMiddleware(insertUserSchema),
      this.insertUser.bind(this)
    )
  }

  async getUser(request: Request, response: Response): Promise<void> {
    try {
      const email = String(request.query.email)
      const userData = await this.userService.getUser(email)

      const exists = userData?.active ? true : false

      if (exists) {
        response.send(userData)
      } else {
        response.status(404).send()
      }
    } catch (err) {
      console.error(
        `<User.getUser> Finishing with error ErrorMessage[${err.message}]`
      )
      response.status(500).send()
    }
  }

  async insertUser(request: Request, response: Response): Promise<void> {
    try {
      const body = request.body
      const userData = await this.userService.insertUser(body)
      response.status(201).send(userData)
    } catch (err) {
      console.error(
        `<User.insertUser> Finishing with error ErrorMessage[${err.message}]`
      )
      response.status(500).send()
    }
  }
}
