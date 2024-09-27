SELECT *
FROM prescriber;

--Question 1
SELECT npi, drug_name, total_claim_count
FROM prescription
ORDER BY total_claim_count DESC;
--The query above gives the highest npi
SELECT *
FROM prescriber
WHERE npi = '1912011792';
--The query above uses the npi to find the nppes info of the Dr
SELECT SUM(total_claim_count)
FROM prescription
WHERE npi = '1912011792';
--The query above adds all of the total claim counts associated with the npi

-- Question 2
SELECT *
FROM prescriber;

SELECT *
FROM prescription INNER JOIN prescriber USING (npi)
ORDER BY total_claim_count DESC;

WITH opioid_claims AS (SELECT *
						FROM prescription INNER JOIN prescriber USING (npi)
						ORDER BY total_claim_count DESC)

SELECT opioid_drug_flag, drug_name
FROM drug

SELECT DISTINCT (specialty_description)
FROM prescriber

-- Question 3
SELECT DISTINCT *
FROM drug;

SELECT total_drug_cost_ge65, drug_name, generic_name
FROM prescription INNER JOIN drug USING (drug_name)
WHERE total_drug_cost_ge65 IS NOT NULL
ORDER BY total_drug_cost_ge65 DESC;
--generic drug name with highest cost

SELECT (total_drug_cost/30) AS total_drug_cost_day, total_30_day_fill_count, drug_name, generic_name
FROM prescription INNER JOIN drug USING (drug_name)
ORDER BY total_drug_cost_day DESC
-- highest drug cost per day

SELECT total_drug_cost
FROM prescription

--total_30_day_fill_count is the total number of pills recieved for a 30 day period

-- Question 4

SELECT drug_name, opioid_drug_flag, antibiotic_drug_flag
FROM drug;
--Use CASE

-- Question 5
SELECT *
FROM cbsa
WHERE cbsaname LIKE '%TN';
-- 33 rows that have cbsa in TN
SELECT *
FROM cbsa

SELECT * 
FROM cbsa INNER JOIN population USING (fipscounty)

SELECT DISTINCT (cbsa), cbsaname, fipscounty, population
FROM cbsa INNER JOIN population USING (fipscounty)
WHERE cbsaname LIKE '%TN'
ORDER BY population DESC



SELECT *
FROM population INNER JOIN fips_county USING (fipscounty)
ORDER BY population DESC
--SHELBY County, TN with 937847 pop

-- Question 6

SELECT *
FROM prescription

-- Question 7