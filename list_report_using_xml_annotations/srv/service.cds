using { my.bookshop as db } from '../db/schema';

@path: 'catalog'
service CatalogService {

    @readonly
    entity Products as projection on db.Products;

}