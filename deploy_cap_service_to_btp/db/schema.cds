namespace sampleShop;

using{cuid} from '@sap/cds/common';

aspect CookingSupplyData{
    name: String;
    price: Decimal(8, 2);
    amount: Integer;
    color: String;
    material: String;
}

entity CookingSupplies: cuid, CookingSupplyData{
    creator: String;
}

type ApiPayload : CookingSupplyData{

}