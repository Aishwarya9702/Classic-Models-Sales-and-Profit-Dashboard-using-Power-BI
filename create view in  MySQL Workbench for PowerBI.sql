create or replace view sales_data_for_power_bi as

select
orderDate,
t1.orderNumber,
t4.productName,
t4.sales_data_for_power_biproductLine,
t3.customerName,
t3.city as customer_city,
t3.country as customer_country,
t6.city as office_city,
t6.country as office_country,
buyPrice,
priceEach,
quantityOrdered,
quantityOrdered*priceEach as sales_value,
quantityOrdered * buyPrice as cost_of_sales
from orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
inner join customers t3
on t1.customerNumber = t3.customerNumber
inner join products t4
on t2.productCode = t4.productCode
inner join employees t5
on t3.salesRepEmployeeNumber = t5.employeeNumber
inner join offices t6
on t5.officeCode = t6.officeCode