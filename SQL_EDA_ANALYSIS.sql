-- Databricks notebook source
DROP DATABASE IF EXISTS airbnb_project;

CREATE DATABASE airbnb_project ;

-- COMMAND ----------

USE airbnb_project

-- COMMAND ----------

SELECT *
FROM listings
LIMIT 2;

-- COMMAND ----------

SELECT *
FROM reviews
LIMIT 2;

-- COMMAND ----------

SELECT DISTINCT city 
FROM listings;


-- COMMAND ----------

SELECT
    city,
    ROUND(AVG(price), 2) AS average_price
FROM listings
GROUP BY city
ORDER BY average_price DESC;


-- COMMAND ----------

WITH cte_neighbourhood AS (
  SELECT 
    city,
    neighbourhood,
    room_type,
    ROUND(AVG(price), 2) AS average_price
FROM listings
GROUP BY city, neighbourhood, room_type
ORDER BY city, neighbourhood, room_type DESC
)

SELECT 
  city,
  neighbourhood,
  room_type,
  average_price 
FROM cte_neighbourhood
ORDER BY average_price DESC;


-- COMMAND ----------

WITH cte_neighbourhood AS (
  SELECT 
    city,
    neighbourhood,
    COUNT(*) AS total_count,
    ROUND(AVG(price), 2) AS average_price
  FROM listings
  GROUP BY city, neighbourhood, room_type
)

SELECT 
  city,
  neighbourhood,
  total_count,
  average_price
FROM cte_neighbourhood
GROUP BY city, neighbourhood, total_count, average_price
ORDER BY total_count DESC;

-- COMMAND ----------

WITH instant_bookable_avg_price AS (
  SELECT
    AVG(price) AS avg_instant_bookable_price
  FROM listings
  WHERE instant_bookable = 't'
),


non_instant_bookable_avg_price AS (
  SELECT
    AVG(price) AS avg_non_instant_bookable_price
  FROM
    listings
  WHERE
    instant_bookable = 'f'
)

SELECT
  avg_instant_bookable_price,
  avg_non_instant_bookable_price
FROM
  instant_bookable_avg_price,
  non_instant_bookable_avg_price;


-- COMMAND ----------

DROP TABLE IF EXISTS t_airbnb_info; 
CREATE TABLE t_airbnb_info AS
SELECT 
  l.listing_id AS l_listing_id,
  l.name AS l_name,
  l.host_id AS l_host_id,
  l.host_since AS l_host_since,
  l.host_location AS l_host_location,
  l.host_response_time AS l_host_response_time,
  l.host_response_rate AS l_host_response_rate,
  l.host_acceptance_rate AS l_host_acceptance_rate,
  l.host_is_superhost AS l_host_is_superhost,
  l.host_total_listings_count AS l_host_total_listings_count,
  l.host_has_profile_pic AS l_host_has_profile_pic,
  l.host_identity_verified AS l_host_identity_verified,
  l.neighbourhood AS l_neighbourhood,
  l.district AS l_district,
  l.city AS l_city,
  l.latitude AS l_latitude,
  l.longitude AS l_longitude,
  l.property_type AS l_property_type,
  l.room_type AS l_room_type,
  l.accommodates AS l_accommodates,
  l.bedrooms AS l_bedrooms,
  l.amenities AS l_amenities,
  l.price AS l_price,
  l.minimum_nights AS l_minimum_nights,
  l.maximum_nights AS l_maximum_nights,
  l.review_scores_rating AS l_review_scores_rating,
  l.review_scores_accuracy AS l_review_scores_accuracy,
  l.review_scores_cleanliness AS l_review_scores_cleanliness,
  l.review_scores_checkin AS l_review_scores_checkin,
  l.review_scores_communication AS l_review_scores_communication,
  l.review_scores_location AS l_review_scores_location,
  l.review_scores_value AS l_review_scores_value,
  l.instant_bookable AS l_instant_bookable,
  
  r.listing_id as r_lisitng_id,
  r.review_id AS r_review_id,
  r.date AS r_date,
  r.reviewer_id AS r_reviewer_id
FROM listings l
INNER JOIN reviews r
ON l.listing_id = r.listing_id;

SELECT * 
FROM t_airbnb_info;

-- COMMAND ----------

SELECT 
  COUNT(r_review_id) as review_count,
  EXTRACT(MONTH FROM r_date) month
FROM t_airbnb_info
GROUP BY month
ORDER BY review_count DESC;

-- COMMAND ----------

