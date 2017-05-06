DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  id serial4 primary key,
  name varchar(255)
  );

CREATE TABLE animals (
  id serial4 primary key,
  name varchar(255),
  age int2,
  admission_date varchar(255),
  adoptable BOOLEAN,
  owner_id INT2 REFERENCES owners(id)
  );