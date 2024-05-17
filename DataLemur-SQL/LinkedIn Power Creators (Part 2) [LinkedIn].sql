/*The LinkedIn Creator team is looking for power creators who use their personal profile as a company or influencer page. 
This means that if someone's Linkedin page has more followers than all the company they work for, we can safely assume that person is a Power Creator. 
Keep in mind that if a person works at multiple companies, we should take into account the company with the most followers.

Write a query to return the IDs of these LinkedIn power creators in ascending order.

Assumptions:

A person can work at multiple companies.
In the case of multiple companies, use the one with largest follower base.
This is the second part of the question, so make sure your start with Part 1 if you haven't completed that yet!

personal_profiles Table:
Column Name	Type
profile_id	integer
name	string
followers	integer

personal_profiles Example Input:
profile_id	name	followers
1	Nick Singh	92,000
2	Zach Wilson	199,000
3	Daliana Liu	171,000
4	Ravit Jain	107,000
5	Vin Vashishta	139,000
6	Susan Wojcicki	39,000

employee_company Table:
Column Name	Type
personal_profile_id	integer
company_id	integer

employee_company Example Input:
personal_profile_id	company_id
1	4
1	9
2	2
3	1
4	3
5	6
6	5

company_pages Table:
Column Name	Type
company_id	integer
name	string
followers	integer

company_pages Example Input:
company_id	name	followers
1	The Data Science Podcast	8,000
2	Airbnb	700,000
3	The Ravit Show	6,000
4	DataLemur	200
5	YouTube	1,6000,000
6	DataScience.Vin	4,500
9	Ace The Data Science Interview	4479

Example Output:
profile_id
1
3
4
5
This output shows that profile IDs 1-5 are all power creators, meaning that they have more followers than their each of their company pages, whether they work for 1 company or 3.

The dataset you are querying against may have different input & output - this is just an example!
*/
SELECT profile_id
FROM (SELECT p.profile_id
           , p.followers p_followers
           , MAX(c.followers) c_followers
      FROM personal_profiles p
      JOIN employee_company e
        ON e.personal_profile_id = p.profile_id
      JOIN company_pages c
        ON e.company_id = c.company_id
      GROUP BY 1,2)a
WHERE p_followers > c_followers      
ORDER BY 1