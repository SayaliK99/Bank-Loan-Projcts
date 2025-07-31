Select * from [Bank loan data]

---Total Loan Applications
select count(id) AS Total_Loan_applications
from [Bank loan data]

---MTD Loan Applications
select count(id) As MTD_Total_Loan_applications from [Bank loan data]
where MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021

--PMTD Loan Applications
select count(id) As PMTD_Total_Loan_applications from [Bank loan data]
where MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021

----------------------------------------------------------------------------------------------
select SUM(loan_amount) As Total_funded_Amount from [Bank loan data]

select SUM(loan_amount) As MTD_Total_funded_Amount from [Bank loan data]
where Month(issue_date) = 12 And Year(issue_date)=2021

select SUM(loan_amount) As PMTD_Total_funded_Amount from [Bank loan data]
where Month(issue_date) = 11 And Year(issue_date)=2021
-----------------------------------------------------------------------------------------------

select sum(total_payment) As Total_Amount_received from [Bank loan data]

select sum(total_payment) As MTD_Total_Amount_received from [Bank loan data]
where Month(issue_date) = 12 And Year(issue_date)=2021

select sum(total_payment) As PMTD_Total_Amount_received from [Bank loan data]
where Month(issue_date) = 11 And Year(issue_date)=2021

--------------------------------------------------------------------------------------------

select Round(avg(int_rate),4) *100  AS Avg_Interest_Rate From [Bank loan data]

select Round(avg(int_rate),4) *100  AS MTD_Avg_Interest_Rate From [Bank loan data]
where Month(issue_date) = 12 And Year(issue_date)=2021

select Round(avg(int_rate),4) *100  AS PMTD_Avg_Interest_Rate From [Bank loan data]
where Month(issue_date) = 11 And Year(issue_date)=2021
--------------------------------------------------------------------------------------------

select Round(avg(dti),4)* 100 AS Avg_dti from [Bank loan data]

select Round(avg(dti),4)* 100 AS MTD_Avg_dti from [Bank loan data]
where Month(issue_date) = 12 And Year(issue_date)=2021

select Round(avg(dti),4)* 100 AS PMTD_Avg_dti from [Bank loan data]
where Month(issue_date) = 11 And Year(issue_date)=2021
--------------------------------------------------------------------------------

select
    count(case when loan_status = 'Fully paid' or loan_status = 'Current' Then id End )*100
    /
    Count(id) AS Good_loan_percentage
From [Bank loan data]

  
select count(id) AS Good_loan_applications from [Bank loan data]
where loan_status = 'fully paid' or loan_status = 'current'

select SUM(loan_amount) AS Good_loan_funded_amount from [Bank loan data]
where loan_status = 'fully paid' or loan_status = 'current'

select SUM(total_payment) AS Good_loan_received_amount from [Bank loan data]
where loan_status = 'fully paid' or loan_status = 'current'
------------------------------------------------------------------------------------------------

select
  (Count(case when loan_status = 'charged off' Then id End)*100)/
  count(id) AS Bad_loan_percentage
From [Bank loan data]

select count(id) As bad_loan_applications from [Bank loan data]
where loan_status = 'charged off'

select sum(loan_amount) As bad_loan_funded_amount from [Bank loan data]
where loan_status = 'charged off'

select sum(total_payment) As bad_loan_received_amount from [Bank loan data]
where loan_status = 'charged off'

----------------------------------------------------------------------------------------------------------------------
/**************Loan staus grid view******************************/
select
    loan_status,
	Count(id) AS Total_applications,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount,
	AVG(int_rate * 100) AS Interest_rate,
	Avg(dti * 100) AS DTI
From 
    [Bank loan data]
Group by
    loan_status

/*****************MTD total amount received and total funded amount****/

select
    loan_status,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount
From [Bank loan data]
Where Month(issue_date) = 12
Group by
    loan_status
---------------------------------------------------------------------------------------------- 
/** DASHBOARD **//
/** Monthly trends by issue dates **//

select
    Month(issue_date) AS Month_number,
	DATENAME(MONTH, issue_date) AS Month_name,
	Count(id) AS Total_funded_amount,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount
From [Bank loan data]
Group by Month(issue_date), DATENAME(MONTH, issue_date)
order by Month(issue_date)


/** Regional analysis by state**/

select
    address_state,
	Count(id) AS Total_loan_applications,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount
From [Bank loan data]
Group by address_state
order by address_state

/**Loan term analysis*****///

select
    term,
	Count(id) AS Total_loan_applications,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount
From [Bank loan data]
Group by term
order by term

/** employee length analysis **//

select
    emp_length,
	Count(id) AS Total_loan_applications,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount
From [Bank loan data]
Group by emp_length
order by emp_length

/** loan purpose analysis **//

select
    purpose,
	Count(id) AS Total_loan_applications,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount
From [Bank loan data]
Group by purpose
order by Count(id) desc             --- oordered by max loan applications

/** home ownership analysis **//
select
    home_ownership,
	Count(id) AS Total_loan_applications,
	sum(total_payment) AS Total_amount_received,
	Sum(loan_amount) AS Total_funded_amount
From [Bank loan data]
Group by home_ownership
order by Count(id) desc  
----------------------------------------------------------------------------------------


















