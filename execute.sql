SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Staff, Driver, VehicleModelManufacturer, Vehicle, Permit, DriverVehiclePermit, ParkingLot, Zone, Space, PermitLocation, ParkingLocation, CitationCategory, Citation, Appeals,DriverVehicleCitation;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE Staff(
    StaffID INT PRIMARY KEY,
	Role VARCHAR(32),
    CHECK (Role in ('Admin', 'Security'))
);

CREATE TABLE Driver (
    DriverID INT PRIMARY KEY,
    DriverName VARCHAR(255) NOT NULL,
    Status VARCHAR(1) CHECK (Status IN ('S', 'E', 'V')),
    CHECK (
        (Status = 'V' AND CHAR_LENGTH(CONVERT(DriverID, CHAR(10))) = 10)
    )
);

CREATE TABLE VehicleModelManufacturer (
    Model VARCHAR(255) PRIMARY KEY,
    Manufacturer VARCHAR(255)
);

CREATE TABLE Vehicle (
    LicenseNo VARCHAR(255) PRIMARY KEY,
    DriverID INT NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Color VARCHAR(255),
    Year INT,
    VehicleCategory VARCHAR(32),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID) ON DELETE CASCADE,
    FOREIGN KEY (Model) REFERENCES VehicleModelManufacturer(Model),
    CHECK (VehicleCategory in ('Electric', 'Handicap', 'Compact car', 'Regular'))
);

CREATE TABLE Permit (
    PermitID INT PRIMARY KEY,
    StaffID INT NOT NULL,
    LicenseNo VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    ExpirationTime TIME NOT NULL,
    PermitType VARCHAR(32),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (LicenseNo) REFERENCES Vehicle(LicenseNo) ON DELETE CASCADE,
    CHECK (PermitType in ('Residential', 'Commuter', 'Peak Hours', 'Special Event', 'Park & Ride'))
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
    ZoneID VARCHAR(2) NOT NULL,
    PRIMARY KEY (PLName, ZoneID),
    FOREIGN KEY (PLName) REFERENCES ParkingLot(PLName) ON DELETE CASCADE,
    CHECK (ZoneID in ('A', 'B', 'C', 'D', 'AS', 'BS', 'CS', 'DS', 'V'))
);

CREATE TABLE Space (
    PLName VARCHAR(255) NOT NULL,
    ZoneID VARCHAR(2) NOT NULL,
    SpaceNo INT NOT NULL,
    SpaceType VARCHAR(255) NOT NULL,
    PRIMARY KEY (PLName, ZoneID, SpaceNo),
    FOREIGN KEY (PLName, ZoneID) REFERENCES Zone(PLName, ZoneID) ON DELETE CASCADE,
    CHECK (SpaceType in ('Electric', 'Handicap', 'Compact car', 'Regular'))
);

CREATE TABLE PermitLocation (
    PermitID INT PRIMARY KEY,
    PLName VARCHAR(255) NOT NULL,
    ZoneID VARCHAR(2) NOT NULL,
    SpaceNo INT NOT NULL,
    FOREIGN KEY (PermitID) REFERENCES Permit(PermitID) ON DELETE CASCADE,
    FOREIGN KEY (PLName, ZoneID, SpaceNo) REFERENCES Space(PLName, ZoneID, SpaceNo) 
);

CREATE TABLE ParkingLocation (
    PLName VARCHAR(255) NOT NULL,
    ZoneID VARCHAR(2),
    SpaceNo INT NOT NULL,
    StaffID INT NOT NULL,
    AvailabilityStatus BOOLEAN NOT NULL,
    PRIMARY KEY (PLName, ZoneID, SpaceNo),
    FOREIGN KEY (PLName, ZoneID, SpaceNo) REFERENCES Space(PLName, ZoneID, SpaceNo) ON DELETE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE CitationCategory (
    CitationName VARCHAR(32) PRIMARY KEY,
    Fees INT  NOT NULL,
    CHECK (CitationName in ('Invalid Permit', 'Expired Permit', 'No Permit'))
);


CREATE TABLE Citation (
    CitationNo INT PRIMARY KEY,
    CitationDate DATE NOT NULL,
    CitationTime TIME NOT NULL,
    PaymentStatus ENUM ('Pending', 'Complete', 'Not Required'),
    StaffID INT NOT NULL,
    LicenseNo VARCHAR(255) NOT NULL,
    PLName VARCHAR(255) NOT NULL,
    CitationName VARCHAR(32),
    FOREIGN KEY (CitationName) REFERENCES CitationCategory(CitationName),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (LicenseNo) REFERENCES Vehicle(LicenseNo),
    FOREIGN KEY (PLName) REFERENCES ParkingLot(PLName),
    CHECK (CitationName in ('Invalid Permit', 'Expired Permit', 'No Permit'))

);

CREATE TABLE DriverVehicleCitation (
    DriverID INT NOT NULL,
    LicenseNo VARCHAR(255) NOT NULL,
    PRIMARY KEY (DriverID, LicenseNo),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (LicenseNo) REFERENCES Vehicle(LicenseNo)
);

CREATE TABLE Appeals (
    DriverID INT NOT NULL,
    CitationNo INT NOT NULL,
    AppealStatus VARCHAR(32),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (CitationNo) REFERENCES Citation(CitationNo),
    CHECK (AppealStatus in ('Requested', 'Rejected', 'Accepted'))
);
