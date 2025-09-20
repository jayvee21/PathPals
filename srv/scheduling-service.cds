using {PathPals.db as db} from '../db/schema';

service Scheduling {
    entity Trips as projection on db.Trips;
}

annotate Scheduling with @(requires: 'specialist');
annotate Scheduling.Trips with @odata.draft.enabled;

