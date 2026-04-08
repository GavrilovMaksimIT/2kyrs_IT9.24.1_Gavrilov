create or replace procedure Structure_Create ()
language plpgsql
as $$

begin

create table if not exists Instrument_Type
(
    ID_Instrument_Type serial not null constraint PK_Instrument_Type primary key,
    Name_Instrument_Type Varchar(50) not null
);

create index if not exists index_ID_Instrument_Type on Instrument_Type (ID_Instrument_Type);
create index if not exists index_Name_Instrument_Type on Instrument_Type (Name_Instrument_Type);

create table if not exists Country
(
    ID_Country serial not null constraint PK_Country primary key,
    Name_Country Varchar(50) not null
);

create index if not exists index_ID_Country on Country (ID_Country);
create index if not exists index_Name_Country on Country (Name_Country);

create table if not exists Material
(
    ID_Material serial not null constraint PK_Material primary key,
    Name_Material Varchar(100) not null
);

create index if not exists index_ID_Material on Material (ID_Material);
create index if not exists index_Name_Material on Material (Name_Material);

create table if not exists Post
(
    ID_Post Serial not null constraint PK_Post primary key,
    Name_Post Varchar(50) not null
);

create index if not exists index_ID_Post on Post (ID_Post);
create index if not exists index_Name_Post on Post (Name_Post);

create table if not exists Status
(
    ID_Status Serial not null constraint PK_Status primary key,
    Name_Status Varchar(50) not null
);

create index if not exists index_ID_Status on Status (ID_Status);
create index if not exists index_Name_Status on Status (Name_Status);


create table if not exists User_Profile
(
    UP_Login Varchar(36) not null constraint PK_User_Profile primary key,
    UP_Password Varchar(36) not null,
    U_Surname Varchar(50) not null,
    U_Name Varchar(50) not null,
    U_Patronymic Varchar(50) null
);

create index if not exists index_UP_Login_Password on User_Profile (UP_Login, UP_Password);
create index if not exists index_U_Surname_Name_Patronymic on User_Profile (U_Surname, U_Name, U_Patronymic);

create table if not exists Employee
(
    Employee_Login Varchar(36) not null constraint PK_Employee primary key
        references User_Profile (UP_Login) on update cascade on delete cascade,
    Personal_File_N Varchar(13) not null
);

create index if not exists index_Employee_Login on Employee (Employee_Login);
create index if not exists index_Personal_File_N on Employee (Personal_File_N);

create table if not exists Customer
(
    Customer_Login Varchar(36) not null constraint PK_Customer primary key
        references User_Profile (UP_Login) on update cascade on delete cascade,
    Passport_Data Varchar(20) not null,
    Address Varchar(200) not null,
    Phone Varchar(20) not null,
    Bank_Card Varchar(25) not null
);

create index if not exists index_Customer_Login on Customer (Customer_Login);
create index if not exists index_Passport_Data on Customer (Passport_Data);

create table if not exists Supplier
(
    ID_Supplier Serial not null constraint PK_Supplier primary key,
    Full_Name_Supplier Varchar(200) not null,
    Legal_Address Varchar(200) not null,
    Phone Varchar(20) not null,
    BIK Varchar(9) not null,
    OKPO Varchar(20) not null,
    Responsible_Login Varchar(36) not null references User_Profile (UP_Login) on update cascade on delete cascade
);

create index if not exists index_ID_Supplier on Supplier (ID_Supplier);
create index if not exists index_OKPO on Supplier (OKPO);

create table if not exists Instrument
(
    ID_Instrument Serial not null constraint PK_Instrument primary key,
    Article Varchar(15) not null unique,
    ID_Instrument_Type Int not null references Instrument_Type (ID_Instrument_Type),
    ID_Country Int not null references Country (ID_Country),
    Brand_Model Varchar(100) not null,
    Frequency_Range Varchar(50) not null,
    ID_Material Int not null references Material (ID_Material),
    Quantity Int not null default 0,
    Price Decimal(10,2) not null
);

create index if not exists index_ID_Instrument on Instrument (ID_Instrument);
create index if not exists index_Article on Instrument (Article);
create index if not exists index_Brand_Model on Instrument (Brand_Model);

create table if not exists Supply_Estimate
(
    ID_Supply_Estimate Serial not null constraint PK_Supply_Estimate primary key,
    Estimate_Number Varchar(15) not null unique,
    ID_Supplier Int not null references Supplier (ID_Supplier),
    ID_Status Int not null references Status (ID_Status),
    Total_Amount Decimal(12,2) not null,
    Create_DateTime Timestamp not null default current_timestamp
);

create index if not exists index_ID_Supply_Estimate on Supply_Estimate (ID_Supply_Estimate);
create index if not exists index_Estimate_Number on Supply_Estimate (Estimate_Number);
create index if not exists index_Create_DateTime on Supply_Estimate (Create_DateTime);

create table if not exists Estimate_Item
(
    ID_Estimate_Item Serial not null constraint PK_Estimate_Item primary key,
    ID_Supply_Estimate Int not null references Supply_Estimate (ID_Supply_Estimate),
    ID_Instrument Int not null references Instrument (ID_Instrument),
    Quantity Int not null,
    Item_Price Decimal(10,2) not null
);

create index if not exists index_ID_Estimate_Item on Estimate_Item (ID_Estimate_Item);

create table if not exists Supply_Receipt
(
    ID_Supply_Receipt Serial not null constraint PK_Supply_Receipt primary key,
    Receipt_Number Varchar(25) not null unique,
    ID_Supply_Estimate Int not null references Supply_Estimate (ID_Supply_Estimate),
    Payment_DateTime Timestamp not null default current_timestamp,
    Amount_Paid Decimal(12,2) not null,
    Employee_Login Varchar(36) not null references Employee (Employee_Login) on update cascade on delete cascade
);

