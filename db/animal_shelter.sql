DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE animals (
  id serial4 primary key,
  name varchar(255),
  age int2,
  admission_date varchar(255),
  adoptable BOOLEAN
  );

CREATE TABLE owners (
  id serial4 primary key,
  name varchar(255)
  );