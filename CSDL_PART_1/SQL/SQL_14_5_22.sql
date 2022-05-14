CREATE TABLE MANUFACTURER(
	MANUFACTURER_CODE VARCHAR(10),
  	MANUFACTURER_NAME VARCHAR(10),
  	NATIONALITY VARCHAR(10),
  	CONSTRAINT PK_MANUFACTURER PRIMARY KEY (MANUFACTURER_CODE)
)
CREATE TABLE SUPPLIER(
	SUPPLIER_CODE VARCHAR(10),
  	SUPPLIER_NAME VARCHAR(10),
  	SUPPLIER_ADDRESS VARCHAR(10),
  	CONSTRAINT PK_SUPPLIER PRIMARY KEY (SUPPLIER_CODE)
)
CREATE TABLE COUNTER(
	COUNTER_NUMBER INT,
  	COUNTER_NAME VARCHAR(10),
  	COUNTER_LOCATION VARCHAR(10),
  	CONSTRAINT PK_COUNTER PRIMARY KEY (COUNTER_NUMBER)
)
CREATE TABLE CUSTOMER(
	CUSTOMER_CODE VARCHAR(10),
  	CUSTOMER_NAME VARCHAR(10),
  	CUSTOMER_ADDRESS VARCHAR(10),
  	CONSTRAINT PK_CUSTOMER PRIMARY KEY (CUSTOMER_CODE)
)

CREATE TABLE RECEIPT(
	RECEIPT_CODE VARCHAR(10),
  	--RECEIPT_PROD_QUANTITY INT,
  	--PRICE FLOAT,
  	IMPORTED_DATE DATE,
  	SUPPLIER_CODE VARCHAR(10),
  	CONSTRAINT PK_RECEIPT PRIMARY KEY (RECEIPT_CODE),
  	CONSTRAINT FK_RECEIPT_SUPPLIER_SUPPLIER_CODE FOREIGN KEY (SUPPLIER_CODE) REFERENCES SUPPLIER(SUPPLIER_CODE)
)
CREATE TABLE INVOICE(
	INVOICE_CODE VARCHAR(10),
  	INVOICE_PROD_QUANTITY INT,
  	PRICE FLOAT,
  	CUSTOMER_CODE VARCHAR(10),
  	CONSTRAINT PK_INVOICE PRIMARY KEY (INVOICE_CODE),
  	CONSTRAINT FK_INVOICE_CUSTOMER_CUSTOMER_CODE FOREIGN KEY (CUSTOMER_CODE) REFERENCES CUSTOMER(CUSTOMER_CODE)
)

CREATE TABLE PRODUCT(
	PRODUCT_CODE VARCHAR(10),
  	PRODUCT_NAME VARCHAR(20),
  	PRODUCT_UNIT INT,
  	PRODUCT_QUANTITY INT,
  	PRODUCT_PRICE FLOAT,
  	COUNTER_NUMBER INT,
  	MANUFACTURER_CODE VARCHAR(10),
  	SUPPLIER_CODE VARCHAR(10),
  	CONSTRAINT PK_PRODUCT PRIMARY KEY (PRODUCT_CODE),
  	CONSTRAINT FK_PRODUCT_COUNTER_COUNTER_NUMBER FOREIGN KEY (COUNTER_NUMBER) REFERENCES COUNTER (COUNTER_NUMBER),
	CONSTRAINT FK_PRODUCT_MANUFACTURER_MANUFACTURER_CODE FOREIGN KEY (MANUFACTURER_CODE) REFERENCES MANUFACTURER (MANUFACTURER_CODE),
	CONSTRAINT FK_PRODUCT_SUPPLIER_SUPPLIER_CODE FOREIGN KEY (SUPPLIER_CODE) REFERENCES SUPPLIER (SUPPLIER_CODE)
)
CREATE TABLE IMPORTED(
	RECEIPT_CODE VARCHAR(10),	
  	PRODUCT_CODE VARCHAR(10),
  	PRODUCT_QUANTITY INT,
  	PRODUCT_PRICE FLOAT,
  	CONSTRAINT PK_IMPORTED PRIMARY KEY (RECEIPT_CODE, PRODUCT_CODE),
  	CONSTRAINT FK_IMPORTED_RECEIPT_RECEIPT_CODE FOREIGN KEY (RECEIPT_CODE) REFERENCES RECEIPT (RECEIPT_CODE),
  	CONSTRAINT FK_IMPORTED_PRODUCT_PRODUCT_CODE FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
  	--CONSTRAINT FK_IMPORTED_PRODUCT_PRODUCT_PRICE FOREIGN KEY (PRODUCT_PRICE) REFERENCES PRODUCT (PRODUCT_PRICE)
)
CREATE TABLE PURCHASED(
	INVOICE_CODE VARCHAR(10),	
  	PRODUCT_CODE VARCHAR(10),
  	CONSTRAINT PK_PURCHASED PRIMARY KEY (INVOICE_CODE, PRODUCT_CODE),
  	CONSTRAINT FK_PURCHASED_INVOICE_INVOICE_CODE FOREIGN KEY (INVOICE_CODE) REFERENCES INVOICE (INVOICE_CODE),
  	CONSTRAINT FK_PURCHASED_PRODUCT_PRODUCT_CODE FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE)
)


