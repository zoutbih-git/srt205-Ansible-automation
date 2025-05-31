-- Create the Lord of the Rings database
CREATE DATABASE IF NOT EXISTS lotr_db;

USE lotr_db;

-- Create the characters table
CREATE TABLE IF NOT EXISTS characters (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) UNIQUE,
  race VARCHAR(50),
  role VARCHAR(100),
  origin VARCHAR(100),
  specialty VARCHAR(100)
);

-- Insert predefined Lord of the Rings characters
INSERT INTO characters (name, race, role, origin, specialty)
VALUES
  ('Frodo Baggins', 'Hobbit', 'Ring-bearer', 'The Shire', 'Resistance to the Ring'),
  ('Gandalf', 'Maia', 'Wizard', 'Valinor', 'Magic, Wisdom, Immortality'),
  ('Aragorn', 'Human', 'Ranger', 'Rivendell', 'Leadership, Healing'),
  ('Legolas', 'Elf', 'Archer', 'Mirkwood', 'Enhanced Agility, Keen Vision'),
  ('Gimli', 'Dwarf', 'Warrior', 'Erebor', 'Strength, Endurance'),
  ('Eowyn', 'Human', 'Shieldmaiden', 'Rohan', 'Bravery, Combat Prowess'),
  ('Galadriel', 'Elf', 'Lady of Lothlorien', 'Lothlorien', 'Wisdom, Telepathy, Light of Earendil')
ON DUPLICATE KEY UPDATE
  specialty = VALUES(specialty);

SELECT * FROM characters;
