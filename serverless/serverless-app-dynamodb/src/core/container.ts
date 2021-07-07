import { UserService } from './services/user'
import { ContainerConfig, Container } from '../types/core'

export function createContainer(config: ContainerConfig): Container {
  const serviceContext = {
    userRepository: config.userRepository,
  }

  return {
    userService: new UserService(serviceContext),
  }
}
