-- 3.15
SELECT PetBreed
FROM PET

-- 3.16
SELECT COUNT(*) AS NumberOfPets
FROM PET

-- 3.17
SELECT
  OwnerLastName,
  OwnerFirstName,
  OwnerEmail
FROM PET_OWNER
WHERE (OwnerPhone IS NULL)

-- 3.18
SELECT
  PetBreed,
  PetType,
  PetDOB
FROM PET
WHERE (PetType = 'Dog')

-- 3.19
SELECT
  PetID,
  PetName,
  PetType,
  PetBreed,
  PetDOB,
  PetWeight,
  OwnerID
FROM PET
-- same as
SELECT *
FROM PET;

-- 3.20
SELECT *
FROM PET_OWNER
WHERE OwnerEmail LIKE '%somewhere.com'

-- 3.21
SELECT *
FROM PET
WHERE PetType = 'Dog' AND PetBreed = 'Std. Poodle'

-- 3.22
SELECT *
FROM PET
WHERE PetType <> 'Dog' AND PetType <> 'Cat' AND PetType <> 'Fish'
-- same as
SELECT *
FROM PET
WHERE PetType NOT IN ('Dog', 'Cat', 'Fish')

-- 3.24
SELECT DISTINCT PetBreed
FROM PET

-- 3.26
SELECT
  PetName,
  PetBreed
FROM PET
ORDER BY PetName

-- 3.29
SELECT COUNT(DISTINCT PetBreed)
FROM PET

-- 3.31
SELECT
  MIN(PetWeight) AS MinWeight,
  AVG(PetWeight) AS AvgWeight,
  max(PetWeight) AS MaxWeight
FROM PET
WHERE PetType = 'Dog'
-- 3.32
SELECT
  PetBreed,
  avg(PetWeight) AS AvgWeight
FROM PET
GROUP BY PetBreed
-- 3.33
SELECT
  PetBreed,
  avg(PetWeight) AS AvgWeight
FROM PET
GROUP BY PetBreed
HAVING COUNT(*) >= 2
-- 3.34
SELECT
  PetBreed,
  avg(PetWeight) AS AvgWeight
FROM PET
GROUP BY PetBreed
HAVING COUNT(*) >= 2 AND PetBreed <> 'Unknown'

-- 3.35
SELECT *
FROM PET_OWNER
WHERE OwnerID IN (SELECT OwnerID
                  FROM PET
                  WHERE PetType = 'Cat')

-- 3.36
SELECT *
FROM PET_OWNER
WHERE OwnerID IN (SELECT OwnerID
                  FROM PET
                  WHERE PetType = 'Cat' AND PetName = 'Teddy')

-- 3.37
CREATE TABLE BREED (
  Breed_Name  VARCHAR(30) PRIMARY KEY,
  MinWeight   INT,
  MaxWeight   INT,
  AvgLifeSpan FLOAT
)
ALTER TABLE BREED
  ALTER COLUMN MinWeight FLOAT
ALTER TABLE BREED
  ALTER COLUMN MaxWeight FLOAT
-- sd
SELECT *
FROM PET_OWNER
WHERE OwnerID IN (
  SELECT OwnerID
  FROM PET
  WHERE PetBreed IN (
    SELECT Breed_Name
    FROM BREED
    WHERE AvgLifeSpan > 15
  )
)
-- 3.38
SELECT DISTINCT
  OwnerLastName,
  OwnerFirstName,
  OwnerEmail
FROM PET_OWNER
  JOIN PET ON PET_OWNER.OwnerID = PET.OwnerId
WHERE PetType = 'Cat'


-- 3.39

SELECT DISTINCT
  OwnerLastName,
  OwnerFirstName,
  OwnerEmail
FROM PET_OWNER
  INNER JOIN PET ON PET_OWNER.OwnerID = PET.OwnerId
WHERE PetType = 'Cat' AND PetName = 'Teddy'

-- 3.40

SELECT DISTINCT
  OwnerLastName,
  OwnerFirstName,
  OwnerEmail
FROM PET_OWNER
  INNER JOIN PET ON PET_OWNER.OwnerID = PET.OwnerId
  INNER JOIN BREED ON PET.PetBreed = BREED.Breed_Name
WHERE AvgLifeSpan > 15

-- 3.41
SELECT
  OwnerLastName,
  OwnerFirstName,
  PetName,
  PetType,
  PetBreed,
  AvgLifeSpan
FROM PET_OWNER
INNER JOIN PET ON PET_OWNER.OwnerID = PET.OwnerId
INNER JOIN BREED ON PET.PetBreed = BREED.Breed_Name
WHERE PET.PetBreed<>'Unknown'

