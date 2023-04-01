CREATE KEYSPACE examplesys WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE examplesys.auth_user (
    auth_user_id UUID PRIMARY KEY,
    email text,
    password text,
    salt text,
    first_name text,
    last_name timestamp
);

CREATE INDEX IF NOT EXISTS ON examplesys.auth_user (email);
