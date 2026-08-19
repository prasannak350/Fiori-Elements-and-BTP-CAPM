namespace my.worklist;

entity Products {
  key ID          : Integer;
      name        : String(111);
      description : String(1111);
      price       : Decimal(9,2);
      currency    : String(3);
      stock       : Integer;
      status : Association to StatusCodes;
      statusCriticality : Integer;
      createdAt   : DateTime;
}

entity StatusCodes {
  key code : String(1);
      text : String(30);
}