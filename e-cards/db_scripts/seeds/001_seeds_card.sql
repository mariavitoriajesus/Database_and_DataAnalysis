INSERT INTO tbl_collections (collectionSetName, releaseDate, totalCardsInCollection) VALUES
('Base Set', '1999-01-09', 102),
('Jungle', '1999-06-16', 64),
('Fossil', '1999-10-10', 62);

INSERT INTO tbl_types (typeName) VALUES
('Fire'),
('Water'),
('Grass'),
('Electric'),
('Psychic'),
('Fighting'),
('Dark'),
('Metal'),
('Dragon'),
('Fairy'),
('Colorless');

INSERT INTO tbl_stages (stageName) VALUES
('Basic'),
('Stage 1'),
('Stage 2');

INSERT INTO tbl_cards (
    hp, name, info, attack, demmage, weak, ressistence, retreat,
    cardNumberInCollection, tableCollectionId, typeId, stageId
) VALUES
(50, 'Charmander', 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.', 
 'Scratch', '10', 'Water', '', '1 Colorless', '46/102', 1, 1, 1),
(40, 'Pikachu', 'When several of these Pokémon gather, their electricity can build and cause lightning storms.', 
 'Thunder Jolt', '30', 'Fighting', '', '1 Colorless', '60/64', 2, 4, 1),
(80, 'Gengar', 'Under a full moon, this Pokémon likes to mimic the shadows of people and laugh at their fright.',
 'Dark Mind', '30', 'Psychic', 'Fighting', '0', '5/62', 3, 5, 3);
