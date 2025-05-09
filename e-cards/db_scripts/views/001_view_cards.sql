CREATE OR REPLACE VIEW vw_cards_full AS
SELECT
    c.id,
    c.hp,
    c.name,
    t.typeName AS type,
    s.stageName AS stage,
    c.info,
    c.attack,
    c.demmage,
    c.weak,
    c.ressistence,
    c.retreat,
    c.cardNumberInCollection,
    col.collectionSetName AS collectionName,
    col.releaseDate,
    col.totalCardsInCollection
FROM
    tbl_cards c
LEFT JOIN tbl_types t ON c.typeId = t.id
LEFT JOIN tbl_stages s ON c.stageId = s.id
LEFT JOIN tbl_collections col ON c.tableCollectionId = col.id;
