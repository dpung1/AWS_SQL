CREATE TABLE sales ( 

    customer VARCHAR(255), 

    amount INT

);

INSERT INTO sales (customer, amount)

VALUES 

    ('John', 100), 

    ('Jane', 200), 

    ('John', 150), 

    ('Jane', 50), 

    ('Jim', 300);
    
select
	customer,
    sum(amount) as total_sales
from
	sales
group by
	customer;