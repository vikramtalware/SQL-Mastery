/*
In consulting, being "on the bench" means you have a gap between two client engagements. 
Google wants to know how many days of bench time each consultant had in 2021. 
Assume that each consultant is only staffed to one consulting engagement at a time.
Write a query to pull each employee ID and their total bench time in days during 2021.

Assumptions:

All listed employees are current employees who were hired before 2021.
The engagements in the consulting_engagements table are complete for the year 2022.

staffing Table:
Column Name	Type
employee_id	integer
is_consultant	boolean
job_id	integer

staffing Example Input:
employee_id	is_consultant	job_id
111	true	7898
121	false	6789
156	true	4455

consulting_engagements Table:
Column Name	Type
job_id	integer
client_id	integer
start_date	date
end_date	date
contract_amount	integer

consulting_engagements Example Input:
job_id	client_id	start_date	end_date	contract_amount
7898	20076	05/25/2021 00:00:00	06/30/2021 00:00:00	11290.00
6789	20045	06/01/2021 00:00:00	11/12/2021 00:00:00	33040.00
4455	20001	01/25/2021 00:00:00	05/31/2021 00:00:00	31839.00

Example Output:
employee_id	bench_days
111	328
156	238

Explanation
Employee 111 had 328 days of bench time in 2021.
To calculate the 328 days of bench time for employee id 111, we first calculate their total number of work days, between start date 05/25/2021 & end date 06/30/2021.
 Then we subtract this work time from 365 (days in a year) to get the number of bench days: 328.
The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT s.employee_id
     , 365 - SUM((end_date - start_date)+1) days -- +1 because end_date should be inclusive
FROM staffing s
JOIN consulting_engagements c
  ON c.job_id = s.job_id
WHERE s.is_consultant = 'true'
GROUP BY 1;