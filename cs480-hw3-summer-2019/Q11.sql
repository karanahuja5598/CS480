SELECT Company.COMPANY_NAME, AVG(Employment.SALARY) AS TOTAL_SALARY
FROM Employment RIGHT JOIN Company ON Employment.COMPANY_NAME = Company.COMPANY_NAME
GROUP BY COMPANY_NAME
ORDER BY COMPANY_NAME ASC;
