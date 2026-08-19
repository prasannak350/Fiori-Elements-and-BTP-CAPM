using my.worklist as db from '../db/schema';

service WorklistService {

  @cds.search: {            // search box to search Name and Description
      name,
      description
  }

  entity Products as projection on db.Products
  actions{
    action markRestocked();
  };

  @readonly
  entity StatusCodes as projection on db.StatusCodes;
}