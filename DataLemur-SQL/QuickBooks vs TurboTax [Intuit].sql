/*  Intuit provides a range of tax filing products, including TurboTax and QuickBooks, available in various versions.
    Write a query to determine the total number of tax filings made using TurboTax and QuickBooks. Each user can file taxes once a year using only one product.
    If you find this question interesting, you may also want to try a similar question called Laptop vs Mobile Viewers!

    filed_taxes Table:
    Column Name	Type
    filing_id	integer
    user_id	varchar
    filing_date	datetime
    product	varchar

    filed_taxes Example Input:
    filing_id	user_id	filing_date	product
    1	1	4/14/2019	TurboTax Desktop 2019
    2	1	4/15/2020	TurboTax Deluxe
    3	1	4/15/2021	TurboTax Online
    4	2	4/07/2020	TurboTax Online
    5	2	4/10/2021	TurboTax Online
    6	3	4/07/2020	TurboTax Online
    7	3	4/15/2021	TurboTax Online
    8	3	3/11/2022	QuickBooks Desktop Pro
    9	4	4/15/2022	QuickBooks Online

    Example Output:
    turbotax_total	quickbooks_total
    7	            2
    
    Explanation:
    A total of 7 tax filings were made using TurboTax, while QuickBooks was used for 2 tax filings.
    The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT SUM(CASE WHEN product LIKE '%TurboTax%' THEN 1 ELSE 0 END) turbotax_total
     , SUM(CASE WHEN product LIKE '%QuickBooks%' THEN 1 ELSE 0 END) quickbooks_total
FROM filed_taxes