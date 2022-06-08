import { IUserService, User, UserResponse } from '../../types/user'

import { ServiceContext } from '../../types/core'

export class UserService implements IUserService {
  private userRepository: ServiceContext['userRepository']

  constructor(ctx: ServiceContext) {
    this.userRepository = ctx.userRepository
  }

  async insertUser(user: User): Promise<void> {
    const userD: User = {
      createdAt: new Date().toISOString(),
      modifiedAt: new Date().toISOString(),
      active: true,
      ...user,
    }
    return this.userRepository.insert(userD)
  }

  async getUser(email: string): Promise<UserResponse> {
    const user = await this.userRepository.get(email)
    return user
  }
}
