import database from '../database'
import { DynamoDB } from 'aws-sdk'

import { dynamodbTable } from '../../../dbconfig'

import { IDynamodbAdapter } from '../../types/infrastructure'

export class DynamodbAdapter implements IDynamodbAdapter {
  private table: string
  private database: DynamoDB.DocumentClient

  constructor() {
    this.database = database()
    this.table = dynamodbTable.tableName
  }

  get db(): DynamoDB.DocumentClient {
    return this.database
  }

  get tableName(): string {
    return this.table
  }
}
