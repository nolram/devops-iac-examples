import { Request, Response, NextFunction } from 'express'
import { AnySchema } from 'yup'

export const validatorMiddleware =
  (schema: AnySchema) =>
  (req: Request, res: Response, next: NextFunction): void => {
    try {
      schema.validateSync(req, {
        abortEarly: false,
        strict: true,
      })
      next()
    } catch (err) {
      const schemaErrors = err.inner.reduce((acc: any[], curr: any) => {
        const idx = acc.findIndex(idx => idx.field === curr.path)
        if (idx === -1) {
          acc.push({
            field: curr.path,
            type: curr.type,
          })
        } else {
          acc[idx].type += `, ${curr.type}`
        }
        return acc
      }, [])

      res.status(422).send({
        errors: schemaErrors,
      })
    }
  }
