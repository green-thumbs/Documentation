
-- Create Table Inventory
CREATE TABLE Inventory (
    inventoryId INT UNSIGNED AUTO_INCREMENT,
    imagePath VARCHAR(75) NOT NULL UNIQUE,
    inventoryName VARCHAR(45) NOT NULL UNIQUE,
    inventoryDesc VARCHAR(200) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    PRIMARY KEY(inventoryId)
);

-- Create Table Employees 
CREATE TABLE Employees (
    employeeId INT UNSIGNED AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,    
    PRIMARY KEY(employeeId)
);

-- Create Table Equipments 
CREATE TABLE Equipments (
    employeeId INT UNSIGNED AUTO_INCREMENT,
    equipName VARCHAR(45) NOT NULL UNIQUE,
    equipDesc VARCHAR(200) NOT NULL,
    PRIMARY KEY(employeeId)
);

-- Create Table CustomerBilling 
CREATE TABLE CustomerBilling (
    billingId INT UNSIGNED AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    address1 VARCHAR(200) NOT NULL,
    address2 VARCHAR(200),
    city VARCHAR(65) NOT NULL,
    state CHAR(2) NOT NULL,
    zipcode CHAR(5) NOT NULL,     
    cardType VARCHAR(40) NOT NULL,
    cardNumber VARCHAR(24) NOT NULL,
    cardExpireMonth VARCHAR(2) NOT NULL,
    cardExpireYear VARCHAR(4) NOT NULL,
    PRIMARY KEY(billingId)   
);

-- Create Table CustomerOrders 
CREATE TABLE CustomerOrders (
    orderId INT UNSIGNED AUTO_INCREMENT,
    billingId INT UNSIGNED NOT NULL,
    dateOrdered DATE NOT NULL,    
    totalPrice DECIMAL(10,2) NOT NULL,    
    PRIMARY KEY(orderId),    
    FOREIGN KEY(billingID) REFERENCES CustomerBilling(billingId)
            ON DELETE CASCADE
);

-- Create Table OrderDetails 
CREATE TABLE ProdOrderDetails (
    orderDetailsId INT UNSIGNED NOT NULL,
    orderId INT UNSIGNED NOT NULL,
    inventoryId INT UNSIGNED NOT NULL,
    quantity INT(3) UNSIGNED NOT NULL,
    unitPrice DECIMAL(8,2) NOT NULL,
    subTotal DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(orderDetailsId),   
    FOREIGN KEY(orderId) REFERENCES CustomerOrders(orderId)
        ON DELETE CASCADE,
    FOREIGN KEY(inventoryId) REFERENCES Inventory(inventoryId)
            ON DELETE CASCADE
);

-- Create Table Calendar 
CREATE TABLE Calendar (
    calendarId INT UNSIGNED NOT NULL,
    availableDays DATE NOT NULL,
    PRIMARY KEY(calendarId)    
);

-- Create Table ScheduledDate 
CREATE TABLE ScheduledDate (
    scheduledDateId INT UNSIGNED NOT NULL,
    orderId INT UNSIGNED NOT NULL,
    calendarId INT UNSIGNED NOT NULL,
    PRIMARY KEY(scheduledDateId),
    FOREIGN KEY(orderId) REFERENCES CustomerOrders(orderId)
        ON DELETE CASCADE,
    FOREIGN KEY(calendarId) REFERENCES Calendar(calendarId)
            ON DELETE CASCADE
);
