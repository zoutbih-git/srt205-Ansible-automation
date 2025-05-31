-- Create the Avengers database
CREATE DATABASE IF NOT EXISTS avengers_db;

USE avengers_db;

-- Create the characters table
CREATE TABLE
  IF NOT EXISTS characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    alias VARCHAR(50),
    power_level INT,
    specialty VARCHAR(100)
  );

-- Insert predefined Avengers
INSERT INTO
  characters (name, alias, power_level, specialty)
VALUES
  (
    'Steve Rogers',
    'Captain America',
    90,
    'Super Soldier Serum'
  ),
  (
    'Tony Stark',
    'Iron Man',
    95,
    'Genius, Engineer, Arc Reactor Suit'
  ),
  (
    'Thor Odinson',
    'Thor',
    99,
    'God of Thunder, Mjolnir'
  ),
  (
    'Bruce Banner',
    'Hulk',
    100,
    'Super Strength, Radiation Resistance'
  ),
  (
    'Natasha Romanoff',
    'Black Widow',
    85,
    'Espionage, Martial Arts, Acrobatics'
  ),
  (
    'Clint Barton',
    'Hawkeye',
    80,
    'Master Archer, Tactician'
  )
  ON DUPLICATE KEY UPDATE 
power_level = VALUES(power_level),
specialty = VALUES(specialty);