WITH cte_month_count AS (
  SELECT 
    COUNT(DISTINCT r_review_id) as review_count,
    EXTRACT(MONTH FROM r_date) as month
  FROM t_airbnb_info
  GROUP BY month
)

SELECT 
  review_count,
  month,
  (CASE 
    WHEN month IN (12, 1, 2) THEN 'WINTER'
    WHEN month IN (3, 4, 5) THEN 'SPRING'
    WHEN month IN (6, 7, 8) THEN 'SUMMER'
    WHEN month IN (9, 10, 11) THEN 'AUTUMN'
  END) as season
FROM cte_month_count
ORDER BY review_count DESC;


-- COMMAND ----------

WITH cte_host_charecteristics AS (
SELECT 
  host_id, 
  neighbourhood, 
  district, 
  city,
  host_total_listings_count,
  host_since,
  host_has_profile_pic,
  host_is_superhost,
  host_response_rate,
  host_response_time
FROM listings
)

SELECT city, ROUND(AVG(host_total_listings_count), 2) AS avg_listings
FROM cte_host_charecteristics
GROUP BY city
ORDER BY avg_listings DESC;

-- COMMAND ----------

SELECT 
  host_is_superhost,
  AVG(price) AS avg_price,
  AVG(review_scores_rating) AS avg_rating
FROM listings
GROUP BY host_is_superhost;

-- COMMAND ----------

SELECT 
  CASE 
    WHEN l_review_scores_rating > 80 THEN 'Positive'
    WHEN l_review_scores_rating BETWEEN 60 AND 80 THEN 'Neutral'
    ELSE 'Negative'
  END as review_feeling,
  COUNT(*) as review_count
FROM t_airbnb_info
GROUP BY review_feeling;


-- COMMAND ----------

WITH cte_negative_reviews (
  SELECT 
 *
FROM t_airbnb_info 
WHERE 
  CASE 
    WHEN l_review_scores_rating <= 60 THEN 'Negative'
    ELSE NULL
  END IS NOT NULL
)

SELECT
  l_city as city,
  count(*) as negative_review_count
FROM cte_negative_reviews
GROUP BY city
ORDER BY negative_review_count DESC;

-- COMMAND ----------

WITH cte_positive_reviews (
  SELECT 
 *
FROM t_airbnb_info 
WHERE 
  CASE 
    WHEN l_review_scores_rating <= 81 THEN 'Positive'
    ELSE NULL
  END IS NOT NULL
)

SELECT 
  l_city as city,
  count(*) as positive_review_count
FROM cte_positive_reviews
GROUP BY city
ORDER BY positive_review_count DESC;

-- COMMAND ----------

SELECT
  TRIM(BOTH '[]"' FROM amenity) as amenity,
  COUNT(*) as total_count,
  SUM(CASE WHEN review_scores_rating <= 60 THEN 1 ELSE 0 END) as low_review_count,
  SUM(CASE WHEN review_scores_rating > 60 THEN 1 ELSE 0 END) as high_review_count
FROM (
  SELECT
    listing_id,
    review_scores_rating,
    explode(split(amenities, ', ')) as amenity
  FROM listings
)
GROUP BY amenity
ORDER BY total_count DESC
LIMIT 15;


-- COMMAND ----------

WITH cte_amenity_count AS (
  SELECT
    TRIM(BOTH '[]"' FROM amenity) AS amenity,
    COUNT(*) AS total_count,
    SUM(CASE WHEN review_scores_rating <= 60 THEN 1 ELSE 0 END) AS low_review_count,
    SUM(CASE WHEN review_scores_rating > 60 THEN 1 ELSE 0 END) AS high_review_count
  FROM (
    SELECT
      listing_id,
      review_scores_rating,
      explode(split(amenities, ', ')) AS amenity
    FROM listings
  )
  GROUP BY amenity
)

SELECT
  amenity,
  total_count,
  low_review_count,
  high_review_count,
  low_review_count * 100.0 / total_count AS percentage_low_review,
  high_review_count * 100.0 / total_count AS percentage_high_review
FROM cte_amenity_count
ORDER BY total_count DESC
LIMIT 15;

-- COMMAND ----------

WITH cte_room_type_pop AS (
  SELECT
    room_type,
    COUNT(*) AS review_count,
    AVG(review_scores_rating) AS average_rating
  FROM listings
  WHERE review_scores_rating IS NOT NULL
  GROUP BY room_type
)

SELECT
  room_type,
  review_count,
  average_rating
FROM cte_room_type_pop
ORDER BY average_rating DESC;
