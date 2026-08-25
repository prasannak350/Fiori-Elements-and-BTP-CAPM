using {sampleShop} from '../db/schema';

@path: '/kitchen'
service CookingSupplyService{
    entity CookingSupplies as projection on sampleShop.CookingSupplies;
}