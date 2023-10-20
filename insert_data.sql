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

