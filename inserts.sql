INSERT INTO PET_OWNER(OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
              VALUES (1, 'Downs', 'Marsha', '555 537 8765', 'Marsha.Downs@somewhere.com'),
                     (2, 'James', 'Richard', '555 537 7654', 'Richard.James@somewhere.com'),
                     (3, 'Frier', 'Liz', '555 537 6543', 'Liz.Frier@somewhere.com'),
                     (4, 'Trent', 'Miles', NULL , 'Miles.Trent@somewhere.com')
INSERT INTO PET(PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerId)
        VALUES ('King', 'Dog', 'Std. Poodle', '2011-02-21', 25.5, 1),
               ('Teddy', 'Cat', 'Cashmere', '2012-02-01', 10.5, 2),
               ('Fido', 'Dog', 'Std. Poodle', '2010-07-17', 28.5, 1),
               ('AJ', 'Dog', 'Collie Mix', '2011-05-05', 20.0, 3),
               ('Cedro', 'Cat', 'Unknown', '2009-06-06', 9.5, 2),
               ('Wooley', 'Cat', 'Unknown', NULL , 9.5, 2),
               ('Buster', 'Dog', 'Border Collie', '2008-12-11' , 25.0, 4)
INSERT INTO BREED(Breed_Name, MinWeight, MaxWeight, AvgLifeSpan)
    VALUES ('Border Collie', 15, 22.5, 20),
    ('Cashmere', 10, 15, 12),
    ('Collie Mix', 17.5, 25, 18),
    ('Std. Poodle', 22.5, 30, 18),
    ('Unknown',NULL ,NULL ,NULL )
