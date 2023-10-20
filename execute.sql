SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Staff, Driver, VehicleModelManufacturer, Vehicle, Permit, DriverVehiclePermit, ParkingLot, Zone, Space, PermitLocation, ParkingLocation, CitationCategory, Citation, Appeals;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
	Role ENUM( 'Admin' , 'Security')
);

CREATE TABLE Driver (
    DriverID INT PRIMARY KEY,
    DriverName VARCHAR(255) NOT NULL,
    Status ENUM('S','E', 'V')
);

CREATE TABLE VehicleModelManufacturer (
    Model VARCHAR(255),
    Manufacturer VARCHAR(255),
    PRIMARY KEY (Model)
);

CREATE TABLE Vehicle (
    LicenseNo VARCHAR(255) PRIMARY KEY,
    DriverID INT,
    Model VARCHAR(255),
    Color VARCHAR(255),
    Year INT,
    VehicleCategory ENUM('Electric', 'Handicap', 'Compact car', 'Regular'),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID) ON DELETE CASCADE,
    FOREIGN KEY (Model) REFERENCES VehicleModelManufacturer(Model)
);

CREATE TABLE Permit (
    PermitID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    LicenseNo VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    ExpirationTime TIME NOT NULL,
    PermitType ENUM('Residential', 'Commuter', 'Peak Hours', 'Special Event', 'Park & Ride'),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (LicenseNo) REFERENCES Vehicle(LicenseNo) ON DELETE CASCADE
);

CREATE TABLE DriverVehiclePermit (
    DriverID INT NOT NULL,
    LicenseNo VARCHAR(255) NOT NULL,
    PRIMARY KEY (DriverID, LicenseNo),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID) ON DELETE CASCADE,
    FOREIGN KEY (LicenseNo) REFERENCES Vehicle(LicenseNo) ON DELETE CASCADE
);

CREATE TABLE ParkingLot (
    PLName VARCHAR(255) PRIMARY KEY,
    StaffID INT NOT NULL,
    Address VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Zone (
    PLName VARCHAR(255) NOT NULL,
    ZoneID INT NOT NULL,
    PRIMARY KEY (PLName, ZoneID),
    FOREIGN KEY (PLName) REFERENCES ParkingLot(PLName) ON DELETE CASCADE
);

CREATE TABLE Space (
    PLName VARCHAR(255),
    ZoneID INT NOT NULL,
    SpaceNo INT NULL,
    SpaceType VARCHAR(255) NOT NULL,
    PRIMARY KEY (PLName, ZoneID, SpaceNo),
    FOREIGN KEY (PLName, ZoneID) REFERENCES Zone(PLName, ZoneID) ON DELETE CASCADE
);

CREATE TABLE PermitLocation (
    PermitID INT PRIMARY KEY,
    PLName VARCHAR(255) NOT NULL,
    ZoneID INT NOT NULL,
    SpaceNo INT NOT NULL,
    FOREIGN KEY (PermitID) REFERENCES Permit(PermitID) ON DELETE CASCADE,
    FOREIGN KEY (PLName, ZoneID, SpaceNo) REFERENCES Space(PLName, ZoneID, SpaceNo) 
);

CREATE TABLE ParkingLocation (
    PLName VARCHAR(255) NOT NULL,
    ZoneID INT NOT NULL,
    SpaceNo INT NOT NULL,
    StaffID INT NOT NULL,
    AvailabilityStatus BOOLEAN NOT NULL,
    FOREIGN KEY (PLName, ZoneID, SpaceNo) REFERENCES Space(PLName, ZoneID, SpaceNo) ON DELETE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE CitationCategory (
    CitationName ENUM('Invalid Permit', 'Expired Permit', 'No Permit') PRIMARY KEY,
    Fees DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Citation (
    CitationNo INT PRIMARY KEY,
    CitationDate DATE NOT NULL,
    CitationTime TIME NOT NULL,
    PaymentStatus ENUM ('Pending', 'Complete', 'Not Required'),
    StaffID INT NOT NULL,
    LicenseNo VARCHAR(255) NOT NULL,
    PLName VARCHAR(255) NOT NULL,
    CitationName ENUM('Invalid Permit', 'Expired Permit', 'No Permit') NOT NULL,
    FOREIGN KEY (CitationName) REFERENCES CitationCategory(CitationName),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (LicenseNo) REFERENCES Vehicle(LicenseNo),
    FOREIGN KEY (PLName) REFERENCES ParkingLot(PLName)
);

CREATE TABLE Appeals (
    DriverID INT NOT NULL,
    CitationNo INT NOT NULL,
    AppealStatus ENUM ('Requested', 'Rejected', 'Accepted'),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (CitationNo) REFERENCES Citation(CitationNo)
);
