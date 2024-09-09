--- First Step : Snowflake Setup
	- Created a snowflake account
	- Created a database in snowflake and named it home assignments
	- Defined various profile parameters to connect to the database :: Password, Warehouse name, Schema, Role,...
	- Installed Snowsql for data ingestion as an alternative to dbt seeds

--- Second Step : dbt Setup
	- installed dbt
	- created a dbt project named as dbt-env as a virtual environment
	- created .dbt folder  and profiles.yml file separate from dbt project folder to configure dbt connection and settings in my own environment
	- edited profiles.yml file to configure dbt for a connection to snowflake home assignments database
	- pulled the dbt project content from bitbucket using git into my dbt project environment

--- Third Step : Data Ingestion using Snowsql
	- Created an internal stage in snowflake to load the csv files inside the stage first for performance and efficiency
	- Put the csv files in the created internal stage under the name : @Snowflake_Internal_Stage
	- Created customers tables and sales data tables in Snowsql
		- Customers table: --> ID :: Interger, Name: (Hashed with fixed length) Char(10)
		- Sales table : --> Order_ID, Customer_ID, Product_ID, Quantity  :: Integer, Product_name, Status: Varchar, Price: float, Order_date: Date
	-  Copied data from Internal stage to each table and double-checked if all the data is copied correctly


--- Fourth Step : Data Transformation
	- Created "raw_sales_data_transformed" sql code in "<dbt-project>/models" to fetch data from sales table in snowflake and transform the date into year, month and day
	- update dbt_project.yml file to define the raw and staging area models and materialize them as table
	- use dbt run to exectute the transformation using dbt


--- Fifth Step : Queries for Data analysts
	- Created a queries folder in dbt project
	- added all 4 queries to fetch data about different analyses wanted by analysts.
	- Now that the sales table is transformed we can run the queries in snowflake/snowsql to get the tables/views for analysis



--- Possible Enhancement:
	- We can create dbt jobs using dbt cloud to automate the process when dealing with reports that needs to be generated on monthly or weekly basis
	- We can partition or index the data when dealing with large amount of data to enhance the performance 
