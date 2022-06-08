import { DynamoDB } from 'aws-sdk'

import { dynamodbConfig } from '../../dbconfig'

let database: DynamoDB.DocumentClient

export default function databaseInstance(): DynamoDB.DocumentClient {
  if (!database) {
    database = new DynamoDB.DocumentClient(dynamodbConfig)
  }
  return database
}