INSERT INTO MANUFACTURER VALUES ('SAM', 'SAMSUNG', 'KOREA')
INSERT INTO MANUFACTURER VALUES ('APP', 'APPLE', 'USA')
INSERT INTO MANUFACTURER VALUES ('VAL', 'VALVE INC', 'USA')
INSERT INTO MANUFACTURER VALUES ('XI', 'XIAO', 'CHINA')
INSERT INTO MANUFACTURER VALUES ('TENC', 'TENCENT', 'CHINA')
INSERT INTO MANUFACTURER VALUES ('BENT', 'BENTLY', 'UK')
INSERT INTO MANUFACTURER VALUES ('TWT', 'TWITTER', 'USA')
INSERT INTO MANUFACTURER VALUES ('SN', 'SONY INC', 'JAPAN')
INSERT INTO MANUFACTURER VALUES ('GOG', 'GOOGLE', 'USA')
INSERT INTO MANUFACTURER VALUES ('FB', 'FACEBOOK', 'USA')
SELECT COUNT(*) FROM MANUFACTURER
INSERT INTO SUPPLIER VALUES ('DMX', 'DIENMAYXAN', 'HCM')
INSERT INTO SUPPLIER VALUES ('TGDD', 'PHONEWORLD', 'HCM')
INSERT INTO SUPPLIER VALUES ('COOP', 'COOP MART', 'HCM')
INSERT INTO SUPPLIER VALUES ('SCHA', 'CELLPHONES', 'HCM')
INSERT INTO SUPPLIER VALUES ('BL', 'BACHLONG', 'HN')
INSERT INTO SUPPLIER VALUES ('NSH', 'NSHOP', 'HCM')
INSERT INTO SUPPLIER VALUES ('MMG', 'MIMIGAME', 'HCM')
INSERT INTO SUPPLIER VALUES ('BB', 'BESTBUY', 'USA')
INSERT INTO SUPPLIER VALUES ('MMZ', 'MEMORYZONE', 'HCM')
INSERT INTO SUPPLIER VALUES ('GEAR', 'GEARVN', 'HCM')
SELECT COUNT(*) FROM SUPPLIER
SELECT * FROM SUPPLIER
INSERT INTO COUNTER VALUES (1, 'COUNTER #1', 'FLOOR 10')
INSERT INTO COUNTER VALUES (2, 'COUNTER #2', 'FLOOR 9')
INSERT INTO COUNTER VALUES (3, 'COUNTER #3', 'FLOOR 8')
INSERT INTO COUNTER VALUES (4, 'COUNTER #4', 'FLOOR 7')
INSERT INTO COUNTER VALUES (5, 'COUNTER #5', 'FLOOR 6')
INSERT INTO COUNTER VALUES (6, 'COUNTER #6', 'FLOOR 5')
INSERT INTO COUNTER VALUES (7, 'COUNTER #7', 'FLOOR 4')
INSERT INTO COUNTER VALUES (8, 'COUNTER #8', 'FLOOR 3')
INSERT INTO COUNTER VALUES (9, 'COUNTER #9', 'FLOOR 2')
INSERT INTO COUNTER VALUES (10, 'COUNTER#10', 'FLOOR 1')
SELECT * FROM COUNTER
INSERT INTO CUSTOMER VALUES ('C001', 'NGUYEN A', 'HCM')
INSERT INTO CUSTOMER VALUES ('C002', 'NGUYEN B', 'HN')
INSERT INTO CUSTOMER VALUES ('C003', 'NGUYEN C', 'HCM')
INSERT INTO CUSTOMER VALUES ('C004', 'NGUYEN D', 'HUE')
INSERT INTO CUSTOMER VALUES ('C005', 'NGUYEN E', 'HCM')
INSERT INTO CUSTOMER VALUES ('C006', 'NGUYEN F', 'HCM')
INSERT INTO CUSTOMER VALUES ('C007', 'NGUYEN G', 'DA NANG')
INSERT INTO CUSTOMER VALUES ('C008', 'NGUYEN H', 'HCM')
INSERT INTO CUSTOMER VALUES ('C009', 'NGUYEN I', 'HN')
INSERT INTO CUSTOMER VALUES ('C010', 'NGUYEN J', 'DA NANG')
SELECT * FROM CUSTOMER

