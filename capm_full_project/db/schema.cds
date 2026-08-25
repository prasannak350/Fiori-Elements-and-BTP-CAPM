namespace bookstore.db;

using {cuid, managed, sap.common.Currencies} from '@sap/cds/common';     // importing currencies also

using {Attachments} from '@cap-js/attachments';                         // importing attachments for upload feature

entity Books : cuid, managed{
    title: String;
    author: Association to Authors;
    genre: Association to Genres;
    publishedAt: Date;
    pages: Integer;
    price: Decimal(9, 2);
    currency: Association to Currencies;
    stock: Integer;
    status: Association to BookStatus;
    Chapters: Composition of many Chapters on Chapters.book = $self;
}

entity Genres {
    key code: Genre;
        description: String;
}

type Genre: String enum{
    Fantasy = 'Fantasy';
    Mystery = 'Mystery';
    Horror = 'Horror';
    Romance = 'Romance';
    Fiction = 'Fiction';
    HistoricalFiction = 'Historical-Fiction';
    ScienceFiction = 'Science-Fiction';
    Biography = 'Biography';
    Children = 'Children';
    Poetry = 'Poetry';
}
entity BookStatus{
    key code : String(1) enum{
        Available = 'A';
        Low_Stock = 'L';
        Unavailable = 'U';
    };
        criticality: Integer;
        displayText: String;
}

entity Authors: cuid, managed{
    name: String;
    fileName : String;
    fileType: String @Core.IsMediaType;
    content: LargeBinary @Core.MediaType: fileType
                         @Core.ContentDisposition.Filename : fileName
                         @Core.AcceptableMediaTypes : ['application/pdf'];
    attachments : Composition of many Attachments;                            // for upload using '@cap-js/attachments' plugin
    virtual bookCount: Integer;                                               // virtual field
    books: Association to many Books on books.author = $self;
}

entity Chapters: cuid, managed{
    key book: Association to Books;
        number: Integer;
        title: String;
        pages: Integer;
    
}




// many to many associations
// one author can have many books and one book can have many authors
// entity Books : cuid{
//     title: String;
//     Author: Association to many Authors2Books on Author.book = $self;
    
// }

// entity Authors2Books: cuid{
//     book: Association to Books;
//     author: Association to Authors;
// }


// entity Authors: cuid{
//     name: String;
//     age: Integer;
//     Books: Association to many Authors2Books on Books.author = $self;
// }