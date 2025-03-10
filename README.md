# **Introduction**
This project focuses on analyzing sales data from 2018 to 2020, with an emphasis on:

* **Sales (Total Sales)**, Profit (Total Profit), and related KPIs (Profit Margin, Order Quantity).
* **Sales Channels** (In‐Store, Online, Distributor, Wholesale).
* **Customer Segmentation** based on groups such as Champions, Loyal, At Risk, Hibernating, etc.
* **Sales Team Performance across years**: how many teams achieve or miss their targets, top team revenue, etc.
>The main goal is to understand sales trends, identify high-potential customer segments, and assess the effectiveness of each sales team to propose suitable business strategies.

# **Project Structure**

### **images/:** Storage for charts, dashboards, and demo screenshots.
### **Wikis Page:**
  1. **Data Processcing**
  2. **EDA**
  3. **Deep-analysis and Visualization with interactive dashboard**

# **Objectives & Scope**
>* Analyze sales and profit trends over three years (2018–2020).
>* Evaluate sales channels (In‐Store, Online, Distributor, Wholesale) in terms of scale and growth rate.
>* Segment customers by value (e.g., loyalty, recency, frequency) to propose strategies for retention and upselling.
>* Assess sales team performance: number of teams achieving or missing targets, exploring root causes, and suggesting improvements.

# Input Data
* US_Regional_Sales_Data.csv: Contains revenue, profit, sales channel, date, etc.
* Customer.csv: Contains customer info, segmentation (if available), purchase history.
* us-regional-sale-query for sale-man kpis.sql (or a similar table): Holds sales team info, targets, and performance.
* us-regional-sale-query for rfm segment.sql

# Key Results
* **Sales & Channels Analysis**
>**Total Sales saw a strong increase from 2018 to 2019**, then flattened in 2020.
>**In‐Store leads (~41% of overall sales)**, followed by Online (~30%).
>**Profit grows in parallel**, with a profit margin staying around 25–26%.
**Recommendation:** Maintain the core strength of In‐Store, continue scaling Online, and investigate Wholesale’s slight dip in 2020.

* **Customer Segmentation**
> **Champions drive the highest revenue** (~13.5M), followed by Loyal (~11.1M) and At Risk (~9.98M).
> **Gender ratio: ~54% Male, ~46% Female.**
**Recommendation:** Focus on “Champions” & “Loyal,” run “win-back” campaigns for “At Risk,” and nurture “New Customers” to move them up to more valuable segments.

* **Sales Team Performance**
>**2018:** 13 teams hit their target, **15 fell short**.
>**2019:** A breakout year, **27 teams exceeded targets, only 1 missed**.
>**2020:** Overall revenue remained high, but **18 teams missed targets, only 10 met them**.
**Recommendation:** **Reassess 2020 KPIs** (possibly too high), share best practices from top teams, and **allocate resources more evenly**.

# Contributing
We welcome contributions from the community:

* **Submit Issues** for bugs or feature requests in the Issues tab.
* **Open a Pull Request** if you have suggestions for code improvements, new features, or documentation updates.

# License
This project is licensed under the MIT License. See the LICENSE file for details.

# Contact
Author: Trung Dinh
Email: dinhviettrung.work@.gmail.com
LinkedIn: www.linkedin.com/in/dinh-viet-trung-68348a230
_For any questions or feedback, please reach out directly or create an Issue on GitHub._
