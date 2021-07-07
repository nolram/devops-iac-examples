import { IUserRepository, User, UserResponse } from '../../types/user'
import { IDynamodbAdapter } from '../../types/infrastructure'
import { env } from 'src/env'

type Context = {
  dynamodbAdapter: IDynamodbAdapter
}

export class UserRepository implements IUserRepository {
  private dynamodbAdapter: Context['dynamodbAdapter']

  constructor({ dynamodbAdapter }: Context) {
    this.dynamodbAdapter = dynamodbAdapter
  }
  async insert(user: User): Promise<void> {
    await this.dynamodbAdapter.db
      .put({
        TableName: env.tableName,
        Item: {
          pk: 'USER',
          sk: `USER#${user.email}`,
          data: user.email,
          ...user,
        },
      })
      .promise()
  }

  async get(email: string): Promise<UserResponse> {
    const dados = await this.dynamodbAdapter.db
      .get({
        TableName: env.tableName,
        Key: {
          pk: 'USER',
          sk: `USER#${email}`,
        },
      })
      .promise()

    const user: UserResponse = {
      name: dados.Item?.name,
      email: dados.Item?.email,
      active: dados.Item?.active,
      createdAt: dados.Item?.createdAt,
      modifiedAt: dados.Item?.modifiedAt,
    }

    return user
  }
}
