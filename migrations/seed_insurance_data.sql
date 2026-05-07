USE farm;

-- Seed Data for Kenyan Insurance Companies providing Livestock Insurance
INSERT INTO `insurancecompanies` (`registrationno`, `companyname`, `contacts`, `contactperson`, `email`, `address`, `created_by`) VALUES
('IRA/01/2024', 'CIC Insurance Group', '+254 703 099 120', 'John Kamau', 'livestock@cic.co.ke', 'CIC Plaza, Mara Road, Upperhill, Nairobi', 1),
('IRA/05/2024', 'APA Insurance', '+254 20 286 2000', 'Sarah Wanjiku', 'agri-support@apainsurance.org', 'Apollo Centre, Ring Road Parklands, Nairobi', 1),
('IRA/09/2024', 'Britam Holdings', '+254 703 094 000', 'Michael Omondi', 'agri-biz@britam.com', 'Britam Tower, Upperhill, Nairobi', 1),
('IRA/12/2024', 'Old Mutual Kenya', '+254 711 010 000', 'Faith Mutua', 'insurance@oldmutualkenya.com', 'Old Mutual Tower, Upperhill, Nairobi', 1),
('IRA/15/2024', 'GA Insurance', '+254 709 626 000', 'David Kiprono', 'agri.dept@gainsh.com', 'GA Insurance House, Ralph Bunche Road, Nairobi', 1);

-- Update some animals with insurance details
-- We'll assume the IDs of companies created are 1 to 5 (if starting fresh)
-- To be safe, we'll use a subquery to get IDs

SET @cic_id = (SELECT id FROM insurancecompanies WHERE companyname = 'CIC Insurance Group' LIMIT 1);
SET @apa_id = (SELECT id FROM insurancecompanies WHERE companyname = 'APA Insurance' LIMIT 1);
SET @britam_id = (SELECT id FROM insurancecompanies WHERE companyname = 'Britam Holdings' LIMIT 1);

-- Update first few animals
UPDATE animals SET is_insured = 1, insurance_company_id = @cic_id, insuranceamount = 150000.00 WHERE id IN (SELECT id FROM (SELECT id FROM animals WHERE deleted = 0 LIMIT 2) tmp);
UPDATE animals SET is_insured = 1, insurance_company_id = @apa_id, insuranceamount = 125000.00 WHERE id IN (SELECT id FROM (SELECT id FROM animals WHERE deleted = 0 AND is_insured = 0 LIMIT 2) tmp);
UPDATE animals SET is_insured = 1, insurance_company_id = @britam_id, insuranceamount = 140000.00 WHERE id IN (SELECT id FROM (SELECT id FROM animals WHERE deleted = 0 AND is_insured = 0 LIMIT 1) tmp);
