# **Project Overview**

## **Coffee Shop Sales Analysis**

### A hypothetical coffee shop owner wanted to assess the performance of their business and requested my assistance as a data analyst to analyze their sales data. The owner provided 6 months' worth of sales data in a CSV file for the analysis.

## **Problem Statement:**
### The coffee shop owner seeks a comprehensive analysis of sales performance over the past six months to gain insights into key business areas. The goal is to understand sales trends, order patterns, and product demand across different timeframes, store locations, and product categories. He wants to take data-driven decision's to optimize operations, boost sales, and identify growth opportunities.

## **Objective:**
### The objective of this analysis is to evaluate the coffee shop's performance through a detailed examination of sales data. The analysis aims to:
 * Track total sales, orders, and quantity sold monthly.
 * Visualize sales trends by day, week, and hour.
 * Identify top-selling products and key product categories.
 * Understand the impact of store location, weekday/weekend patterns, and exceptional sales days.
 * Provide actionable insights by comparing performance against historical data and averages.

## **Info:**
### **_The CSV file included the following columns:_**
 1.transaction_id – A unique identifier for each transaction.
 2.transaction_date – The date the transaction occurred.
 3.transaction_time – The time the transaction took place.
 4.transaction_qty – The quantity of items purchased in the transaction.
 5.store_id – A unique identifier for each store where the transaction occurred.
 6.store_location – The location of the store where the sale took place.
 7.product_id – A unique identifier for each product sold.
 8.unit_price – The price per unit of the product.
 9.product_category – The category to which the product belongs.
 10.product_type – The type of product sold.
 11.product_detail – The specific name or details of the product.

## **Analysis**
### As a Data Analyst, I began by examining the dataset (CSV file) to detect any null values, duplicates, or errors. After this initial assessment, I imported the data into Power BI using the Get Data gateway. Subsequently, I loaded the data into Power Query for minor adjustments. Given that the dataset was a single table without any related tables, there was no need for additional data modeling or relationship establishment.

### The analysis offers a detailed view of the coffee shop's sales performance across multiple dimensions. It starts with calculating total sales for each month, highlighting month-on-month (MoM) percentage changes to uncover sales trends. Sales data for the selected month is then compared to the previous month to identify any variations. A similar approach is used for total orders, analyzing MoM changes and differences between months.

### To provide deeper insights, total quantities sold each month are assessed, with MoM variations tracked and comparisons made between selected and previous months. A dynamic calendar heat map is created, allowing users to select months via a slicer. This heat map visually represents daily sales with color-coded intensity, where darker colors denote higher sales, and includes tooltips that display detailed metrics such as sales, orders, and quantities.

### Sales data is also segmented into weekdays and weekends to reveal performance differences and patterns. MoM sales trends are visualized by store location to identify areas of growth or decline. Daily sales for each month are presented on a stacked column chart, with an average sales line to highlight days that deviate from the average.

### Additionally, sales contributions are analyzed by product category to identify which categories generate the most revenue. The top 10 best-selling products are highlighted to quickly identify the coffee shop's most popular items. Finally, a heat map displays sales patterns by day and hour, offering a comprehensive view of sales trends throughout the day.

### This comprehensive analysis has provided valuable insights into the coffee shop’s sales performance, revealing trends and patterns across various dimensions. By examining total sales, orders, and quantities, and visualizing data through dynamic tools such as heat maps and line charts, we have gained a clearer understanding of the factors driving the business's success.

### Thank you for the opportunity to conduct this analysis. If you have any further questions or need additional insights, please feel free to reach out. Your feedback is appreciated, and I look forward to supporting you with future data-driven projects.