--DELETE FROM RECEIPT
INSERT INTO RECEIPT VALUES ('R001', GETDATE(), 'DMX')
INSERT INTO RECEIPT VALUES ('R002', GETDATE(), 'GEAR')
INSERT INTO RECEIPT VALUES ('R003', GETDATE(), 'BB')
INSERT INTO RECEIPT VALUES ('R004', GETDATE(), 'COOP')
INSERT INTO RECEIPT VALUES ('R005', GETDATE(), 'DMX')
INSERT INTO RECEIPT VALUES ('R006', GETDATE(), 'BL')
INSERT INTO RECEIPT VALUES ('R007', GETDATE(), 'GEAR')
INSERT INTO RECEIPT VALUES ('R008', GETDATE(), 'MMZ')
INSERT INTO RECEIPT VALUES ('R009', GETDATE(), 'MMG')
INSERT INTO RECEIPT VALUES ('R010', GETDATE(), 'SCHA')
SELECT * FROM RECEIPT 
INSERT INTO INVOICE VALUES ('I001', 2, 10, 'C010')
INSERT INTO INVOICE VALUES ('I002', 1, 20, 'C009')
INSERT INTO INVOICE VALUES ('I003', 2, 30, 'C008')
INSERT INTO INVOICE VALUES ('I004', 1, 40, 'C009')
INSERT INTO INVOICE VALUES ('I005', 1, 50, 'C006')
INSERT INTO INVOICE VALUES ('I006', 2, 60, 'C010')
INSERT INTO INVOICE VALUES ('I007', 1, 70, 'C004')
INSERT INTO INVOICE VALUES ('I008', 2, 80, 'C003')
INSERT INTO INVOICE VALUES ('I009', 2, 90, 'C002')
INSERT INTO INVOICE VALUES ('I010', 2, 100, 'C001')
SELECT * FROM INVOICE 

