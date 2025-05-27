-- 1. Cases Table: Stores crime cases
CREATE TABLE Cases (
    case_id INT PRIMARY KEY AUTO_INCREMENT,
    case_name VARCHAR(255) NOT NULL,
    crime_type ENUM('Murder', 'Robbery', 'Assault', 'Fraud') NOT NULL,
    case_status ENUM('Open', 'Closed', 'Under Investigation') DEFAULT 'Open',
    crime_date DATE NOT NULL,
    location VARCHAR(255),
    investigating_officer VARCHAR(255)
);

-- 2. Suspects Table: Stores suspect details
CREATE TABLE Suspects (
    suspect_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT,
    suspect_name VARCHAR(255) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    criminal_record BOOLEAN DEFAULT FALSE,
    relationship_with_victim VARCHAR(255),
    status ENUM('Arrested', 'Under Surveillance', 'Cleared') DEFAULT 'Under Surveillance',
    FOREIGN KEY (case_id) REFERENCES Cases(case_id) ON DELETE CASCADE
);

-- 3. Victims Table: Stores victim details
CREATE TABLE Victims (
    victim_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT,
    victim_name VARCHAR(255) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    cause_of_death VARCHAR(255),
    time_of_death TIMESTAMP,
    FOREIGN KEY (case_id) REFERENCES Cases(case_id) ON DELETE CASCADE
);

-- 4. Evidence Table: Stores evidence details
CREATE TABLE Evidence (
    evidence_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT,
    evidence_type VARCHAR(255) NOT NULL,
    description TEXT,
    collected_from VARCHAR(255),
    forensic_report TEXT,
    date_collected DATE,
    FOREIGN KEY (case_id) REFERENCES Cases(case_id) ON DELETE CASCADE
);

-- Insert Sample Data into Cases Table
INSERT INTO Cases (case_id, case_name, crime_type, case_status, crime_date, location, investigating_officer) VALUES
(1, 'Downtown Apartment Murder', 'Murder', 'Under Investigation', '2025-02-10', 'Downtown, NY', 'Detective John Doe'),
(2, 'Highway Robbery Incident', 'Robbery', 'Closed', '2025-01-15', 'I-95 Highway, NJ', 'Officer Mike Thompson'),
(3, 'Corporate Fraud Case', 'Fraud', 'Open', '2024-12-20', 'Wall Street, NY', 'Detective Sarah Lee'),
(4, 'Park Assault Case', 'Assault', 'Under Investigation', '2025-02-05', 'Central Park, NY', 'Officer David Kim'),
(5, 'Suburban Homicide', 'Murder', 'Closed', '2024-11-30', 'Brooklyn, NY', 'Detective Maria Gonzalez'),
(6, 'Bank Robbery', 'Robbery', 'Under Investigation', '2025-01-25', 'Fifth Avenue, NY', 'Detective Alan Carter'),
(7, 'Domestic Dispute Turned Murder', 'Murder', 'Open', '2024-12-15', 'Queens, NY', 'Detective Chris Johnson'),
(8, 'Hit and Run Assault', 'Assault', 'Closed', '2025-02-18', 'Broadway, NY', 'Officer Emily Brown'),
(9, 'Pension Fund Fraud', 'Fraud', 'Under Investigation', '2024-12-10', 'New Jersey, NJ', 'Detective Mark Rivera'),
(10, 'Warehouse Shooting', 'Murder', 'Under Investigation', '2025-03-01', 'Industrial Zone, NY', 'Detective Laura Scott');

-- Insert Sample Data into Suspects Table
INSERT INTO Suspects (case_id, suspect_name, age, gender, criminal_record, relationship_with_victim, status) VALUES
(1, 'Michael Burns', 34, 'Male', TRUE, 'Neighbor', 'Under Surveillance'),
(1, 'Sara Jones', 29, 'Female', FALSE, 'Business Partner', 'Cleared'),
(2, 'Tom Richardson', 40, 'Male', TRUE, 'Unknown', 'Arrested'),
(3, 'Lisa Carter', 45, 'Female', TRUE, 'Finance Manager', 'Under Surveillance'),
(4, 'James Smith', 30, 'Male', FALSE, 'Acquaintance', 'Cleared'),
(5, 'Oliver King', 38, 'Male', TRUE, 'Family Friend', 'Arrested'),
(6, 'Emma Taylor', 28, 'Female', FALSE, 'Ex-Employee', 'Under Surveillance'),
(7, 'Daniel Foster', 32, 'Male', TRUE, 'Spouse', 'Arrested'),
(8, 'Sophia Martinez', 27, 'Female', FALSE, 'Friend', 'Cleared'),
(9, 'Andrew Cooper', 50, 'Male', TRUE, 'Co-worker', 'Under Surveillance');

-- Insert Sample Data into Victims Table
INSERT INTO Victims (case_id, victim_name, age, gender, cause_of_death, time_of_death) VALUES
(1, 'John Parker', 42, 'Male', 'Gunshot Wound', '2025-02-10 22:30:00'),
(2, 'Unidentified', 50, 'Male', 'Blunt Force Trauma', '2025-01-15 03:45:00'),
(3, 'Rebecca Moore', 38, 'Female', 'Financial Ruin (Suicide)', '2024-12-22 14:00:00'),
(4, 'Daniel Reed', 26, 'Male', 'Head Trauma', '2025-02-05 18:20:00'),
(5, 'Sophia Bennett', 35, 'Female', 'Strangulation', '2024-11-30 23:10:00'),
(6, 'Security Guard', 55, 'Male', 'Gunshot Wound', '2025-01-25 21:50:00'),
(7, 'Laura Wilson', 30, 'Female', 'Stabbing', '2024-12-15 17:40:00'),
(8, 'Jason Clark', 29, 'Male', 'Car Accident', '2025-02-18 20:10:00'),
(9, 'Mark Rogers', 60, 'Male', 'Poisoning', '2024-12-10 09:00:00'),
(10, 'Anthony Wright', 45, 'Male', 'Multiple Gunshot Wounds', '2025-03-01 02:15:00');

-- Insert Sample Data into Evidence Table
INSERT INTO Evidence (case_id, evidence_type, description, collected_from, forensic_report, date_collected) VALUES
(1, 'Weapon', 'Handgun with fingerprints', 'Crime Scene', 'Match found for suspect Michael Burns', '2025-02-11'),
(1, 'CCTV Footage', 'Security camera footage of suspect entering the building', 'Apartment Lobby', 'Confirmed suspect presence', '2025-02-11'),
(2, 'Stolen Wallet', 'Victim’s wallet found near highway', 'Crime Scene', 'Contains fingerprints of Tom Richardson', '2025-01-16'),
(3, 'Financial Documents', 'Fraudulent contracts discovered', 'Victim’s Office', 'Forgery confirmed', '2024-12-21'),
(4, 'Bloody Shirt', 'Shirt found in trash bin', 'Park Dumpster', 'Blood type matches victim', '2025-02-06'),
(5, 'Rope', 'Used to strangle the victim', 'Victim’s House', 'DNA matches suspect', '2024-12-01'),
(6, 'Security Camera Footage', 'Shows masked robbers', 'Bank', 'Identity unclear', '2025-01-26'),
(7, 'Knife', 'Murder weapon', 'Kitchen Sink', 'Fingerprints match suspect', '2024-12-16'),
(8, 'Car Tire Marks', 'Skid marks matching suspect vehicle', 'Crime Scene', 'Matched to suspect vehicle', '2025-02-19'),
(9, 'Poison Bottle', 'Found in victim’s office', 'Desk Drawer', 'Contains arsenic', '2024-12-11');