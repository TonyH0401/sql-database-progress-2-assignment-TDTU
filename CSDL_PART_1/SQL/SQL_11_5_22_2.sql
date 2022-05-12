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
  	RECEIPT_PROD_QUANTITY INT,
  	PRICE FLOAT,
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
  	CONSTRAINT PK_IMPORTED PRIMARY KEY (RECEIPT_CODE, PRODUCT_CODE),
  	CONSTRAINT FK_IMPORTED_RECEIPT_RECEIPT_CODE FOREIGN KEY (RECEIPT_CODE) REFERENCES RECEIPT (RECEIPT_CODE),
  	CONSTRAINT FK_IMPORTED_PRODUCT_PRODUCT_CODE FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE)
)
CREATE TABLE PURCHASED(
	INVOICE_CODE VARCHAR(10),	
  	PRODUCT_CODE VARCHAR(10),
  	CONSTRAINT PK_PURCHASED PRIMARY KEY (INVOICE_CODE, PRODUCT_CODE),
  	CONSTRAINT FK_PURCHASED_INVOICE_INVOICE_CODE FOREIGN KEY (INVOICE_CODE) REFERENCES INVOICE (INVOICE_CODE),
  	CONSTRAINT FK_PURCHASED_PRODUCT_PRODUCT_CODE FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE)
)