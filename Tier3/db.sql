CREATE TABLE USER_ROLE(
	role_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,--0 for base emp, 1 for management
	name VARCHAR(25)
)

CREATE TABLE STUDY_SET(
	study_set_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50) UNIQUE,
	owner_id INTEGER,
	FOREIGN key (owner_id)  REFERENCES APP_USER (user_id)
);

CREATE TABLE CATEGORY(
	category_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,--0 for base emp, 1 for management
	name VARCHAR UNIQUE
)

CREATE TABLE FLASHCARD(
	flashcard_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	question VARCHAR UNIQUE,
	answer VARCHAR,
	category_id INTEGER,
	FOREIGN key (category_id)  REFERENCES CATEGORY (category_id)
);

CREATE TABLE STUDY_SET_CARD(
	study_set_id INTEGER,
	FOREIGN key (study_set_id)  REFERENCES STUDY_SET (study_set_id),
	flashcard_id INTEGER,
	FOREIGN key (flashcard_id)  REFERENCES FLASHCARD (flashcard_id)
	PRIMARY KEY(study_set_id, flshcarad_id)
);

CREATE TABLE APP_USER (
	-- columns to be defined in this table
	-- column_name column_type CONSTRAINTS,	
--	id SERIAL PRIMARY KEY, -- Very common mechanism for auto incrementing
	user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- newer mechanism
	--VARCHAR2 doesnt discriminate against null or unique strings
	username VARCHAR(50) UNIQUE,
	password VARCHAR(50),
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	role_id INTEGER,
	FOREIGN key (role_id)  REFERENCES USER_ROLE (role_id)
);


