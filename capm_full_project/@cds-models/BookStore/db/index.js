// This is an automatically generated file. Please do not change its contents manually!
import { createEntityProxy } from './../../_/index.js'
// Books
export const Book = createEntityProxy(['bookstore.db', 'Books'], { target: { is_singular: true } })
export const Books = createEntityProxy(['bookstore.db', 'Books'], { target: { is_singular: false }})
// Genres
export const Genre = createEntityProxy(['bookstore.db', 'Genres'], { target: { is_singular: true } })
export const Genres = createEntityProxy(['bookstore.db', 'Genres'], { target: { is_singular: false }})
// BookStatus
export const BookStatu = createEntityProxy(['bookstore.db', 'BookStatus'], { target: { is_singular: true }, customProps: ["code"] })
export const BookStatus = createEntityProxy(['bookstore.db', 'BookStatus'], { target: { is_singular: false }})
// Authors
export const Author = createEntityProxy(['bookstore.db', 'Authors'], { target: { is_singular: true } })
export const Authors = createEntityProxy(['bookstore.db', 'Authors'], { target: { is_singular: false }})
// Chapters
export const Chapter = createEntityProxy(['bookstore.db', 'Chapters'], { target: { is_singular: true } })
export const Chapters = createEntityProxy(['bookstore.db', 'Chapters'], { target: { is_singular: false }})
// events
// actions
// enums
export const Genre = { Fantasy: "Fantasy", Mystery: "Mystery", Horror: "Horror", Romance: "Romance", Fiction: "Fiction", HistoricalFiction: "Historical-Fiction", ScienceFiction: "Science-Fiction", Biography: "Biography", Children: "Children", Poetry: "Poetry" }
BookStatu.code ??= { Available: "A", Low_Stock: "L", Unavailable: "U" }
