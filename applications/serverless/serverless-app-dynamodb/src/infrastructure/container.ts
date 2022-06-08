import { UserRepository } from './repository/user'

import { DynamodbAdapter } from './adapter/dynamodb'

import { Container } from '../types/infrastructure'

export function createContainer(): Container {
  return {
    userRepository: new UserRepository({
      dynamodbAdapter: new DynamodbAdapter(),
    }),
  }
}
