# Population Health Informatics Final Project
#### Team Members: Ishan Saksena, Jayashree Raman, Naga Soundari Balamurugan, Zubin Chopra
## Project Description

What is the purpose of your research project?
>To quantify the relationship between preventable mental health outcomes and factors in an individual's built environment. A built environment includes, but is not limited to access to healthy food resources, parks, transportation facilities. The term is often extended to mean any man-made surrounding. 

>This would involve looking at combining health outcome datasets with built environment datasets. We would further have to establish pathways based on what stressors the environment introduces and which health outcomes are affected. We would also look at correlation between characteristics of geographic regions and mental health outcomes prevalent in the corresponding region. Our area of focus is primarily on metropolitan regions, as these have a high concentration of built environments.


What other research has been done in this area? Make sure to include 3+ links to related works. 
1. The Effects of the Urban Built Environment on Mental Health: A Cohort Study in a Large Northern Italian City. Melis et al. 2015. International Journal of Public Environment and Public Health.
>This paper analyzes the effect of different urban features such as transportation, access to services, pollution, waste management, traffic, etc. on the mental health of the citizens of Turin, a city in Italy. It analyzes the distribution of different built environment factors in Turin, and then correlates it with the mental health, assessing their impact of different demographic sets of people.


2. The impact of the physical and urban environment on mental well-being. Guite, HF., Clark, C., Ackrill, G., Public Health. 2006 Dec;120(12):1117-26. Epub 2006 Nov 9. 
>This paper affirms an association between the physical environment and mental well-being across a range of domains(neighbour noise, sense of over-crowding in the home and escape facilities such as green spaces and community facilities, and fear of crime), during a study conducted in four areas of Greenwich and London. This study also emphasizes the necessity to intervene on both design and social features of residential areas to promote mental well-being.  

3. Mental Health and the Built Environment. 2002. British Journal of Psychiatry.180, 420-433. Weich Scott, Martin B., Martin P., Elizabeth B., Bob E,. Kerry S.
>This paper assesess the prevalence of depression due to the different built environment features, as part of a cohort study performed in North London.  

4. Sorting Out the Connections Between the Built Environment and Health: A Conceptual Framework for Navigating Pathways and Planning Healthy Cities. Northridge. ME1., Sclar, ED., Biswas, P., J Urban Health. 2003 Dec;80(4):556-68.
>This paper highlights the importance of integration of public health in the early stages of urban design and development. It also analyzes the shortcomings of existing methods of data collection in this realm. The paper also make a point of key challenges to be give importance for a sound scientific research to be conducted on relationship between the built environment and health.


What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be. 

> Since our research question is cross sectional, we will be using datasets from both the health as well as community and environment sectors to answer the question. Based on our initial search, we found the following datasets that will help us analyze the impact of built environments on mental health. These have been listed below:
1. American Household Survey (By Metropolitan Region)
2. National Mental Health Services Survey (NMHSS)
3. 500 Cities Health Statistics Data
4. Survey of Income and Program Participation (SIPP)

> Since our research question is cross sectional, we will be using datasets from health, community and environment sectors to answer them. Based on our initial search, we found three datasets that will help us analyze the impact of built environments on mental health. These have been listed below:

> Since our research question is cross sectional, we will be using datasets from health, community and environment sectors to answer them. Based on our initial search, we found the following datasets that will help us analyze the impact of built environments on mental health. These have been listed below:


  1. **American Household Survey (By Metropolitan Region)** - The AHS is sponsored by the Department of Housing and Urban          Development (HUD) and conducted by the U.S. Census Bureau. The survey is the most comprehensive national housing survey       in the United States. The dataset includes each of 47 selected Metropolitan Areas that are collected about every 4 years,      with an average of 12 areas included each year. We acceseed the dataset from the website                                      https://www.census.gov/programs-surveys/ahs/ which is downloadable in SAS and ASCII formats.
  
  2. **National Mental Health Services Survey (NMHSS)** - These data were from the survey conducted by Mathematica Policy          Research and sponsored by Substance Abuse and Mental Health Services Administration (SAMHSA) and U.S. Department of           Health and Human Services (HHS). Data accessible through https://survey.nmhss.org/

  3. **500 Cities Health Statistics Data** - The 500 Cities project is a collaboration between CDC, the Robert Wood Johnson        Foundation, and the CDC Foundation. The purpose of this Project is to provide city- and census tract-level small area         estimates for chronic disease risk factors, health outcomes, and clinical preventive service use for the largest 500          cities in the United States. Data accessible through https://www.cdc.gov/500cities/
  
  4. **Survey of Income and Program Participation (SIPP)** - SIPP is the premier source of information for income and program      participation. SIPP collects data and measures change for many topics including: economic well-being, family dynamics,        education, assets, health insurance, childcare, and food security. The U.S. census bureau sponsored the survey under a        law that protects all the responsdents and their privacy. Data accessible through                                             https://www.census.gov/programs-surveys/sipp/data.html



Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset. You should hone in on one of these audiences.  
>Our main audience would include Government and City level representatives, Construction companies and Non-Profit organizations. We would like city level government representatives to be our main target audience because they make the call on local health and development initiatives. They should be informed about what are the most effective investments in built environments to improve health outcomes. The results from this project will enable researchers to back their claims with empirical data. This will prove to be instrumental in convincing the policy makers and making them aware of the issues regarding this matter.

>In addition to the stakeholders mentioned above, we also want to target this project towards urban city designers/developers and public health specialists. We believe that these two stakeholders need to work together in order to devise effective policies. This will enable population health concerns to addressed and integrated in the design of upcoming cities itself before the plans are actually implemented.

>Lastly, we also want to share the results of this research with people living in the areas we will be covering through this project. This is because, in the end, it is the people who face the brunt of the urban plans and policies introduced by those in power. This makes it imperative to make the public aware of the connection between built environments and public health. This will enable projects in this field to discover new perspectives and integrate them in the design of policies.


What should your audience learn from your resource? Please list out at least 3 specific questions that your project will answer for your audience  
> We feel that with more urbanization, it is critical that sustainable cities are developed, the focus here being on 'sustainable'. Our goal is to communicate the following insights to our target audience:  
1. How different types of built environment are accessible in different metropolitan regions?
2. How does accessibilty of built environments affect mental health, in terms of correlations?
3. What is the correlation between accessibility to different built environment and mental health for different demographics of the population (based on age, location, etc.)?


## Technical Description

What will be the format of your final product (Shiny app, HTML page or slideshow compiled with KnitR, etc.)?
>The final product is planned to be a website with different sections addressing the level of access to various types of built environments such as grocery stores, parks and transportation infrastructure and its impact on the mental health of people. Each section will have one or more interactive visualizations, built with Shiny/R or D3.js if necessary. 


Do you anticipate any specific data collection / data management challenges?  
>While there is plenty of data available describing built environments and health data, there are very few datasets describing both. Because the nature of the question is cross-sectional, we might lose some rigour in combining these data sets on the basis of location. 


What new technical skills will need to learn in order to complete your project?  
>We expect to learn a lot more of R/Shiny. 
>We also hope to gain sufficient skills to wrangle and extract insights out of survey data.

What major challenges do you anticipate?   
>We might need some help picking appropriate statistical models/measures to quantify these relationships. 
 


