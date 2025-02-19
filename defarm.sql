CREATE TABLE Animal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    species VARCHAR(50) NOT NULL,
    breed VARCHAR(50) NOT NULL,
    sex ENUM('male', 'female', 'castrated') NOT NULL,
    birth_date DATE NOT NULL,
    own_farm BOOLEAN NOT NULL
);

CREATE TABLE Identifications (
    animal_id INT,
    ear_tag VARCHAR(50),
    rfid VARCHAR(50),
    sisbov_old VARCHAR(50),
    sisbov VARCHAR(50),
    internal_id VARCHAR(50),
    PRIMARY KEY (animal_id),
    FOREIGN KEY (animal_id) REFERENCES Animal(id) ON DELETE CASCADE
);

CREATE TABLE Ownership (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    owner_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animal(id) ON DELETE CASCADE
);

CREATE TABLE BrazilRegistration (
    ownership_id INT,
    cpf_cnpj VARCHAR(20),
    property_name VARCHAR(100),
    establishment_code VARCHAR(50),
    exploracao_pecuaria ENUM('Corte', 'Leite'),
    state_registration VARCHAR(50),
    mapa_code VARCHAR(50),
    geolocation VARCHAR(100),
    municipality VARCHAR(50),
    state VARCHAR(10),
    PRIMARY KEY (ownership_id),
    FOREIGN KEY (ownership_id) REFERENCES Ownership(id) ON DELETE CASCADE
);

CREATE TABLE MovementHistory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    date DATE NOT NULL,
    `from` VARCHAR(100) NOT NULL,
    `to` VARCHAR(100) NOT NULL,
    reason ENUM('purchase', 'transfer', 'sale', 'rotation') NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animal(id) ON DELETE CASCADE
);

CREATE TABLE GTA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    gta_number VARCHAR(50) NOT NULL,
    issue_date DATE NOT NULL,
    valid_until DATE NOT NULL,
    transport_type ENUM('road', 'air', 'sea') NOT NULL,
    vehicle_plate VARCHAR(20),
    purpose ENUM('abate', 'engorda', 'reprodução', 'exposição', 'leilão', 'esporte') NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animal(id) ON DELETE CASCADE
);
