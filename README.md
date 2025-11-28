# zepto-retail-analytics-sql
Data cleaning and analysis of Zepto’s retail inventory using PostgreSQL—covering stock levels, discounts, pricing, and category insights.

📌 Project Overview

This project performs a complete SQL-based analysis of Zepto’s retail inventory data.
It includes data cleaning, exploratory analysis, pricing corrections, stock insights, discount evaluation, and revenue estimation — all using PostgreSQL.

The goal is to uncover product-level trends, identify inconsistencies, and derive business insights from inventory and pricing patterns.

📂 Dataset Details

The dataset includes product-level information such as:

SKU ID

Category

Product Name

MRP & Discounted Selling Price

Discount Percentage

Weight (in grams)

Stock Availability

Quantity Available

A custom SQL table is created to organize and analyze the data.

🛠️ Key SQL Tasks Performed
✔ Data Exploration

Count rows

Preview dataset

Check missing values

Identify distinct product categories

Check repeated product names

✔ Data Cleaning

Detect and remove invalid MRP values (0)

Correct pricing values

Standardize numerical fields

✔ Retail & Inventory Insights

In-stock vs out-of-stock analysis

High-MRP products that are out of stock

Best-value products by discount percentage

High-MRP products with low discounts

Weight category classification (low/medium/bulk)

Total inventory weight per category

Estimated revenue per product category

📁 Repository Structure
zepto-retail-analytics-sql/
│
├── zepto_analysis.sql        # Full SQL script (create table + analysis queries)
├── README.md                 # Project documentation
└── data/                     # (Optional) If you want to store raw data files

🚀 How to Use

Clone the repository:

git clone https://github.com/yourusername/zepto-retail-analytics-sql


Open PostgreSQL or pgAdmin.

Run zepto_analysis.sql to create the table and execute all analysis queries.

Explore outputs and insights from your SQL queries.

📈 Key Insights Discovered

Categories contributing highest revenue

Products with inconsistent pricing

Items frequently out of stock

Best-value deals based on discount percentage

Inventory weight distribution across categories

📜 License

This project is open-source under the MIT License.
