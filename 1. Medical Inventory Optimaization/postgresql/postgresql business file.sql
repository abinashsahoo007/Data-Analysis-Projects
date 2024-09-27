create table medical(
    Typeofsales TEXT,
    Patient_ID BIGINT,
    Specialisation TEXT,
    Dept TEXT,
    Dateofbill TEXT, 
    Quantity INT,
    ReturnQuantity INT,
    Final_Cost NUMERIC,
    Final_Sales NUMERIC,
    RtnMRP NUMERIC,
    Formulation TEXT,
    DrugName TEXT,
    SubCat TEXT,
    SubCat1 TEXT
);

select * from medical;

-- First Moment Business Decision --
-- Mean --
select avg(quantity) from medical;
select avg(returnquantity) from medical;
select avg(final_cost) from medical;
select avg(final_sales) from medical;
select avg(rtnmrp) from medical;

-- Median --
select * from medical;
select percentile_cont(0.5) within group (order by quantity) as median from medical;
select percentile_cont(0.5) within group (order by returnquantity) as median from medical;
select percentile_cont(0.5) within group (order by final_cost) as median from medical;
select percentile_cont(0.5) within group (order by final_sales) as median from medical;
select percentile_cont(0.5) within group (order by rtnmrp) as median from medical;


-- Mode --
select count(typeofsales) from medical;
select count(distinct typeofsales) from medical;
select typeofsales, count(*) as value_count from medical group by typeofsales order by value_count desc;


select count(specialisation) from medical;
select count(distinct specialisation) from medical;
select specialisation, count(*) as value_count from medical group by specialisation order by value_count desc;


select count(dept) from medical;
select count(distinct dept) from medical;
select dept, count(*) as value_count from medical group by dept order by value_count desc;

select count(formulation) from medical;
select count(distinct formulation) from medical;
select formulation, count(*) as value_count from medical group by formulation order by value_count desc;


select count(drugname) from medical;
select count(distinct drugname) from medical;
select drugname, count(*) as value_count from medical group by drugname order by value_count desc;


select * from medical;


-- Second Moment Business Decision --
-- Standard Deviation --

select stddev_pop(quantity) as quantity_standard_deviation
from medical;

select stddev_pop(returnquantity)
from medical;

SELECT STDDEV_POP(final_cost) AS cost_standard_deviation
FROM medical;

select stddev_pop(final_sales) as sales_standard_deviation
from medical;

select stddev_pop(rtnmrp) 
from medical;

-- variance --

select * from medical;
select var_pop(quantity) as quantity_var from medical;
select var_pop(returnquantity) as quantity_var from medical;
select var_pop(final_cost) as quantity_var from medical;
select var_pop(final_sales) as quantity_var from medical;
select var_pop(rtnmrp) as quantity_var from medical;


-- range --

select max(quantity)-min(quantity) as range from medical;
select max(returnquantity)-min(returnquantity) as range from medical;
select max(final_cost)-min(final_cost) as range from medical;
select max(final_sales)-min(final_sales) as range from medical;
select max(rtnmrp)-min(rtnmrp) as range from medical;


-- Third Moment Business Decision --
-- Skewness --
select * from medical;
SELECT 3 * (AVG(quantity) - PERCENTILE_CONT(0.5) 
			WITHIN GROUP (ORDER BY quantity)) / STDDEV(quantity) AS skewness FROM medical;

select 3* (avg(returnquantity)-percentile_cont(0.5)
		  within group (order by returnquantity))/stddev(returnquantity) as skewness from medical;

select 3*(avg(final_cost)-percentile_cont(0.5)
		 within group (order by final_cost))/stddev(final_cost) as skewness from medical;
		 
select 3*(avg(final_sales)-percentile_cont(0.5)
		 within group(order by final_sales))/stddev(final_sales) as skewnss from medical;		 

select 3 * (avg(rtnmrp)-percentile_cont(0.5)
		   within group(order by rtnmrp))/stddev(rtnmrp) as skewness from medical;


-- Fourth Moment Business Decision
-- Kurtosis --

select * from medical;
SELECT AVG(value) INTO mean FROM unnest(values) AS value;
    
select avg(quantity) from medical;  
select count(quantity) from medical;
select stddev_pop(quantity) as quantity_standard_deviation from medical;
SELECT POW(SUM(quantity - 2.231), 4)  / (14218 * POW(5.113, 4)) as Kurtosis FROM medical;

select avg(final_cost) from medical;  
select count(final_cost) from medical;
select stddev_pop(final_cost) as quantity_standard_deviation from medical;
SELECT POW(SUM(final_cost - 5.131862), 4)  / (14218 * POW(464.766448, 4)) as Kurtosis FROM medical;


select avg(final_sales) from medical;  
select count(final_sales) from medical;
select stddev_pop(final_sales) as quantity_standard_deviation from medical;
SELECT POW(SUM(final_sales - 234.0383), 4)  / (14218 * POW(671.28, 4)) as Kurtosis FROM medical;


