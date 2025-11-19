# AURORA-BANK-
This project focuses on uncovering critical insights from Aurora Bank’s core datasets, including Users, transactions, and merchant categories. As part of a dynamic financial environment, the goal is to transform raw financial data into meaningful intelligence that supports decision-making across Users engagement, risk management, and business growth.The analysis begins with SQL, where the raw data is cleaned, transformed, and modeled before being imported into Power BI for interactive dashboards and deeper visualization.

## OBJECTIVE

- **Understand Customer Profiles**: Explore customer demographics, financial health,and behaviors to unlock new opportunities for engagement. 
- **Analyze Spending Trends**: Uncover patterns and growth opportunities in transaction data. 
- **Identify Risks**: Spot potential red flags in rising debt, transaction errors, and fraudulent activity

 ## Project Workflow

- **SQL Development** (First Phase)
- Data extraction from source tables
- Data cleaning, transformation, and filtering
- Creating views for standardized analysis
- Joining relational tables (User-card-transaction-Mcc relationships)
- Creating view
- Using CTE
- Generating metrics and indicators used in Power BI
 
- **Power BI Development** (Second Phase)
- Connecting to SQL views
- Creating DAX measures
- Designing dashboards and analytic reports

  ## DASHBOARD INSIGHT
- How credit score and yearly income correlate over age group.
- Relationship between Total debt and Credit score.
- Distribution between Debt segement and Age group.
- Users region.
- Age group.
- Payment method.
- Amount spent on each state in which would review the merchant incharge.
- Credit score categories partitioning the users.
- Failure rate in each state
- How debt and amount moves all through the months
- Identifying prominent error likely to happen.
- Category of debt to income risk
- Identifying users that are on high risk to get loan.

  ## KEY FINDINGS
- Out of the **2,000** registered users, only **303** have carried out transactions so far. Compared to last year, user activity has dropped slightly by **0.33%**, which may signal early signs of reduced engagement or potential churn. Despite this decline, one noticeable pattern is that most active users rely heavily on credit cards for their daily transactions.
- Total debt is gradually declining, but it still remains high at **$16.77M**. Although debt has dropped slightly by **0.43% compared to last year**, the bank continues to carry a significant portion of its debt in the High Debt **($50K–$100K)** and Very High Debt **($100K+)** categories, which remain the dominant segments.
- High debt-to-income risk remains a major concern, with **72%** of users falling into the high-risk category. This means that more than **70%** of the bank’s Users are carrying debt levels that may be difficult to sustain, putting them at greater financial vulnerability
- There has been a noticeable drop in both transaction volume and transaction value, falling by **16.86% and 16.45%** respectively compared to last year. This decline suggests reduced user activity on the platform and a potential dip in revenue for the bank, as Users are interacting less and spending less overall.
- There is a noticeable regional imbalance in user distribution. The Northeast region leads with **128** users, while other regions—particularly the **Southwest—have significantly lower user numbers**. This uneven spread may indicate gaps in market penetration or regional engagement.
- Middle-aged users hold the largest share of the bank’s debt, creating a high concentration of financial risk within this age group. This imbalance not only limits long-term growth opportunities but also increases their vulnerability to financial stress.
- Users are not fully adopting digital channels, which limits the bank’s ability to scale efficiently. This is evident as more than **70%** of transactions are still conducted via chip-based methods, indicating low engagement with more modern digital payment options.
- Countries such as **South Korea, Sweden, and Costa Rica** are experiencing a high rate of transaction failures. This can significantly frustrate users and negatively impact their overall interaction with the bank’s service.

## RECOMMENDATION 
- Deploying fallback routing for merchants in **states with high transaction failure rates** can help ensure transactions are processed even when primary networks fail. This approach not only reduces user frustration but also protects and potentially increases revenue for the bank.
- Introducing a structured repayment program for customers with **high debt-to-income risk** can help them manage their obligations more effectively. This approach encourages Users loyalty while simultaneously reducing the bank’s risk of defaults.
- Strengthening partnerships with merchants in specific countries or states through cashback or discount deals can incentivize customer spending, enhance engagement, and drive higher transaction volumes.
- Implementing incentives for users who make consistent, on-time payments can encourage responsible financial behavior and help improve their credit scores over time.

## Running the Project
1. Execute SQL Scripts
- Run the SQL scripts in the /sql folder.
- Ensure view is created before loading Power BI.
2. Load into Power BI
- Open the .pbix dashboard.
- Connect to the SQL database or import the exported data.
- Refresh and explore visual insights.

 ## Contact
Oladapo Israel
- Email: israeoladapo3@gmail.com
- LinkedIn: Israel Oladapo
- x: @Israel_oladapo1



