// This is an automatically generated file. Please do not change its contents manually!
import * as _ from './../index.js';
import * as __ from './../_/index.js';
import * as _bookstore_db from './../bookstore/db/index.js';
import * as _sap_common from './../sap/common/index.js';

export default class {
}

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
    genre?: __.Association.to<GenresVH> | null
    genre_code?: _bookstore_db.Genre | null
    publishedAt?: __.CdsDate | null
    pages?: number | null
    price?: number | null
    currency?: __.Association.to<Currency> | null
    currency_code?: string | null
    stock?: number | null
    status?: __.Association.to<BookStatu> | null
    status_code?: _bookstore_db.BookStatu_code | null
    Chapters?: __.Composition.of.many<Chapters>
  } & InstanceType<TBase>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Book>;
    readonly elements: __.ElementsOf<Book>;
    readonly actions: globalThis.Record<never, never>;
};
export class Book extends _BookAspect(__.Entity) {
  static drafts: __.DraftOf<Book>
}
export class Books extends Array<Book> {
  static drafts: __.DraftsOf<Book>
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
  } & InstanceType<TBase>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Author>;
    readonly elements: __.ElementsOf<Author>;
    readonly actions: globalThis.Record<never, never>;
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
  } & InstanceType<TBase>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Chapter>;
    readonly elements: __.ElementsOf<Chapter>;
    readonly actions: globalThis.Record<never, never>;
};
export class Chapter extends _ChapterAspect(__.Entity) {
  static drafts: __.DraftOf<Chapter>
}
export class Chapters extends Array<Chapter> {
  static drafts: __.DraftsOf<Chapter>
  $count?: number
}

// entity 'BookStatu'
export declare function _BookStatuAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    code?: __.Key<_bookstore_db.BookStatu_code>
    criticality?: number | null
    displayText?: string | null
  } & InstanceType<TBase>
    code: typeof _bookstore_db.BookStatu_code;
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

// entity 'GenresVH'
export declare function _GenresVHAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    code?: __.Key<_bookstore_db.Genre>
    description?: string | null
  } & InstanceType<TBase>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<GenresVH>;
    readonly elements: __.ElementsOf<GenresVH>;
    readonly actions: globalThis.Record<never, never>;
};
export class GenresVH extends _GenresVHAspect(__.Entity) {
}
export class GenresVH_ extends Array<GenresVH> {
  $count?: number
}

// entity 'Currency'
export declare function _CurrencyAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
  new (...args: any[]): {
    name?: string | null
    descr?: string | null
    code?: __.Key<string>
    symbol?: string | null
    minorUnit?: number | null
    texts?: __.Composition.of.many<Currencies.texts>
    localized?: __.Association.to<Currencies.text> | null
  } & InstanceType<TBase>
    readonly kind: 'entity';
    readonly keys: __.KeysOf<Currency>;
    readonly elements: __.ElementsOf<Currency>;
    readonly actions: globalThis.Record<never, never>;
};
/**
* Code list for currencies
* 
* See https://cap.cloud.sap/docs/cds/common#entity-currencies
*/
export class Currency extends _CurrencyAspect(__.Entity) {
}
/**
* Code list for currencies
* 
* See https://cap.cloud.sap/docs/cds/common#entity-currencies
*/
export class Currencies extends Array<Currency> {
  $count?: number
}

export namespace Currencies {
  // entity 'text'
  export function _textAspect<TBase extends new (...args: any[]) => object>(Base: TBase): {
    new (...args: any[]): {
        /** Type for a language code */
        locale?: __.Key<_sap_common.Locale>
        name?: string | null
        descr?: string | null
        code?: __.Key<string>
    } & InstanceType<TBase>
        readonly kind: 'entity';
        readonly keys: __.KeysOf<text>;
        readonly elements: __.ElementsOf<text>;
        readonly actions: globalThis.Record<never, never>;
  };
  export class text extends _textAspect(__.Entity) {
  }
  export class texts extends Array<text> {
    $count?: number
  }
  
}