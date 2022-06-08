// import * as dotenv from 'dotenv'
import { Env } from './types/env'

// dotenv.config()

export const env: Env = {
  region: process.env.REGION || 'us-east-1',
  endpoint:
    process.env.IS_OFFLINE || false
      ? 'http://localhost:8000'
      : process.env.DB_ENDPOINT,
  apiVersion: process.env.API_VERSION || '2012-08-10',
  tableName: process.env.TABLE_NAME || 'test-data-table-dev',
}
