using doc.management as db from '../db/schema';

service DocumentService {
    @odata.draft.enabled
    entity Documents as projection on db.Documents;
}