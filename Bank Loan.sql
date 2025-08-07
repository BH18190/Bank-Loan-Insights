SELECT * FROM bank;

# Total Application Number
SELECT COUNT(id) AS Total_applications
FROM bank;

# Application Number for Last Month
SELECT COUNT(id) AS MTD
FROM bank
WHERE MONTH(issue_date) = 12;

# Application Number for The Month Before Last Month
SELECT COUNT(id) AS PMTD
FROM bank
WHERE MONTH(issue_date) = 11;

# Total Funded Amount
SELECT SUM(loan_amount) AS Total_funded
FROM bank;

# Total Funded Amount for Last Month
SELECT SUM(loan_amount) AS MTD_Total_funded
FROM bank
WHERE MONTH(issue_date) = 12;

# Total Funded Amount for The Month Before Last Month
SELECT SUM(loan_amount) AS PMTD_Total_funded
FROM bank
WHERE MONTH(issue_date) = 11;

# Total Amount Received
SELECT SUM(total_payment) AS Total_amount_received FROM bank;

# Total Amount Received for Last Month
SELECT SUM(total_payment) AS MTD_Total_amount_received FROM bank
WHERE MONTH(issue_date) = 12;

# Total Amount Received for The Month Before Last Month
SELECT SUM(total_payment) AS PMTD_Total_amount_received FROM bank
WHERE MONTH(issue_date) = 11;

# Average Interest Rate
SELECT CONCAT(ROUND(AVG(int_rate)*100,2),'%') AS Average_Interest_rate FROM bank;

# Average Interest Rate for Last Month
SELECT CONCAT(ROUND(AVG(int_rate)*100,2),'%') AS MTD_Average_Interest_rate FROM bank
WHERE MONTH(issue_date) = 12;

# Average Interest Rate for The Month Before Last Month
SELECT CONCAT(ROUND(AVG(int_rate)*100,2),'%') AS PMTD_Average_Interest_rate FROM bank
WHERE MONTH(issue_date) = 11;

# Average DTI
SELECT CONCAT(ROUND(AVG(dti)*100,2),'%') AS Average_DTI FROM bank;

# Average DTI for Last Month
SELECT CONCAT(ROUND(AVG(dti)*100,2),'%') AS MTD_Average_DTI FROM bank
WHERE MONTH(issue_date) = 12;

# Average DTI for The Month Before Last Month
SELECT CONCAT(ROUND(AVG(dti)*100,2),'%') AS PMTD_Average_DTI FROM bank
WHERE MONTH(issue_date) = 11;

# Good Loan Percentage
SELECT ROUND(SUM(CASE WHEN (loan_status = 'Fully Paid' OR loan_status = 'Current') THEN 1.0 ELSE 0.0 END)*100/COUNT(id),2) AS Good_Loan_percent
FROM bank;

# Number of Good Loan Applications
SELECT COUNT(*) AS Good_Loan_Applications FROM bank
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Total Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Total Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Good Loan Percentage
SELECT ROUND(SUM(CASE WHEN loan_status = 'Charged Off' THEN 1.0 ELSE 0.0 END)*100/COUNT(id),2) AS Bad_Loan_percent
FROM bank;

# Number of Bad Loan Applications
SELECT COUNT(*) AS Bad_Loan_Applications FROM bank
WHERE loan_status = 'Charged Off';

# Total Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank
WHERE loan_status = 'Charged Off';

# Total Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank
WHERE loan_status = 'Charged Off';

# Each Loan Status Form
SELECT COUNT(*) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received,
ROUND(AVG(int_rate)*100,2) AS Interest_Rate,
ROUND(AVG(dti)*100,2) AS DTI
FROM bank
GROUP BY loan_status;

# Each Loan Status Form for The Last Month
SELECT COUNT(*) AS MTD_Total_Loan_Applications,
SUM(loan_amount) AS MTD_Total_Funded_Amount,
SUM(total_payment) AS MTD_Total_Amount_Received,
ROUND(AVG(int_rate)*100,2) AS MTD_Interest_Rate,
ROUND(AVG(dti)*100,2) AS MTD_DTI
FROM bank
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;

# Each Loan Status Form for The Month Before Last Month
SELECT COUNT(*) AS PMTD_Total_Loan_Applications,
SUM(loan_amount) AS PMTD_Total_Funded_Amount,
SUM(total_payment) AS PMTD_Total_Amount_Received,
ROUND(AVG(int_rate)*100,2) AS PMTD_Interest_Rate,
ROUND(AVG(dti)*100,2) AS PMTD_DTI
FROM bank
WHERE MONTH(issue_date) = 11
GROUP BY loan_status;

# Bank Loan Overview in Month
SELECT MONTH(issue_date) AS Month_Number,
DATENAME(MONTH,issue_date) AS Month_name,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY MONTH(issue_date),DATENAME(MONTH,issue_date)
ORDER BY MONTH(issue_date);

# Bank Loan Overview in Address
SELECT address_state AS The_State,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY address_state
ORDER BY address_state;

# Bank Loan Overview in 36 OR 60 Month terms
SELECT term,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY term
ORDER BY term;

# Bank Loan Overview in Employee Length
SELECT emp_length AS Employee_Length,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY emp_length
ORDER BY emp_length;

# Bank Loan Overview in Different Perposes
SELECT purpose,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY purpose
ORDER BY LEN(purpose);

# Bank Loan Overview in Different Home Ownership
SELECT home_ownership,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY home_ownership
ORDER BY home_ownership;


