CREATE TABLE IF NOT EXISTS Users (
    email TEXT UNIQUE NOT NULL PRIMARY KEY
    , name TEXT NOT NULL
    , created_on TIMESTAMP NOT NULL
    , last_login TIMESTAMP
    , is_scout BOOLEAN DEFAULT FALSE
    , is_requester BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS UserRegion (
    user_region_id SERIAL PRIMARY KEY 
    , email TEXT NOT NULL 
    , zipcode INT NOT NULL
    , FOREIGN KEY ( email ) REFERENCES Users(email)
);

CREATE TABLE IF NOT EXISTS Tours (
    tour_id SERIAL PRIMARY KEY
    , tour_address TEXT NOT NULL
    , requested_by TEXT NOT NULL
    , scouted_by TEXT NOT NULL
    , date_requested TIMESTAMP
    , date_completed TIMESTAMP
    , status TEXT 
    , tour_summary TEXT
    , tour_review_text TEXT
    , tour_review_stars TEXT
    , FOREIGN KEY ( requested_by ) REFERENCES Users(email)
    , FOREIGN KEY ( scouted_by ) REFERENCES Users(email)
);

CREATE TABLE IF NOT EXISTS Conversations (
    conversation_id SERIAL PRIMARY KEY
    , person_a TEXT NOT NULL
    , person_b TEXT NOT NULL
    -- , last_msg_id SERIAL
    , last_msg TEXT
    , last_msg_time TIMESTAMP
    , FOREIGN KEY ( person_a ) REFERENCES Users(email)
    , FOREIGN KEY ( person_b ) REFERENCES Users(email)
    -- , FOREIGN KEY ( last_msg_id ) REFERENCES Messages(msg_id)
);

CREATE TABLE IF NOT EXISTS Messages (
    msg_id SERIAL PRIMARY KEY
    , msg_text TEXT NOT NULL
    , msg_time TEXT NOT NULL
    , sender TEXT NOT NULL
    , conversation_id SERIAL NOT NULL
    , FOREIGN KEY ( sender ) REFERENCES Users(email)
    , FOREIGN KEY ( conversation_id ) REFERENCES Conversations( conversation_id )
);

COPY Users(email, name, created_on, last_login, is_scout, is_requester)
    FROM '/var/lib/postgresql/data/users.csv'
    DELIMITER ','
    CSV HEADER;

COPY UserRegion(email, zipcode)
    FROM '/var/lib/postgresql/data/user_region.csv'
    DELIMITER ','
    CSV HEADER;

COPY Tours(tour_address, requested_by, scouted_by, date_requested, date_completed, status, tour_summary, tour_review_text, tour_review_stars)
    FROM '/var/lib/postgresql/data/tours.csv'
    DELIMITER ','
    CSV HEADER;

COPY Conversations(conversation_id, person_a, person_b, last_msg, last_msg_time)
    FROM '/var/lib/postgresql/data/conversations.csv'
    DELIMITER ','
    CSV HEADER;

COPY Messages( conversation_id, msg_text, msg_time, sender)
    FROM '/var/lib/postgresql/data/messages.csv'
    DELIMITER ','
    CSV HEADER;
