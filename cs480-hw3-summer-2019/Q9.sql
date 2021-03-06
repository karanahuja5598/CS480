SELECT Employee.PERSON_NAME, Company.COMPANY_NAME
FROM (Employee INNER JOIN Employment ON Employee.PERSON_NAME = Employment.PERSON_NAME) INNER JOIN Company ON Employment.COMPANY_NAME = Company.COMPANY_NAME
WHERE Employee.CITY != Company.CITY
ORDER BY PERSON_NAME ASC;
