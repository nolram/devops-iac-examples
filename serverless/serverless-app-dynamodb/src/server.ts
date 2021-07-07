import { App } from './app'

import serverless from 'serverless-http'

const expressApplication = new App()

export const handler = serverless(expressApplication.app)
