using{API_BUSINESS_PARTNER} from './external/API_BUSINESS_PARTNER';

service BPEmailAdresses{
    entity BPEmailAdresses as projection on API_BUSINESS_PARTNER.A_AddressEmailAddress {
        *
    }
}