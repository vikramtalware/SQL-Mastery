/* Link - https://platform.stratascratch.com/coding/10064-highest-energy-consumption?code_type=1 */

WITH raw_data AS
(SELECT date
      , SUM(consumption) total_consumption
FROM
    (select date
         , consumption
    from fb_eu_energy
    UNION ALL
    select date
         , consumption
    from fb_asia_energy
    UNION ALL
    select date
         , consumption
    from fb_na_energy)a
GROUP BY 1)

SELECT date
     , total_consumption
FROM raw_data
WHERE total_consumption = (SELECT max(total_consumption) FROM raw_data)