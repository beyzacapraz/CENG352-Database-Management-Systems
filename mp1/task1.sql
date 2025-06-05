CREATE TABLE Country (
    name VARCHAR(100) NOT NULL,
    code VARCHAR(10) PRIMARY KEY,
    capital VARCHAR(100),
    area FLOAT,
    population INTEGER
);

CREATE TABLE City (
    name VARCHAR(100) NOT NULL,
    country_code VARCHAR(10) NOT NULL,
    population FLOAT,
    elevation FLOAT,
    PRIMARY KEY (name, country_code),
    FOREIGN KEY (country_code) REFERENCES Country(code)
);

CREATE TABLE Economy (
    country_code VARCHAR(10) PRIMARY KEY,
    gdp FLOAT,
    agriculture FLOAT,
    service FLOAT,
    industry FLOAT,
    inflation FLOAT,
    unemployment FLOAT,
    FOREIGN KEY (country_code) REFERENCES Country(code)
);

CREATE TABLE Religion (
    country_code VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    percentage FLOAT,
    PRIMARY KEY (country_code, name),
    FOREIGN KEY (country_code) REFERENCES Country(code)
);

CREATE TABLE Spoken (
    country_code VARCHAR(10) NOT NULL,
    language VARCHAR(100) NOT NULL,
    percentage FLOAT,
    PRIMARY KEY (country_code, language),
    FOREIGN KEY (country_code) REFERENCES Country(code)
);

CREATE TABLE Continent (
    name VARCHAR(100) PRIMARY KEY,
    area INTEGER
);

CREATE TABLE Encompasses (
    country_code VARCHAR(10) NOT NULL,
    continent VARCHAR(100) NOT NULL,
    percentage FLOAT,
    PRIMARY KEY (country_code, continent),
    FOREIGN KEY (country_code) REFERENCES Country(code),
    FOREIGN KEY (continent) REFERENCES Continent(name)
);
