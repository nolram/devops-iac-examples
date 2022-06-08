import * as yup from 'yup'

export const insertUserSchema = yup.object({
  body: yup.object().shape({
    email: yup.string().required(),
    name: yup.string().required(),
    active: yup.boolean().default(true),
    createdAt: yup.string().default(new Date().toISOString()),
    modifiedAt: yup.string().default(new Date().toISOString()),
  }),
})

export const getUserSchema = yup.object({
  query: yup.object({
    email: yup.string().required(),
  }),
})
