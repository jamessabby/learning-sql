/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues & Fixes:

Possible Errors:
1. ERROR: could not open file "...": Permission denied
   - Cause: PostgreSQL server process does not have permission to read files in user directories (C:\Users\...).
   - Solution: Use the `\copy` meta-command in PSQL Tool / terminal instead of `COPY`, OR copy CSV files to a public folder (e.g., C:\Users\Public\ or Postgres data folder).

2. ERROR: duplicate key value violates unique constraint
   - Cause: The script was executed multiple times, trying to insert duplicate primary keys.
   - Solution: Truncate tables before loading (e.g. TRUNCATE company_dim, skills_dim, job_postings_fact, skills_job_dim CASCADE;).

3. ERROR: syntax error at or near "\" (when using backslashes)
   - Solution: Use forward slashes (`/`) in file paths on Windows in PostgreSQL.

=============================================================================
Option A (Recommended if you get Permission Denied): Run in PSQL Console/Tool
=============================================================================
\copy company_dim FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
*/

-- =============================================================================
-- Option B: Standard SQL COPY (Requires PostgreSQL server file access permission)
-- =============================================================================

\copy company_dim FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'C:/Users/James/OneDrive/Documents/Code/tutorials/SQL/csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');