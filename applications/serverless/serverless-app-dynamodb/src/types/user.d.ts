export type User = {
  name: string
  email: string
  active?: boolean
  createdAt: Date
  modifiedAt: Date
}

export type UserResponse = {
  name?: string
  email?: string
  active?: boolean
  createdAt?: Date
  modifiedAt?: Date
}

export interface IUserRepository {
  get(email: string): Promise<UserResponse>
  insert(user: User): Promise<void>
}

export interface IUserService {
  getUser(email: string): Promise<UserResponse>
  insertUser(user: User): Promise<void>
}
