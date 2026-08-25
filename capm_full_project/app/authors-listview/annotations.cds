using BookStore as service from '../../srv/service';
annotate service.Authors with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Ebook',
            ID : 'Ebook',
            Target : '@UI.FieldGroup#Ebook',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Books Information',
            ID : 'BooksInformation',
            Target : '@UI.FieldGroup#BooksInformation',
        },
    ],
    UI.FieldGroup #Ebook : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : content,
                Label : 'Ebook file',
            },
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name',
        },
    ],
    UI.FieldGroup #BooksInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bookCount,
                Label : 'Book Count',
            },
        ],
    },
);

