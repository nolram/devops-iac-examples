import { DynamoDB } from 'aws-sdk'
import { IUserRepository } from './user'

export interface IDynamodbAdapter {
  db: DynamoDB.DocumentClient
  tableName: string
}

/* Infrastructure */
export type Container = {
  userRepository: IUserRepository
}
