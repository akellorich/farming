DROP PROCEDURE IF EXISTS `sp_getvaccinationhistory`;
CREATE PROCEDURE `sp_getvaccinationhistory`()
BEGIN
    SELECT 
        v.id,
        v.vaccinationdate as date,
        v.productused as product,
        v.batchno as batch,
        v.dosage,
        v.administeredby as vet,
        v.record_type,
        a.tagid as animal_code,
        a.name as animal_name,
        'Completed' as status
    FROM vaccinations v
    JOIN animals a ON v.animalid = a.id
    ORDER BY v.vaccinationdate DESC;
END;

DROP PROCEDURE IF EXISTS `sp_getdeworminghistory`;
CREATE PROCEDURE `sp_getdeworminghistory`()
BEGIN
    SELECT 
        d.id,
        d.dewormingdate as date,
        d.productused as product,
        d.method,
        d.dosage,
        d.administeredby as vet,
        d.record_type,
        a.tagid as animal_code,
        a.name as animal_name,
        'Completed' as status
    FROM deworming d
    JOIN animals a ON d.animalid = a.id
    ORDER BY d.dewormingdate DESC;
END;
