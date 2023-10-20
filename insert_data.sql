INSERT INTO
    Staff (StaffID, Role)
VALUES
    (1, 'Admin'),
    (2, 'Security'),
    (3, 'Admin'),
    (4, 'Security'),
    (5, 'Admin'),
    (6, 'Security'),
    (7, 'Admin'),
    (8, 'Security'),
    (9, 'Security');

INSERT INTO
    Driver (DriverID, DriverName, Status)
VALUES
    (123456789, 'John Doe', 'S'),
    (987654321, 'Jane Smith', 'E'),
    (234567891, 'Alice', 'S'),
    (567891234, 'Bob', 'E'),
    (891234567, 'Charlie', 'S'),
    (345678912, 'Eve', 'E'),
    (789123456, 'Ivan', 'V'),
    (912345678, 'Mallory', 'V'),
    (876543219, 'Trent', 'S');

INSERT INTO
    VehicleModelManufacturer (Model, Manufacturer)
VALUES
    ('Camry', 'Toyota'),
    ('Civic', 'Honda'),
    ('Explorer', 'Ford'),
    ('3 Series', 'BMW'),
    ('Altima', 'Nissan'),
    ('Tahoe', 'Chevrolet'),
    ('Elantra', 'Hyundai'),
    ('C-Class', 'Mercedes'),
    ('Optima', 'Kia');

INSERT INTO 
    Vehicle  (LicenseNo, DriverID, Model, Color, Year, VehicleCategory) 
VALUES
('XYZ123', 123456789, 'Camry', 'Red', 2020, 'Regular'),
('ABC789', 987654321, 'Civic', 'Blue', 2019, 'Electric'),
('DEF456', 234567891, 'Explorer', 'Black', 2021, 'Compact car'),
('GHI012', 567891234, '3 Series', 'White', 2022, 'Handicap'),
('JKL345', 891234567, 'Camry', 'Green', 2018, 'Regular'),
('MNO678', 345678912, 'Explorer', 'Grey', 2022, 'Regular'),
('PQR901', 789123456, 'Civic', 'Yellow', 2020, 'Regular'),
('STU234', 912345678, '3 Series', 'Brown', 2019, 'Regular'),
('VWX567', 876543219, 'Camry', 'Silver', 2021, 'Regular');

INSERT INTO 
    Permit (PermitID, StaffID, LicenseNo, StartDate, ExpirationDate, ExpirationTime, PermitType) 
VALUES
(1, 1, 'XYZ123', '2023-01-01', '2024-01-01', '18:00:00', 'Residential'),
(2, 2, 'ABC789', '2023-02-01', '2024-02-01', '20:00:00', 'Commuter'),
(3, 3, 'DEF456', '2023-03-01', '2024-03-01', '19:00:00', 'Peak Hours'),
(4, 4, 'GHI012', '2023-04-01', '2024-04-01', '21:00:00', 'Special Event'),
(5, 5, 'JKL345', '2023-05-01', '2024-05-01', '22:00:00', 'Park & Ride'),
(6, 6, 'MNO678', '2023-06-01', '2024-06-01', '23:00:00', 'Residential'),
(7, 7, 'PQR901', '2023-07-01', '2024-07-01', '17:00:00', 'Commuter'),
(8, 8, 'STU234', '2023-08-01', '2024-08-01', '16:00:00', 'Peak Hours'),
(9, 9, 'VWX567', '2023-09-01', '2024-09-01', '15:00:00', 'Special Event');

INSERT INTO 
    DriverVehiclePermit (DriverID, LicenseNo) 
VALUES
(123456789, 'XYZ123'),
(987654321, 'ABC789'),
(234567891, 'DEF456'),
(567891234, 'GHI012'),
(891234567, 'JKL345'),
(345678912, 'MNO678'),
(789123456, 'PQR901'),
(912345678, 'STU234'),
(876543219, 'VWX567');

INSERT INTO
    ParkingLot (PLName, StaffID, Address)
VALUES
    ('Lot A', 1, '123 Main St'),
    ('Lot B', 2, '456 Elm St'),
    ('Lot C', 3, '789 Oak St'),
    ('Lot D', 4, '012 Maple St'),
    ('Lot E', 5, '345 Birch St'),
    ('Lot F', 6, '678 Pine St'),
    ('Lot G', 7, '901 Cedar St'),
    ('Lot H', 8, '234 Spruce St'),
    ('Lot I', 9, '567 Fir St');

