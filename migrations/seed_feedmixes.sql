-- Seed Data for Feed Mixes
INSERT INTO feedmix (feedcode, feedname, mixdate, totalweight, createdby, datecreated, platform)
VALUES 
('MIX-001', 'High Yield Mix A1', CURRENT_DATE, 150.00, 5, CURRENT_TIMESTAMP, 'Web'),
('MIX-002', 'Calf Starter Mix', CURRENT_DATE, 75.00, 5, CURRENT_TIMESTAMP, 'Web');

-- Seed Data for Feed Mix Details
-- Mix 1: High Yield Mix A1 (ID 1)
INSERT INTO feedmixdetails (feedmixid, inventoryitemid, quantity)
VALUES 
(1, 1, 50.00), -- Dairy Meal
(1, 2, 60.00), -- Maize Germ
(1, 3, 40.00); -- Hay

-- Mix 2: Calf Starter Mix (ID 2)
INSERT INTO feedmixdetails (feedmixid, inventoryitemid, quantity)
VALUES 
(2, 2, 40.00), -- Maize Germ
(2, 3, 35.00); -- Hay
