import { env } from './src/env'

export const dynamodbConfig = {
  region: env.region,
  endpoint: env.endpoint,
  apiVersion: env.apiVersion,
}

export const dynamodbTable = {
  tableName: env.tableName,
}
