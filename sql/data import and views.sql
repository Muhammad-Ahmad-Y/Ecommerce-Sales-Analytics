-- Convert OrderDate column from type TEXT to DATE-- 
SELECT `OrderDate`
FROM ecommerce_clean_dataset
WHERE str_to_date(TRIM(LEFT(`OrderDate`, 10)), '%d/%m/Y %H:%i') IS NOT NULL;

CREATE VIEW ecommerce_dataset_dashboard_table AS
SELECT
	OrderID,
	str_to_date(TRIM(LEFT(`OrderDate`, 10)), '%d/%m/%Y') as OrderDate,
	CustomerID ,
	City,
    State, 
	ProductID, 
	ProductName, 
	Category ,
	UnitPrice ,
	Quantity ,
	LineSubtotal, 
	DiscountRate ,
	DiscountAmount, 
	TaxAmount ,
	ShippingMethod ,
	ShippingCost ,
	OrderTotal ,
	PaymentMethod, 
	str_to_date(TRIM(LEFT(`ShippingDate`, 10)), '%d/%m/%Y') as ShippingDate,
	str_to_date(TRIM(LEFT(`DeliveryDate`, 10)), '%d/%m/%Y') as DeliveryDate ,
	Returned,
	RefundAmount
FROM ecommerce_clean_dataset;	