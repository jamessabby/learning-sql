-- Add add a column to an existing table
ALTER TABLE job_applied
ADD contact VARCHAR(50);

-- Modify the row
UPDATE job_applied
SET contact = 'James Sabio'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Elisha Notarte'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Aostri Maurice'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Hev Sabby'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Chai Chai'
WHERE job_id = 5;

-- Rename the column
ALTER TABLE job_applied
RENAME COLUMN contact to contact_name;

-- Change the data type of interegers
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE INT; 

-- Delete a column
ALTER TABLE job_applied
DROP COLUMN contact_name;

-- Delete the ENTIRE table
DROP TABLE job_applied;