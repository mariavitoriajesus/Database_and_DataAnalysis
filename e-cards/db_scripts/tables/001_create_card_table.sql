CREATE TABLE tbl_collections (
    id SERIAL PRIMARY KEY,
    collectionSetName VARCHAR(100) NOT NULL,
    releaseDate DATE,
    totalCardsInCollection INTEGER
);

CREATE TABLE tbl_types (
    id SERIAL PRIMARY KEY,
    typeName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_stages (
    id SERIAL PRIMARY KEY,
    stageName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_cards (
    id SERIAL PRIMARY KEY,
    hp INTEGER,
    name VARCHAR(100) NOT NULL,
    info TEXT,
    attack VARCHAR(100),
    demmage VARCHAR(50),
    weak VARCHAR(50),
    ressistence VARCHAR(50),
    retreat VARCHAR(50),
    cardNumberInCollection VARCHAR(20),
    tableCollectionId INTEGER,
    typeId INTEGER,
    stageId INTEGER,
    CONSTRAINT fk_collection FOREIGN KEY (tableCollectionId) REFERENCES tbl_collections(id) ON DELETE SET NULL,
    CONSTRAINT fk_type FOREIGN KEY (typeId) REFERENCES tbl_types(id) ON DELETE SET NULL,
    CONSTRAINT fk_stage FOREIGN KEY (stageId) REFERENCES tbl_stages(id) ON DELETE SET NULL
);
