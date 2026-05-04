-- SEED ADDITIONAL ANIMALS WITH KENYAN NAMES AND VARIED STATUSES
-- Note: Assuming breeds 1-5 and pens 1-5 exist as per tables.sql

INSERT INTO `animals` (`tagid`, `designatedname`, `breedid`, `penid`, `status`, `birthdate`, `initialweight`, `addedby`) VALUES 
('JK-2024-00005', 'Wanjiku', 1, 2, 'Lactating', '2020-05-15', 450.0, 5),
('JK-2024-00006', 'Muthoni', 2, 2, 'Lactating', '2021-03-10', 420.0, 5),
('JK-2024-00007', 'Akinyi', 4, 5, 'Dry', '2019-11-20', 480.0, 5),
('JK-2024-00008', 'Nekesa', 1, 1, 'Pregnant', '2020-08-05', 460.0, 5),
('JK-2024-00009', 'Zawadi', 3, 2, 'Active', '2022-01-12', 380.0, 5),
('JK-2024-00010', 'Zuhura', 2, 4, 'Sick', '2021-06-25', 410.0, 5),
('JK-2024-00011', 'Amani', 4, 2, 'Lactating', '2020-12-30', 440.0, 5),
('JK-2024-00012', 'Mumbi', 1, 5, 'Dry', '2019-09-15', 495.0, 5),
('JK-2024-00013', 'Njeri', 3, 1, 'Pregnant', '2021-02-20', 430.0, 5),
('JK-2024-00014', 'Atieno', 5, 2, 'Active', '2022-04-10', 350.0, 5);

-- Update serials to reflect the new count
UPDATE `serials` SET `currentno` = 15 WHERE `document` = 'Animal Tag';

-- Add some milk collection data for the lactating ones
INSERT INTO `milkcollection` (`logdate`, `scheduleid`, `animalid`, `quantitylitres`, `addedby`) VALUES 
(CURDATE(), 1, 5, 15.5, 5),
(CURDATE(), 1, 6, 11.2, 5),
(CURDATE(), 1, 11, 13.8, 5);
