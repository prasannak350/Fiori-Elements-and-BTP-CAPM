using { cuid } from '@sap/cds/common';
namespace my.Order;
entity Order{
    key ID: UUID;
    totalAmount: Decimal(10, 2);
    status: String;
    // to support the image media type
    @odata.media
    image: LargeBinary;
}

