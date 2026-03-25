using btp.a as ba from '../db/data-model';

service AuthorizationService {

    @requires: 'authenticated-user' // predefined term
    entity NormalEntity as select from ba.NormalEntity;

    @requires: 'Admin' // we are defining it
    @restrict: [{grant: 'CREATE'}] // only the user who has Admin Role can be able to perform only Create operation and he can't perform operations
    entity AdminEntity as select from ba.AdminEntity;
}