create index if not exists index_ID_Supply_Receipt on Supply_Receipt (ID_Supply_Receipt);
create index if not exists index_Receipt_Number on Supply_Receipt (Receipt_Number);

create table if not exists Purchase_Order
(
    ID_Purchase_Order Serial not null constraint PK_Purchase_Order primary key,
    Order_Number Varchar(20) not null unique,
    Customer_Login Varchar(36) not null references Customer (Customer_Login) on update cascade on delete cascade,
    ID_Status Int not null references Status (ID_Status),
    Total_Amount Decimal(12,2) not null,
    Create_DateTime Timestamp not null default current_timestamp
);

create index if not exists index_ID_Purchase_Order on Purchase_Order (ID_Purchase_Order);
create index if not exists index_Order_Number on Purchase_Order (Order_Number);

create table if not exists Order_Item
(
    ID_Order_Item Serial not null constraint PK_Order_Item primary key,
    ID_Purchase_Order Int not null references Purchase_Order (ID_Purchase_Order),
    ID_Instrument Int not null references Instrument (ID_Instrument),
    Quantity Int not null,
    Item_Price Decimal(10,2) not null
);

create index if not exists index_ID_Order_Item on Order_Item (ID_Order_Item);

create table if not exists Purchase_Receipt
(
    ID_Purchase_Receipt Serial not null constraint PK_Purchase_Receipt primary key,
    Receipt_Number Varchar(25) not null unique,
    ID_Purchase_Order Int not null references Purchase_Order (ID_Purchase_Order),
    Payment_DateTime Timestamp not null default current_timestamp,
    Payment_Type Varchar(20) not null,
    Amount_Paid Decimal(12,2) not null,
    Change_Amount Decimal(10,2) null,
    Employee_Login Varchar(36) not null references Employee (Employee_Login) on update cascade on delete cascade
);

create index if not exists index_ID_Purchase_Receipt on Purchase_Receipt (ID_Purchase_Receipt);

grant select, insert, update on Instrument to rl_manager;
grant usage, select on sequence instrument_id_instrument_seq to rl_manager;
grant select, insert, update on Supplier to rl_manager;
grant usage, select on sequence supplier_id_supplier_seq to rl_manager;
grant select, insert, update on Supply_Estimate to rl_manager;
grant usage, select on sequence supply_estimate_id_supply_estimate_seq to rl_manager;
grant select, insert, update, delete on Estimate_Item to rl_manager;
grant usage, select on sequence estimate_item_id_estimate_item_seq to rl_manager;
grant select on Supply_Receipt to rl_manager;
grant select on Status to rl_manager;
grant select on Instrument_Type to rl_manager;
grant select on Country to rl_manager;
grant select on Material to rl_manager;
grant select, update on User_Profile to rl_manager;

grant select, update on Instrument to rl_sales;
grant select, insert, update on Purchase_Order to rl_sales;
grant usage, select on sequence purchase_order_id_purchase_order_seq to rl_sales;
grant select, insert, update, delete on Order_Item to rl_sales;
grant usage, select on sequence order_item_id_order_item_seq to rl_sales;
grant select on Purchase_Receipt to rl_sales;
grant select on Customer to rl_sales;
grant select on Status to rl_sales;
grant select on Instrument_Type to rl_sales;
grant select on Country to rl_sales;
grant select on Material to rl_sales;
grant select, update on User_Profile to rl_sales;

grant select on Instrument to rl_accountant;
grant select on Supplier to rl_accountant;
grant select on Supply_Estimate to rl_accountant;
grant select on Estimate_Item to rl_accountant;
grant select, insert, update on Supply_Receipt to rl_accountant;
grant usage, select on sequence supply_receipt_id_supply_receipt_seq to rl_accountant;
grant select on Purchase_Order to rl_accountant;
grant select on Order_Item to rl_accountant;
grant select, insert, update on Purchase_Receipt to rl_accountant;
grant usage, select on sequence purchase_receipt_id_purchase_receipt_seq to rl_accountant;
grant select on Customer to rl_accountant;
grant select on Employee to rl_accountant;
grant select on Status to rl_accountant;
grant select, insert, update, delete on Instrument_Type to rl_admin;
grant usage, select on sequence instrument_type_id_instrument_type_seq to rl_admin;
grant select, insert, update, delete on Country to rl_admin;
grant usage, select on sequence country_id_country_seq to rl_admin;
grant select, insert, update, delete on Material to rl_admin;
grant usage, select on sequence material_id_material_seq to rl_admin;
grant select, insert, update, delete on Post to rl_admin;
grant usage, select on sequence post_id_post_seq to rl_admin;
grant select, insert, update, delete on Status to rl_admin;
grant usage, select on sequence status_id_status_seq to rl_admin;
grant select, insert, update, delete on User_Profile to rl_admin;
grant select, insert, update, delete on Employee to rl_admin;
grant select, insert, update, delete on Customer to rl_admin;
grant select, insert, update, delete on Supplier to rl_admin;
grant select, insert, update, delete on Instrument to rl_admin;
grant select, insert, update, delete on Supply_Estimate to rl_admin;
grant select, insert, update, delete on Estimate_Item to rl_admin;
grant select, insert, update, delete on Supply_Receipt to rl_admin;
grant select, insert, update, delete on Purchase_Order to rl_admin;
grant select, insert, update, delete on Order_Item to rl_admin;
grant select, insert, update, delete on Purchase_Receipt to rl_admin;

end;

$$;