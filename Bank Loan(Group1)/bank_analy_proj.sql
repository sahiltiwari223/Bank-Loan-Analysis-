use bank_analytics_project;

select * from finance_1;
select * from finance_2_ms_dos;

select count(*) from finance_1;
select count(*) from finance_2_ms_dos;

# KPI 1 :- Year wise loan amount Stats
select year(issue_d) as Year_of_issue_date, sum(loan_amnt) as Total_loan_amnt
from finance_1
GROUP BY YEAR(issue_d)
Order by Year_of_issue_date;

# KPI 2 : Grade and sub grade wise revol_bal
select 
grade , sub_grade , sum(revol_bal) as total_revol_bal
from finance_1 inner join finance_2_ms_dos
on ( finance_1.id = finance_2_ms_dos.id)
group by grade, sub_grade
order by grade, sub_grade;


# KPI 3 :Total Payment for Verified Status Vs Total Payment for Non Verified Status

select distinct verification_status
from finance_1;

select verification_status , round(sum(total_pymnt),0) as total_pymnt
from finance_1 inner Join finance_2_ms_dos
on (finance_1.id = finance_2_ms_dos. id)
group by verification_status
order by total_pymnt desc ;

# KPI 4:State wise and month wise loan status

select addr_state , last_Credit_Pull_D , loan_status
from finance_1 inner Join finance_2_ms_dos
on(finance_1.id = finance_2_ms_dos.id)
group by addr_state, last_credit_pull_D, loan_status
order by loan_status;
 
 # KPI 5 : Home ownership Vs last payment date stats

select home_ownership,last_pymnt_d,round(sum(last_pymnt_amnt)) as total_amount
from finance_1
inner Join finance_2_ms_dos on (finance_1.id = finance_2_ms_dos.id)
group by home_ownership, last_pymnt_d
order by home_ownership,last_pymnt_d ;



