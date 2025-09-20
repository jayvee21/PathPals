using {PathPals.db as db} from '../db/schema';

service Scheduling {
    entity Trips as projection on db.Trips;
}