--DELETE FROM PRODUCT
INSERT INTO PRODUCT (PRODUCT_CODE, PRODUCT_NAME, product_unit, product_quantity, product_price, counter_number, manufacturer_code, supplier_code)
VALUES ('GALAXYS7', 'SAMSUNG GALAXY S7', 10, 100, 10, 1, 'SAM', 'DMX') 
INSERT INTO PRODUCT VALUES  ('GALAXYS8', 'SAMSUNG GALAXY S8', 10, 100, 11, 1, 'SAM', 'DMX')
INSERT INTO PRODUCT VALUES  ('GALAXYS9', 'SAMSUNG GALAXY S9', 10, 100, 12, 1, 'SAM', 'DMX')
INSERT INTO PRODUCT VALUES  ('GALAXYS10', 'SAMSUNG GALAXY S10', 10, 100, 13, 2, 'SAM', 'DMX')
INSERT INTO PRODUCT VALUES  ('GTABS7', 'GALAXY TAB S7', 10, 100, 100, 3, 'SAM', 'TGDD')
INSERT INTO PRODUCT VALUES  ('IPHONE5', 'APPLE IPHONE 5', 10, 100, 20, 2, 'APP', 'BL')
INSERT INTO PRODUCT VALUES  ('IPHONE6', 'APPLE IPHONE 6', 10, 100, 21, 3, 'APP', 'BL')
INSERT INTO PRODUCT VALUES  ('IPHONE7', 'APPLE IPHONE 7', 10, 100, 22, 4, 'APP', 'BB')
INSERT INTO PRODUCT VALUES  ('IPHONE8', 'APPLE IPHONE 8', 10, 100, 23, 5, 'APP', 'BB')
INSERT INTO PRODUCT VALUES  ('IPHONE10', 'APPLE IPHONE 10', 10, 100, 25, 6, 'APP', 'BB')
SELECT * FROM PRODUCT

--DELETE FROM IMPORTED
INSERT INTO IMPORTED (receipt_code, product_code, product_quantity, product_price) VALUES ('R001', 'GALAXYS7', 100, 10)
INSERT INTO IMPORTED VALUES ('R001', 'GALAXYS8', 100, 11)
INSERT INTO IMPORTED VALUES ('R002', 'GALAXYS9', 100, 12) 
INSERT INTO IMPORTED VALUES ('R003', 'GALAXYS10', 100, 13) 
INSERT INTO IMPORTED VALUES ('R003', 'GTABS7', 100, 100)
INSERT INTO IMPORTED VALUES ('R006', 'IPHONE5', 100, 20)
INSERT INTO IMPORTED VALUES ('R006', 'IPHONE6', 100, 21) 
INSERT INTO IMPORTED VALUES ('R007', 'IPHONE7', 100, 22) 
INSERT INTO IMPORTED VALUES ('R008', 'IPHONE8', 100, 23)
INSERT INTO IMPORTED VALUES ('R008', 'IPHONE10', 100, 25)
SELECT * FROM IMPORTED
INSERT INTO PURCHASED (invoice_code, product_code) VALUES ('I001', 'GALAXYS7')
INSERT INTO PURCHASED VALUES ('I001', 'GALAXYS8')
INSERT INTO PURCHASED VALUES ('I002', 'GALAXYS9') 
INSERT INTO PURCHASED VALUES ('I003', 'GALAXYS10') 
INSERT INTO PURCHASED VALUES ('I003', 'GTABS7')
INSERT INTO PURCHASED VALUES ('I006', 'IPHONE5')
INSERT INTO PURCHASED VALUES ('I006', 'IPHONE6') 
INSERT INTO PURCHASED VALUES ('I007', 'IPHONE7') 
INSERT INTO PURCHASED VALUES ('I008', 'IPHONE8')
INSERT INTO PURCHASED VALUES ('I008', 'IPHONE10')
SELECT * FROM PURCHASED