INSERT INTO Zone (PLName, ZoneID)
VALUES
    ('Lot A', 'A'),
    ('Lot B', 'B'),
    ('Lot C', 'C'),
    ('Lot D', 'D'),
    ('Lot E', 'AS'),
    ('Lot F', 'BS'),
    ('Lot G', 'CS'),
    ('Lot H', 'DS'),
    ('Lot I', 'V');

INSERT INTO
    Space (PLName, ZoneID, SpaceNo, SpaceType)
VALUES
    ('Lot A', 'A', 1, 'Regular'),
    ('Lot B', 'B', 2, 'Handicap'),
    ('Lot C', 'C', 3, 'Electric'),
    ('Lot D', 'D', 4, 'Compact car'),
    ('Lot E', 'AS', 5, 'Regular'),
    ('Lot F', 'BS', 6, 'Handicap'),
    ('Lot G', 'CS', 7, 'Electric'),
    ('Lot H', 'DS', 8, 'Compact car'),
    ('Lot I', 'V', 9, 'Regular');

INSERT INTO
    PermitLocation (PermitID, PLName, ZoneID, SpaceNo)
VALUES
    (1, 'Lot A', 'A', 1),
    (2, 'Lot B', 'B', 2),
    (3, 'Lot C', 'C', 3),
    (4, 'Lot D', 'D', 4),
    (5, 'Lot E', 'AS', 5),
    (6, 'Lot F', 'BS', 6),
    (7, 'Lot G', 'CS', 7),
    (8, 'Lot H', 'DS', 8),
    (9, 'Lot I', 'V', 9);

INSERT INTO
    ParkingLocation (
        PLName,
        ZoneID,
        SpaceNo,
        StaffID,
        AvailabilityStatus
    )
VALUES
    ('Lot A', 'A', 1, 1, TRUE),
    ('Lot B', 'B', 2, 2, TRUE),
    ('Lot C', 'C', 3, 3, FALSE),
    ('Lot D', 'D', 4, 4, TRUE),
    ('Lot E', 'AS', 5, 5, FALSE),
    ('Lot F', 'BS', 6, 6, TRUE),
    ('Lot G', 'CS', 7, 7, FALSE),
    ('Lot H', 'DS', 8, 8, TRUE),
    ('Lot I', 'V', 9, 9, FALSE);

INSERT INTO
    CitationCategory (CitationName, Fees)
VALUES
    ('Invalid Permit', 25.00),
    ('Expired Permit', 30.00),
    ('No Permit', 40.00);

INSERT INTO 
    Citation (CitationNo, CitationDate, CitationTime, PaymentStatus, StaffID, LicenseNo, PLName, CitationName) 
VALUES
    (1, '2023-01-10', '10:00:00', 'Pending', 1, 'XYZ123', 'Lot A', 'Invalid Permit'),
    (2, '2023-01-15', '11:00:00', 'Complete', 2, 'ABC789', 'Lot B', 'Expired Permit'),
    (3, '2023-01-20', '12:00:00', 'Not Required', 3, 'DEF456', 'Lot C', 'No Permit'),
    (4, '2023-01-25', '13:00:00', 'Pending', 4, 'GHI012', 'Lot D', 'Invalid Permit'),
    (5, '2023-02-01', '14:00:00', 'Complete', 5, 'JKL345', 'Lot E', 'Expired Permit'),
    (6, '2023-02-10', '15:00:00', 'Not Required', 6, 'MNO678', 'Lot F', 'No Permit'),
    (7, '2023-02-15', '16:00:00', 'Pending', 7, 'PQR901', 'Lot G', 'Invalid Permit'),
    (8, '2023-02-20', '17:00:00', 'Complete', 8, 'STU234', 'Lot H', 'Expired Permit'),
    (9, '2023-02-25', '18:00:00', 'Not Required', 9, 'VWX567', 'Lot I', 'No Permit');

INSERT INTO 
    DriverVehicleCitation (DriverID, LicenseNo) 
VALUES
    (123456789, 'XYZ123'),
    (987654321, 'ABC789'),
    (234567891, 'DEF456'),
    (567891234, 'GHI012'),
    (891234567, 'JKL345'),
    (345678912, 'MNO678'),
    (789123456, 'PQR901'),
    (912345678, 'STU234'),
    (876543219, 'VWX567');

INSERT INTO 
    Appeals (DriverID, CitationNo, AppealStatus) 
VALUES
    (123456789, 1, 'Requested'),
    (987654321, 2, 'Rejected'),
    (234567891, 3, 'Accepted'),
    (567891234, 4, 'Requested'),
    (891234567, 5, 'Rejected'),
    (345678912, 6, 'Accepted'),
    (789123456, 7, 'Requested'),
    (912345678, 8, 'Rejected'),
    (876543219, 9, 'Accepted');