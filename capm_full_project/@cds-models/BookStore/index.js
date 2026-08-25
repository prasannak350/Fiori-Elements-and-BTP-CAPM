// This is an automatically generated file. Please do not change its contents manually!
import { createEntityProxy } from './../_/index.js'
// service
const BookStore = { name: 'BookStore' }
export default BookStore
// Books
export const Book = createEntityProxy(['BookStore', 'Books'], { target: { is_singular: true } })
export const Books = createEntityProxy(['BookStore', 'Books'], { target: { is_singular: false }})
// Authors
export const Author = createEntityProxy(['BookStore', 'Authors'], { target: { is_singular: true } })
export const Authors = createEntityProxy(['BookStore', 'Authors'], { target: { is_singular: false }})
// Chapters
export const Chapter = createEntityProxy(['BookStore', 'Chapters'], { target: { is_singular: true } })
export const Chapters = createEntityProxy(['BookStore', 'Chapters'], { target: { is_singular: false }})
// BookStatus
export const BookStatu = createEntityProxy(['BookStore', 'BookStatus'], { target: { is_singular: true }, customProps: ["code"] })
export const BookStatus = createEntityProxy(['BookStore', 'BookStatus'], { target: { is_singular: false }})
// GenresVH
export const GenresVH = createEntityProxy(['BookStore', 'GenresVH'], { target: { is_singular: true } })
export const GenresVH_ = createEntityProxy(['BookStore', 'GenresVH'], { target: { is_singular: false }})
// Currencies
export const Currency = createEntityProxy(['BookStore', 'Currencies'], { target: { is_singular: true } })
export const Currencies = createEntityProxy(['BookStore', 'Currencies'], { target: { is_singular: false }})
// Currencies.texts
Currencies.text = createEntityProxy(['BookStore', 'Currencies.texts'], { target: { is_singular: true } })
Currencies.texts = createEntityProxy(['BookStore', 'Currencies.texts'], { target: { is_singular: false }})
// events
// actions
// enums
BookStatu.code ??= { Available: "A", Low_Stock: "L", Unavailable: "U" }
