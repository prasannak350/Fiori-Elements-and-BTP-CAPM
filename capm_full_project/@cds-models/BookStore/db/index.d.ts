// This is an automatically generated file. Please do not change its contents manually!
import * as _ from './../../index.js';
import * as __ from './../../_/index.js';
import * as _sap_common from './../../sap/common/index.js';

// enum
export const Genre: {
  Fantasy: "Fantasy",
  Mystery: "Mystery",
  Horror: "Horror",
  Romance: "Romance",
  Fiction: "Fiction",
  HistoricalFiction: "Historical-Fiction",
  ScienceFiction: "Science-Fiction",
  Biography: "Biography",
  Children: "Children",
  Poetry: "Poetry",
}
export type Genre = "Fantasy" | "Mystery" | "Horror" | "Romance" | "Fiction" | "Historical-Fiction" | "Science-Fiction" | "Biography" | "Children" | "Poetry"

// enum
export const BookStatu_code: {
  Available: "A",
  Low_Stock: "L",
  Unavailable: "U",
}
export type BookStatu_code = "A" | "L" | "U"

// entity 'Book'
export declare function _BookAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    ID?: __.Key<string>
    createdAt?: __.CdsTimestamp | null
    /** Canonical user ID */
    createdBy?: _.User | null
    modifiedAt?: __.CdsTimestamp | null
    /** Canonical user ID */
    modifiedBy?: _.User | null
    title?: string | null
    author?: __.Association.to<Author> | null
    author_ID?: string | null
    genre?: __.Association.to<Genre> | null
    genre_code?: Genre | null
    publishedAt?: __.CdsDate | null
    pages?: number | null
    price?: number | null
    currency?: __.Association.to<_sap_common.Currency> | null
    currency_code?: string | null
    stock?: number | null
    status?: __.Association.to<BookStatu> | null
    status_code?: BookStatu_code | null
    Chapters?: __.Composition.of.many<Chapters>
  } & InstanceType<ReturnType<typeof _._cuidAspect<ReturnType<typeof _._managedAspect<TBase>>>>>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Book> & typeof _.cuid.keys;
    readonly elements: __.ElementsOf<Book>;
    readonly actions: typeof _.cuid.actions & typeof _.managed.actions & globalThis.Record<never, never>;
};
export class Book extends _BookAspect(__.Entity) {
}
export class Books extends Array<Book> {
  $count?: number
}

// entity 'Genre'
export declare function _GenreAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    code?: __.Key<Genre>
    description?: string | null
  } & InstanceType<TBase>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Genre>;
    readonly elements: __.ElementsOf<Genre>;
    readonly actions: globalThis.Record<never, never>;
};
export class Genre extends _GenreAspect(__.Entity) {
}
export class Genres extends Array<Genre> {
  $count?: number
}

// entity 'BookStatu'
export declare function _BookStatuAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    code?: __.Key<BookStatu_code>
    criticality?: number | null
    displayText?: string | null
  } & InstanceType<TBase>
    code: typeof BookStatu_code;
    readonly kind: 'entity';
    readonly keys: __.KeysOf<BookStatu>;
    readonly elements: __.ElementsOf<BookStatu>;
    readonly actions: globalThis.Record<never, never>;
};
export class BookStatu extends _BookStatuAspect(__.Entity) {
}
export class BookStatus extends Array<BookStatu> {
  $count?: number
}

// entity 'Author'
export declare function _AuthorAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    ID?: __.Key<string>
    createdAt?: __.CdsTimestamp | null
    /** Canonical user ID */
    createdBy?: _.User | null
    modifiedAt?: __.CdsTimestamp | null
    /** Canonical user ID */
    modifiedBy?: _.User | null
    name?: string | null
    books?: __.Association.to.many<Books>
  } & InstanceType<ReturnType<typeof _._cuidAspect<ReturnType<typeof _._managedAspect<TBase>>>>>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Author> & typeof _.cuid.keys;
    readonly elements: __.ElementsOf<Author>;
    readonly actions: typeof _.cuid.actions & typeof _.managed.actions & globalThis.Record<never, never>;
};
export class Author extends _AuthorAspect(__.Entity) {
}
export class Authors extends Array<Author> {
  $count?: number
}

// entity 'Chapter'
export declare function _ChapterAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    ID?: __.Key<string>
    createdAt?: __.CdsTimestamp | null
    /** Canonical user ID */
    createdBy?: _.User | null
    modifiedAt?: __.CdsTimestamp | null
    /** Canonical user ID */
    modifiedBy?: _.User | null
    book?: __.Key<__.Association.to<Book>>
    book_ID?: __.Key<string>
    number?: number | null
    title?: string | null
    pages?: number | null
  } & InstanceType<ReturnType<typeof _._cuidAspect<ReturnType<typeof _._managedAspect<TBase>>>>>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Chapter> & typeof _.cuid.keys;
    readonly elements: __.ElementsOf<Chapter>;
    readonly actions: typeof _.cuid.actions & typeof _.managed.actions & globalThis.Record<never, never>;
};
export class Chapter extends _ChapterAspect(__.Entity) {
}
export class Chapters extends Array<Chapter> {
  $count?: number
}
