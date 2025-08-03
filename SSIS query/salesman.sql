SELECT 
    m.SalesmanID,
    m.FirstName,
    m.LastName,
    m.Email,
    m.PhoneNumber,
    a.AddressID,
    a.StreetAddress,
    a.City,
    a.State,
    a.ZipCode
FROM Salesman m
LEFT JOIN Address a ON m.AddressID = a.AddressID;