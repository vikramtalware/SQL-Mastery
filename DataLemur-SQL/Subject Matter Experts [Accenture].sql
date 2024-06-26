/*You are tasked with identifying Subject Matter Experts (SMEs) at Accenture based on their work experience in specific domains. 
 An employee qualifies as an SME if they meet either of the following criteria:

They have 8 or more years of work experience in a single domain.
They have 12 or more years of work experience across two different domains.
Write a query to return the employee IDs of all the subject matter experts at Accenture.

Assumption:

An employee can only be considered an SME if they meet the experience requirements in either one or two domains. Cases where an employee has experience in more than two domains can be disregarded.
Effective June 12th, 2023, the problem statement, assumption, and solution have been revised.

employee_expertise Table:
Column Name	Type
employee_id	integer
domain	string
years_of_experience	integer

users Example Input:
employee_id	domain	years_of_experience
101	Digital Transformation	9
102	Supply Chain	6
102	IoT	7
103	Change Management	4
104	DevOps	5
104	Cloud Migration	5
104	Agile Transformation	5

Example Output:
employee_id
101
102

Explanation:
Employee ID 101 has 9 years of experience in the "Digital Transformation" domain. This exceeds the minimum requirement of 8 years of experience in a single domain, making them a subject matter expert.
Employee ID 102 has 6 years of experience in the "Supply Chain" domain and 7 years of experience in the "IoT" domain. While individually these fall short of the 8-year requirement, 
their total years of experience across the two domains (6 + 7 = 13) meet the criteria for subject matter expertise.
Based on these evaluations, employee IDs 101 and 102 are the subject matter experts as they meet the specified criteria. Therefore, they are included in the output.

The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT employee_id
FROM employee_expertise
GROUP BY employee_id
HAVING (SUM(years_of_experience) >= 8 AND COUNT(DISTINCT domain) = 1) 
    OR (SUM(years_of_experience) >=12 AND COUNT(DISTINCT domain) = 2);