--ADD DATA TO PRODUCT
--DROP PROC ADD_DATA_TO_PRODUCT
CREATE PROC ADD_DATA_TO_PRODUCT @prod_code VARCHAR(10), @prod_name VARCHAR(20), @unit INT, @quantity INT, @price FLOAT, @counter_number INT, @manufacturer_code VARCHAR(10), @supplier_code VARCHAR(10)
AS 
BEGIN
	--KIEM TRA KHOA CHINH 
    IF(EXISTS(SELECT * FROM PRODUCT AS PR WHERE PR.PRODUCT_CODE = @prod_code AND PR.PRODUCT_NAME = @prod_name AND PR.PRODUCT_UNIT = @unit AND PR.PRODUCT_QUANTITY = @quantity AND PR.COUNTER_NUMBER = @counter_number AND PR.MANUFACTURER_CODE = @manufacturer_code AND PR.SUPPLIER_CODE = @supplier_code))
    BEGIN
    	PRINT 'PRODUCT EXISTED'
    END
    ELSE IF(EXISTS(SELECT * FROM PRODUCT AS PR WHERE PR.PRODUCT_CODE = @prod_code))
    BEGIN
    	PRINT 'PRODUCT EXISTED'
    END
    --KIEM TRA KHOA NGOAI
    ELSE IF(NOT EXISTS(SELECT * FROM COUNTER WHERE COUNTER.COUNTER_NUMBER = @counter_number))
    BEGIN
    	PRINT 'COUNTER NOT EXISTS'
    END
    ELSE IF(NOT EXISTS(SELECT * FROM MANUFACTURER WHERE MANUFACTURER.MANUFACTURER_CODE = @manufacturer_code))
    BEGIN
    	PRINT 'MANUFACTURER NOT EXISTS'
    END
    ELSE IF(NOT EXISTS(SELECT * FROM SUPPLIER WHERE SUPPLIER.SUPPLIER_CODE = @supplier_code))
    BEGIN
    	PRINT 'SUPPLIER NOT FOUND'
    END
    ELSE
    BEGIN
    	INSERT INTO PRODUCT VALUES (@prod_code, @prod_name, @unit, @quantity, @price, @counter_number, @manufacturer_code, @supplier_code)
        PRINT 'PRODUCT ADDED'
    	SELECT * FROM PRODUCT
    END
END
--SELECT * FROM PRODUCT
EXEC ADD_DATA_TO_PRODUCT 'XIAOMI5', 'XIAOMI MI 5', 10, 100, 10, 6, 'XI', 'TGDD'

--CALCULATE THE TOTAL PRICE OF ALL THE PRODUCTS 
CREATE FUNCTION CALCULATE_SUM_IMPORTED (@receipt_code VARCHAR(10))
RETURNS INT
AS
BEGIN
	RETURN (SELECT SUM(IMPORTED.PRODUCT_QUANTITY * IMPORTED.PRODUCT_PRICE) FROM IMPORTED WHERE IMPORTED.RECEIPT_CODE = @receipt_code)
END
PRINT DBO.CALCULATE_SUM_IMPORTED('R001')
--SELECT SUM(IMPORTED.PRODUCT_QUANTITY * IMPORTED.PRODUCT_PRICE) FROM IMPORTED WHERE IMPORTED.RECEIPT_CODE='R001'

--UPDATE THE QUANTITY AND PRICE FOR THE PRODUCT WHEN INSERTED THE IMPORT
CREATE TRIGGER CAU6
ON IMPORTED
FOR INSERT
AS
	--DECLARE VALUES
	DECLARE @receipt_code VARCHAR(10)
    DECLARE @product_code VARCHAR(10)
    DECLARE @product_quantity INT
    DECLARE @product_price FLOAT
    
    IF(EXISTS(SELECT * FROM INSERTED))
    BEGIN
    	SELECT @product_code = product_code FROM INSERTED
        SELECT @product_quantity = product_quantity FROM INSERTED
        SELECT @product_price = product_price FROM INSERTED
        --CHECK IF THE PRODUCT EXISTED YET
        if(EXISTS(SELECT * FROM PRODUCT AS PR WHERE PR.PRODUCT_CODE = @product_code))
        BEGIN
        	UPDATE PRODUCT SET PRODUCT.PRODUCT_QUANTITY = PRODUCT.PRODUCT_QUANTITY + @product_quantity WHERE PRODUCT.PRODUCT_CODE = @product_code
        	UPDATE PRODUCT SET PRODUCT.PRODUCT_PRICE = @product_price WHERE PRODUCT.PRODUCT_CODE = @product_code
    	END
        ELSE
        BEGIN
        	PRINT 'PRODUCT DOES NOT EXIST'
        END
    END
SELECT * FROM PRODUCT
SELECT * FROM IMPORTED
INSERT INTO IMPORTED VALUES ('R001', 'XIAOMI5', 50, 15)
--INSERT INTO IMPORTED VALUES ('R001', 'HUAWEI', 50, 15)
SELECT * FROM PRODUCT
SELECT * FROM IMPORTED
DELETE FROM IMPORTED WHERE IMPORTED.PRODUCT_CODE = 'XIAOMI5'