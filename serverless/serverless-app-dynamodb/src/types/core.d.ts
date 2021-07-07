import { Container as infraContainer } from './infrastructure'
import { IUserService } from './user'

export type Container = {
  userService: IUserService
}

export type ContainerConfig = {
  userRepository: infraContainer['userRepository']
}

export type ServiceContext = {
  userRepository: ContainerConfig['userRepository']
}
