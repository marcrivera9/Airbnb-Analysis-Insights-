# Airbnb-Analysis-Insights-
# Introduction 
This data analysis by (check out my LinkedIn profile here: https://www.linkedin.com/in/marcrivera9/), dove into the intricacies of Airbnb requests with one main goal in mind: boosting profits. Let's explore the findings together and uncover ways to make the most out of Airbnb engagements.
# Objective
In this simulated Airbnb data analysis project, the primary objective was to address four key requests: maximizing revenue, enhancing host engagement, improving guest satisfaction, and strategic planning. Leveraging tools such as Databricks and SQL Spark, I delved into the data to extract insights tailored to each request. For revenue optimization, advanced analytics were applied to identify opportunities and formulate strategic recommendations. Host engagement was improved through the analysis of interaction patterns using SQL Spark, while Python was exclusively for visualization. Additionally, strategic planning analysis utilized Databricks and SQL Spark to offer insights and recommendations for Airbnb's future growth and success. The project aimed to not only understand but also address these requests, providing Airbnb with actionable strategies and insights for improvement.

# Tools
* Databricks
* Microsoft Azure
* SQL
* Python

# Steps 
1. Environment Setup:
   
* Begin by setting up your data analysis environment. Install and configure Databricks, ensuring the proper integration with Apache Spark, go ro Databricks.com to get free version. I chose Microsoft Azure as my cloud.
  ![databrciks_sign_up](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/5ea6f6e9-0dd7-49f3-9af1-1b440760a9c4)
* You need to create your own cluster there is a two week trial on azure. See below, you need make the rescource group then open workspace in Databricks.
  
![azure_set_up](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/882f09b1-4d00-4743-9c67-6244be4a21e3)

* After done completing cluster. Press on azure databricks and should send you to Launch page.

![databricks_launch](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/1f660ade-2087-4f2e-9a7a-ff5a7d804f19)

* Establish connections to relevant data sources within Airbnb, ensuring data accessibility for analysis. Start Cluster, press play button or when you first sign hit the compute on databricks and your cluser should be created. Press Play.

![cluster_running](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/24e3fac6-8481-429a-8010-9b5334af6b78)

* Load your needed files, this is pretty easy in databricks, there is a data page, add files, but first need to create database and notebook. 
* If you have ever used Jupyter notebooks its the same thing, go to workspace and create notebook

![notebook_creation](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/905f75fa-05a2-4e72-b0f7-96291be2d7b5)

* Then create database using SQL Definitions

![database_creation](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/bdb8c2b0-8fb3-4193-afa3-2d3d195f8838)

* Now we can create tables using our imported files. This is in the add data area. Very simple process, but make sure your schema, is under the database you created.

![create_first_table_listings](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/80a0b3ea-621d-4e45-b978-0573a57fec21)
![create_second_table_reviews](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/1c542e84-dc2a-43f1-95f8-569f3aaa01eb)

Now we are ready to start our next data analysis.


2. Data Exploration: (will be indepth next section)
  
* Utilize Databricks for initial data exploration, gaining a holistic understanding of the Airbnb dataset.
* Employ SQL Spark queries to extract and examine essential data points related to revenue, host engagement, guest satisfaction, and strategic planning.
* Analyze host interaction patterns using SQL Spark, focusing on key behaviors and trends.
* Develop actionable strategies to strengthen the connection between Airbnb and its hosts.
* Explore guest satisfaction metrics using Databricks and SQL Spark for initial analysis.
* Document each step of the analysis process, including code snippets, queries, and key findings.

3. Create Visualizations and Summarize, PPT (PPT in files above)

*  Create visualizations using Python for an effective presentation of insights.
* Summarize recommendations and strategies for each focus area in a clear and concise manner.
* Provide recommendations to enhance the overall guest experience on Airbnb

# Exploratory Data Analysis (EDA)

* I first verified tables imported correctly

![verify_tables](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/efb98436-9644-4355-b79f-21691093b89f)


## Pricing Patterns

### What are the average prices across the 10 major cities?

![avg_price_per_stay_per_city](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/8d21ab62-2536-4613-95ac-d26dadcdc07a)

* These prices are in local currency so I will be translating them to our US currency
1. Cape town =~ $131.12
2. Bangkok =~ $58.75
3. Mexico City =~ $66.71
4. Hong Kong =~ $95.68
5. Rio de Janeiro =~ $151.25
6. Istanbul =~ $18.55
7. Sydney =~ $144.64
8. New York = $142.84
9. Paris =~ $123.32
10. Rome =~ $114.59

#### The array of average prices for Airbnb accommodations in these major cities not only underscores the diversity of markets served by the platform but also poses strategic considerations for Airbnb's business. On a positive note, the varying price points offer Airbnb a competitive edge by catering to travelers with different budget preferences. The affordability of destinations like Istanbul may attract cost-conscious travelers, enhancing Airbnb's appeal. Moreover, higher-priced cities such as Sydney and Rio de Janeiro contribute significantly to Airbnb's revenue. However, this pricing diversity also brings challenges. Economic disparities and regulatory scrutiny based on affordability concerns in high-priced cities may impact Airbnb's revenue stream and operational strategies. Striking a delicate balance in pricing to align with local economies, traveler expectations, and regulatory frameworks will be pivotal for Airbnb's sustained success and positive brand perception amidst this diverse pricing landscape.The array of average prices for Airbnb accommodations in these major cities not only underscores the diversity of markets served by the platform but also poses strategic considerations for Airbnb's business. On a positive note, the varying price points offer Airbnb a competitive edge by catering to travelers with different budget preferences. The affordability of destinations like Istanbul may attract cost-conscious travelers, enhancing Airbnb's appeal. Moreover, higher-priced cities such as Sydney and Rio de Janeiro contribute significantly to Airbnb's revenue. However, this pricing diversity also brings challenges. Economic disparities and regulatory scrutiny based on affordability concerns in high-priced cities may impact Airbnb's revenue stream and operational strategies. For example, I recently was in Brazil and the brazilians hate the Airbnbs because they cause rent to skyrocket. Striking a delicate balance in pricing to align with local economies, traveler expectations, and regulatory frameworks will be pivotal for Airbnb's sustained success and positive brand perception amidst this diverse pricing landscape. (Please note that this is todays excahnge rates this may have differed years ago, for example we know the turkish lira took a dip. May affect the averge price now)

### How do prices vary between different room types and neighborhoods?

![neighbour_hood_avg_procve](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/a8dd8669-b294-4ec4-9a2d-b43971876377)

#### This dataset will be the datasets files above. Diving into the dataset, a compelling insight emerges as we scrutinize the distribution of neighborhoods and room types across major cities. The data unravels the geographical tapestry of Airbnb listings, shedding light on the diverse neighborhoods within each city. This exploration not only highlights popular hubs but also underscores the platform's reach into various corners of these metropolitan landscapes. Beyond geography, the dataset allows us to delve into the preferences of Airbnb users regarding room types. It reveals whether certain cities lean towards offering entire homes, private rooms, or shared spaces, reflecting the nuanced accommodation choices of travelers. Additionally, by examining price disparities across neighborhoods, we gain insights into the economic dynamics of these urban landscapes. This exploration provides valuable information for hosts seeking to optimize their offerings and for travelers seeking the ideal neighborhood and accommodation type tailored to their preferences. Overall, this analysis can help management find their success and maybe introduce a higher price implementation to further profits.

### Does price vary if its instantly bookable? 

![instant](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/952c3751-6d33-4797-879b-b7d8abd5f28e)

#### The observed trend in average prices, with instantly bookable listings commanding approximately $100 more than their non-instant counterparts, presents a noteworthy insight for Airbnb's strategic considerations. On one hand, encouraging hosts to enable instant bookings can be advantageous for Airbnb, as it tends to correlate with higher average prices, potentially enhancing the platform's overall revenue. However, it's essential to recognize the potential challenges for hosts who may prefer the ability to preview and vet guests before confirming a booking. This trade-off underscores the delicate balance Airbnb must strike between streamlining the booking process for guests and respecting the preferences and safety concerns of hosts. Strategic communication and incentivization strategies may be key in encouraging hosts to adopt instant bookings while addressing their concerns, ultimately fostering a more seamless and mutually beneficial experience for both hosts and guests on the platform.

### My next step was to combine both reviews table and listings table to further analysis and create a table (sorry for the messy query)

![conmbine](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/95f6c533-0745-4ed7-8ede-4a3e8cf69ad2)


## Sesonality

### What month had the most bookings? 

![month](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/a089409a-31e1-4f1d-a942-d968ba129c80)

### Does season play a factor?

![season](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/993ac366-9676-4e09-bf6f-a4835e998b79)


#### The provided tables reveal a fluctuating pattern in Airbnb review counts across the months of the year. Notable peaks in June, July, and August suggest heightened user activity during the summer, potentially influenced by vacation trends. The surge in review counts in November and December points to increased travel and accommodation bookings during the holiday season. Conversely, January exhibits a substantial drop in review counts, likely reflective of reduced travel activity post-holidays. The mid-year months, particularly May and June, display lower review counts, indicating potential seasonal variations or specific factors affecting travel during these periods. Overall, the trend shows a decline in review counts from January to June, followed by a gradual increase from July onwards, suggesting an overall growth or variability in Airbnb activity throughout the year. Please note this data will be more accurate with a longer timeframe and external factors.


## Host Characteristics

### What is the average listing per host? 

![avg_listings_per_host_per_city](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/4874226c-c19c-4cd9-a810-f7449fc308e7)

#### Examining the average number of listings per host across various major cities unveils intriguing insights into the dynamics of Airbnb hosting. Cities like Hong Kong and Sydney stand out with high averages, indicating a vibrant hosting community and diverse accommodation options managed by individual hosts. Conversely, cities such as New York showcase a lower average, suggesting a potentially more competitive market or regulatory constraints influencing host practices. The descending order from Hong Kong to Mexico City illustrates a spectrum of hosting scales, reflecting diverse approaches to property management. Higher averages might signify hosting efficiency and expertise, while lower averages could indicate a more selective or focused hosting strategy. These variations shed light on market maturity, with established markets potentially hosting more experienced hosts. Understanding these insights equips Airbnb to tailor its support and strategies to accommodate the unique hosting landscapes of different cities, considering factors such as competition, regulatory influence, and market maturity. This can also help new hosts join a market that is not to inflated by mega hosts or vice versa.

### Does being a superhost matter? 

![superhost_price_review](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/8e8def49-1789-4f66-a8ad-122e52152c07)

#### The provided data illuminates compelling insights into the dynamics of Airbnb hosting, particularly in relation to superhost status, average pricing, and guest satisfaction. The correlation between superhost status and higher average pricing, coupled with the highest average ratings for superhost listings, underscores the influential role of the superhost designation in shaping both pricing strategies and guest perceptions. The intermediate values associated with non-superhost listings suggest a nuanced positioning between the extremes of superhost and unspecified status. These findings highlight the importance of the superhost designation as a valuable asset for hosts, not only in justifying higher prices but also in enhancing overall guest satisfaction. Hosts aiming to optimize their performance on Airbnb may find strategic value in prioritizing guest experience, pursuing superhost status, and carefully calibrating pricing strategies to align with perceived quality and value. This nuanced understanding of the interplay between superhost status, pricing, and guest satisfaction provides hosts with actionable insights to elevate their presence and success on the Airbnb platform.

## Review Sentiment Analysis

### How do guests generally feel about their Airbnb stay?

![posit](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/c7f911e2-70ff-4bf2-87bc-e4660cc2f6d3)

#### The data on Airbnb review sentiments paints a predominantly positive picture, with an overwhelming 5,309,065 instances classified as Positive. This abundance of positive sentiment reflects a widespread satisfaction among guests, contributing significantly to the platform's positive reputation. Notably, Negative reviews are relatively limited, totaling 9,681, indicating a minor fraction of instances where guests express dissatisfaction. The presence of 54,397 Neutral reviews suggests that a segment of guests experiences opinions falling between clearly positive or negative sentiments. While the overall sentiment is commendable, the Neutral and Negative reviews present valuable opportunities for improvement. Although we dont have the exact reviews content, just from this sentiment we can ger an overall gist.

### Most postiive/negative review cities.

![posittttiv](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/c09cb1b8-bde1-4ebe-af79-cc56f444fd8b)

![negatttti](https://github.com/marcrivera9/Airbnb-Analysis-Insights-/assets/148594670/ced5f12f-d6c2-4609-b54c-482a2cd3ec90)


