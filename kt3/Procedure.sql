
create or replace procedure Instrument_Type_Insert (p_Name_Instrument_Type Varchar(50))
language plpgsql
as $$
begin
    insert into Instrument_Type (Name_Instrument_Type) values (p_Name_Instrument_Type);
end;
$$;

create or replace procedure Instrument_Type_Update (p_ID_Instrument_Type int, p_Name_Instrument_Type Varchar(50))
language plpgsql
as $$
begin
    update Instrument_Type set Name_Instrument_Type = p_Name_Instrument_Type where ID_Instrument_Type = p_ID_Instrument_Type;
end;
$$;

create or replace procedure Instrument_Type_Delete (p_ID_Instrument_Type int)
language plpgsql
as $$
begin
    delete from Instrument_Type where ID_Instrument_Type = p_ID_Instrument_Type;
end;
$$;

create or replace procedure Country_Insert (p_Name_Country Varchar(50))
language plpgsql
as $$
begin
    insert into Country (Name_Country) values (p_Name_Country);
end;
$$;

create or replace procedure Country_Update (p_ID_Country int, p_Name_Country Varchar(50))
language plpgsql
as $$
begin
    update Country set Name_Country = p_Name_Country where ID_Country = p_ID_Country;
end;
$$;

create or replace procedure Country_Delete (p_ID_Country int)
language plpgsql
as $$
begin
    delete from Country where ID_Country = p_ID_Country;
end;
$$;

create or replace procedure Material_Insert (p_Name_Material Varchar(100))
language plpgsql
as $$
begin
    insert into Material (Name_Material) values (p_Name_Material);
end;
$$;

create or replace procedure Material_Update (p_ID_Material int, p_Name_Material Varchar(100))
language plpgsql
as $$
begin
    update Material set Name_Material = p_Name_Material where ID_Material = p_ID_Material;
end;
$$;

create or replace procedure Material_Delete (p_ID_Material int)
language plpgsql
as $$
begin
    delete from Material where ID_Material = p_ID_Material;
end;
$$;

create or replace procedure Post_Insert (p_Name_Post Varchar(50))
language plpgsql
as $$
begin
    insert into Post (Name_Post) values (p_Name_Post);
end;
$$;

create or replace procedure Post_Update (p_ID_Post int, p_Name_Post Varchar(50))
language plpgsql
as $$
begin
    update Post set Name_Post = p_Name_Post where ID_Post = p_ID_Post;
end;
$$;

create or replace procedure Post_Delete (p_ID_Post int)
language plpgsql
as $$
begin
    delete from Post where ID_Post = p_ID_Post;
end;
$$;

create or replace procedure Status_Insert (p_Name_Status Varchar(50))
language plpgsql
as $$
begin
    insert into Status (Name_Status) values (p_Name_Status);
end;
$$;

create or replace procedure Status_Update (p_ID_Status int, p_Name_Status Varchar(50))
language plpgsql
as $$
begin
    update Status set Name_Status = p_Name_Status where ID_Status = p_ID_Status;
end;
$$;

create or replace procedure Status_Delete (p_ID_Status int)
language plpgsql
as $$
begin
    delete from Status where ID_Status = p_ID_Status;
end;
$$;

create or replace procedure User_Profile_Insert (
    p_UP_Login Varchar(36), 
    p_UP_Password Varchar(36), 
    p_U_Surname Varchar(50),
    p_U_Name Varchar(50), 
    p_U_Patronymic Varchar(50)
)
language plpgsql
as $$
begin
    insert into User_Profile (UP_Login, UP_Password, U_Surname, U_Name, U_Patronymic)
    values (p_UP_Login, p_UP_Password, p_U_Surname, p_U_Name, p_U_Patronymic);
end;
$$;

create or replace procedure User_Profile_Update (
    p_UP_Login_Old Varchar(36), 
    p_UP_Login_New Varchar(36), 
    p_UP_Password Varchar(36),
    p_U_Surname Varchar(50), 
    p_U_Name Varchar(50), 
    p_U_Patronymic Varchar(50)
)
language plpgsql
as $$
begin
    update User_Profile set 
        UP_Login = p_UP_Login_New,
        UP_Password = p_UP_Password,
        U_Surname = p_U_Surname,
        U_Name = p_U_Name,
        U_Patronymic = p_U_Patronymic
    where UP_Login = p_UP_Login_Old;
end;
$$;

create or replace procedure User_Profile_Delete (p_UP_Login Varchar(36))
language plpgsql
as $$
begin
    delete from User_Profile where UP_Login = p_UP_Login;
end;
$$;

create or replace procedure Employee_Insert (p_Employee_Login Varchar(36), p_Personal_File_N Varchar(13))
language plpgsql
as $$
begin
    insert into Employee (Employee_Login, Personal_File_N) values (p_Employee_Login, p_Personal_File_N);
end;
$$;

create or replace procedure Employee_Update (
    p_Employee_Login_Old Varchar(36), 
    p_Employee_Login_New Varchar(36), 
    p_Personal_File_N Varchar(13)
)
language plpgsql
as $$
begin
    update Employee set 
        Employee_Login = p_Employee_Login_New,
        Personal_File_N = p_Personal_File_N
    where Employee_Login = p_Employee_Login_Old;
end;
$$;

create or replace procedure Employee_Delete (p_Employee_Login Varchar(36))
language plpgsql
as $$
begin
    delete from Employee where Employee_Login = p_Employee_Login;
end;
$$;

create or replace procedure Customer_Insert (
    p_Customer_Login Varchar(36),
    p_Passport_Data Varchar(20),
    p_Address Varchar(200),
    p_Phone Varchar(20),
    p_Bank_Card Varchar(25)
)
language plpgsql
as $$
begin
    insert into Customer (Customer_Login, Passport_Data, Address, Phone, Bank_Card)
    values (p_Customer_Login, p_Passport_Data, p_Address, p_Phone, p_Bank_Card);
end;
$$;

create or replace procedure Customer_Update (
    p_Customer_Login_Old Varchar(36),
    p_Customer_Login_New Varchar(36),
    p_Passport_Data Varchar(20),
    p_Address Varchar(200),
    p_Phone Varchar(20),
    p_Bank_Card Varchar(25)
)
language plpgsql
as $$
begin
    update Customer set 
        Customer_Login = p_Customer_Login_New,
        Passport_Data = p_Passport_Data,
        Address = p_Address,
        Phone = p_Phone,
        Bank_Card = p_Bank_Card
    where Customer_Login = p_Customer_Login_Old;
end;
$$;

create or replace procedure Customer_Delete (p_Customer_Login Varchar(36))
language plpgsql
as $$
begin
    delete from Customer where Customer_Login = p_Customer_Login;
end;
$$;

create or replace procedure Supplier_Insert (
    p_Full_Name_Supplier Varchar(200),
    p_Legal_Address Varchar(200),
    p_Phone Varchar(20),
    p_BIK Varchar(9),
    p_OKPO Varchar(20),
    p_Responsible_Login Varchar(36)
)
language plpgsql
as $$
begin
    insert into Supplier (Full_Name_Supplier, Legal_Address, Phone, BIK, OKPO, Responsible_Login)
    values (p_Full_Name_Supplier, p_Legal_Address, p_Phone, p_BIK, p_OKPO, p_Responsible_Login);
end;
$$;

create or replace procedure Supplier_Update (
    p_ID_Supplier int,
    p_Full_Name_Supplier Varchar(200),
    p_Legal_Address Varchar(200),
    p_Phone Varchar(20),
    p_BIK Varchar(9),
    p_OKPO Varchar(20),
    p_Responsible_Login Varchar(36)
)
language plpgsql
as $$
begin
    update Supplier set 
        Full_Name_Supplier = p_Full_Name_Supplier,
        Legal_Address = p_Legal_Address,
        Phone = p_Phone,
        BIK = p_BIK,
        OKPO = p_OKPO,
        Responsible_Login = p_Responsible_Login
    where ID_Supplier = p_ID_Supplier;
end;
$$;

create or replace procedure Supplier_Delete (p_ID_Supplier int)
language plpgsql
as $$
begin
    delete from Supplier where ID_Supplier = p_ID_Supplier;
end;
$$;

create or replace procedure Instrument_Insert (
    p_Article Varchar(15),
    p_ID_Instrument_Type int,
    p_ID_Country int,
    p_Brand_Model Varchar(100),
    p_Frequency_Range Varchar(50),
    p_ID_Material int,
    p_Quantity int,
    p_Price Decimal(10,2)
)
language plpgsql
as $$
begin
    insert into Instrument (Article, ID_Instrument_Type, ID_Country, Brand_Model, Frequency_Range, ID_Material, Quantity, Price)
    values (p_Article, p_ID_Instrument_Type, p_ID_Country, p_Brand_Model, p_Frequency_Range, p_ID_Material, p_Quantity, p_Price);
end;
$$;

create or replace procedure Instrument_Update (
    p_ID_Instrument int,
    p_Article Varchar(15),
    p_ID_Instrument_Type int,
    p_ID_Country int,
    p_Brand_Model Varchar(100),
    p_Frequency_Range Varchar(50),
    p_ID_Material int,
    p_Quantity int,
    p_Price Decimal(10,2)
)
language plpgsql
as $$
begin
    update Instrument set 
        Article = p_Article,
        ID_Instrument_Type = p_ID_Instrument_Type,
        ID_Country = p_ID_Country,
        Brand_Model = p_Brand_Model,
        Frequency_Range = p_Frequency_Range,
        ID_Material = p_ID_Material,
        Quantity = p_Quantity,
        Price = p_Price
    where ID_Instrument = p_ID_Instrument;
end;
$$;

create or replace procedure Instrument_Delete (p_ID_Instrument int)
language plpgsql
as $$
begin
    delete from Instrument where ID_Instrument = p_ID_Instrument;
end;
$$;

create or replace procedure Supply_Estimate_Insert (
    p_Estimate_Number Varchar(15),
    p_ID_Supplier int,
    p_ID_Status int,
    p_Total_Amount Decimal(12,2)
)
language plpgsql
as $$
begin
    insert into Supply_Estimate (Estimate_Number, ID_Supplier, ID_Status, Total_Amount)
    values (p_Estimate_Number, p_ID_Supplier, p_ID_Status, p_Total_Amount);
end;
$$;

create or replace procedure Supply_Estimate_Update (
    p_ID_Supply_Estimate int,
    p_Estimate_Number Varchar(15),
    p_ID_Supplier int,
    p_ID_Status int,
    p_Total_Amount Decimal(12,2)
)
language plpgsql
as $$
begin
    update Supply_Estimate set 
        Estimate_Number = p_Estimate_Number,
        ID_Supplier = p_ID_Supplier,
        ID_Status = p_ID_Status,
        Total_Amount = p_Total_Amount
    where ID_Supply_Estimate = p_ID_Supply_Estimate;
end;
$$;

create or replace procedure Supply_Estimate_Delete (p_ID_Supply_Estimate int)
language plpgsql
as $$
begin
    delete from Supply_Estimate where ID_Supply_Estimate = p_ID_Supply_Estimate;
end;
$$;

create or replace procedure Estimate_Item_Insert (
    p_ID_Supply_Estimate int,
    p_ID_Instrument int,
    p_Quantity int,
    p_Item_Price Decimal(10,2)
)
language plpgsql
as $$
begin
    insert into Estimate_Item (ID_Supply_Estimate, ID_Instrument, Quantity, Item_Price)
    values (p_ID_Supply_Estimate, p_ID_Instrument, p_Quantity, p_Item_Price);
end;
$$;

create or replace procedure Estimate_Item_Update (
    p_ID_Estimate_Item int,
    p_ID_Supply_Estimate int,
    p_ID_Instrument int,
    p_Quantity int,
    p_Item_Price Decimal(10,2)
)
language plpgsql
as $$
begin
    update Estimate_Item set 
        ID_Supply_Estimate = p_ID_Supply_Estimate,
        ID_Instrument = p_ID_Instrument,
        Quantity = p_Quantity,
        Item_Price = p_Item_Price
    where ID_Estimate_Item = p_ID_Estimate_Item;
end;
$$;

create or replace procedure Estimate_Item_Delete (p_ID_Estimate_Item int)
language plpgsql
as $$
begin
    delete from Estimate_Item where ID_Estimate_Item = p_ID_Estimate_Item;
end;
$$;

create or replace procedure Supply_Receipt_Insert (
    p_Receipt_Number Varchar(25),
    p_ID_Supply_Estimate int,
    p_Amount_Paid Decimal(12,2),
    p_Employee_Login Varchar(36)
)
language plpgsql
as $$
begin
    insert into Supply_Receipt (Receipt_Number, ID_Supply_Estimate, Amount_Paid, Employee_Login)
    values (p_Receipt_Number, p_ID_Supply_Estimate, p_Amount_Paid, p_Employee_Login);
end;
$$;

create or replace procedure Supply_Receipt_Update (
    p_ID_Supply_Receipt int,
    p_Receipt_Number Varchar(25),
    p_ID_Supply_Estimate int,
    p_Amount_Paid Decimal(12,2),
    p_Employee_Login Varchar(36)
)
language plpgsql
as $$
begin
    update Supply_Receipt set 
        Receipt_Number = p_Receipt_Number,
        ID_Supply_Estimate = p_ID_Supply_Estimate,
        Amount_Paid = p_Amount_Paid,
        Employee_Login = p_Employee_Login
    where ID_Supply_Receipt = p_ID_Supply_Receipt;
end;
$$;

create or replace procedure Supply_Receipt_Delete (p_ID_Supply_Receipt int)
language plpgsql
as $$
begin
    delete from Supply_Receipt where ID_Supply_Receipt = p_ID_Supply_Receipt;
end;
$$;

create or replace procedure Purchase_Order_Insert (
    p_Order_Number Varchar(20),
    p_Customer_Login Varchar(36),
    p_ID_Status int,
    p_Total_Amount Decimal(12,2)
)
language plpgsql
as $$
begin
    insert into Purchase_Order (Order_Number, Customer_Login, ID_Status, Total_Amount)
    values (p_Order_Number, p_Customer_Login, p_ID_Status, p_Total_Amount);
end;
$$;

create or replace procedure Purchase_Order_Update (
    p_ID_Purchase_Order int,
    p_Order_Number Varchar(20),
    p_Customer_Login Varchar(36),
    p_ID_Status int,
    p_Total_Amount Decimal(12,2)
)
language plpgsql
as $$
begin
    update Purchase_Order set 
        Order_Number = p_Order_Number,
        Customer_Login = p_Customer_Login,
        ID_Status = p_ID_Status,
        Total_Amount = p_Total_Amount
    where ID_Purchase_Order = p_ID_Purchase_Order;
end;
$$;

create or replace procedure Purchase_Order_Delete (p_ID_Purchase_Order int)
language plpgsql
as $$
begin
    delete from Purchase_Order where ID_Purchase_Order = p_ID_Purchase_Order;
end;
$$;

create or replace procedure Order_Item_Insert (
    p_ID_Purchase_Order int,
    p_ID_Instrument int,
    p_Quantity int,
    p_Item_Price Decimal(10,2)
)
language plpgsql
as $$
begin
    insert into Order_Item (ID_Purchase_Order, ID_Instrument, Quantity, Item_Price)
    values (p_ID_Purchase_Order, p_ID_Instrument, p_Quantity, p_Item_Price);
end;
$$;

create or replace procedure Order_Item_Update (
    p_ID_Order_Item int,
    p_ID_Purchase_Order int,
    p_ID_Instrument int,
    p_Quantity int,
    p_Item_Price Decimal(10,2)
)
language plpgsql
as $$
begin
    update Order_Item set 
        ID_Purchase_Order = p_ID_Purchase_Order,
        ID_Instrument = p_ID_Instrument,
        Quantity = p_Quantity,
        Item_Price = p_Item_Price
    where ID_Order_Item = p_ID_Order_Item;
end;
$$;

create or replace procedure Order_Item_Delete (p_ID_Order_Item int)
language plpgsql
as $$
begin
    delete from Order_Item where ID_Order_Item = p_ID_Order_Item;
end;
$$;

create or replace procedure Purchase_Receipt_Insert (
    p_Receipt_Number Varchar(25),
    p_ID_Purchase_Order int,
    p_Payment_Type Varchar(20),
    p_Amount_Paid Decimal(12,2),
    p_Change_Amount Decimal(10,2),
    p_Employee_Login Varchar(36)
)
language plpgsql
as $$
begin
    insert into Purchase_Receipt (Receipt_Number, ID_Purchase_Order, Payment_Type, Amount_Paid, Change_Amount, Employee_Login)
    values (p_Receipt_Number, p_ID_Purchase_Order, p_Payment_Type, p_Amount_Paid, p_Change_Amount, p_Employee_Login);
end;
$$;

create or replace procedure Purchase_Receipt_Update (
    p_ID_Purchase_Receipt int,
    p_Receipt_Number Varchar(25),
    p_ID_Purchase_Order int,
    p_Payment_Type Varchar(20),
    p_Amount_Paid Decimal(12,2),
    p_Change_Amount Decimal(10,2),
    p_Employee_Login Varchar(36)
)
language plpgsql
as $$
begin
    update Purchase_Receipt set 
        Receipt_Number = p_Receipt_Number,
        ID_Purchase_Order = p_ID_Purchase_Order,
        Payment_Type = p_Payment_Type,
        Amount_Paid = p_Amount_Paid,
        Change_Amount = p_Change_Amount,
        Employee_Login = p_Employee_Login
    where ID_Purchase_Receipt = p_ID_Purchase_Receipt;
end;
$$;

create or replace procedure Purchase_Receipt_Delete (p_ID_Purchase_Receipt int)
language plpgsql
as $$
begin
    delete from Purchase_Receipt where ID_Purchase_Receipt = p_ID_Purchase_Receipt;
end;
$$;

grant execute on procedure instrument_insert to rl_manager;
grant execute on procedure instrument_update to rl_manager;
grant execute on procedure supplier_insert to rl_manager;
grant execute on procedure supplier_update to rl_manager;
grant execute on procedure supply_estimate_insert to rl_manager;
grant execute on procedure supply_estimate_update to rl_manager;
grant execute on procedure estimate_item_insert to rl_manager;
grant execute on procedure estimate_item_update to rl_manager;
grant execute on procedure estimate_item_delete to rl_manager;
grant execute on procedure user_profile_update to rl_manager;

grant execute on procedure instrument_update to rl_sales;
grant execute on procedure purchase_order_insert to rl_sales;
grant execute on procedure purchase_order_update to rl_sales;
grant execute on procedure order_item_insert to rl_sales;
grant execute on procedure order_item_update to rl_sales;
grant execute on procedure order_item_delete to rl_sales;
grant execute on procedure user_profile_update to rl_sales;

grant execute on procedure supply_receipt_insert to rl_accountant;
grant execute on procedure supply_receipt_update to rl_accountant;
grant execute on procedure purchase_receipt_insert to rl_accountant;
grant execute on procedure purchase_receipt_update to rl_accountant;

grant execute on procedure instrument_type_insert to rl_admin;
grant execute on procedure instrument_type_update to rl_admin;
grant execute on procedure instrument_type_delete to rl_admin;
grant execute on procedure country_insert to rl_admin;
grant execute on procedure country_update to rl_admin;
grant execute on procedure country_delete to rl_admin;
grant execute on procedure material_insert to rl_admin;
grant execute on procedure material_update to rl_admin;
grant execute on procedure material_delete to rl_admin;
grant execute on procedure post_insert to rl_admin;
grant execute on procedure post_update to rl_admin;
grant execute on procedure post_delete to rl_admin;
grant execute on procedure status_insert to rl_admin;
grant execute on procedure status_update to rl_admin;
grant execute on procedure status_delete to rl_admin;
grant execute on procedure user_profile_insert to rl_admin;
grant execute on procedure user_profile_delete to rl_admin;
grant execute on procedure employee_insert to rl_admin;
grant execute on procedure employee_update to rl_admin;
grant execute on procedure employee_delete to rl_admin;
grant execute on procedure customer_insert to rl_admin;
grant execute on procedure customer_update to rl_admin;
grant execute on procedure customer_delete to rl_admin;
grant execute on procedure supplier_delete to rl_admin;
grant execute on procedure instrument_delete to rl_admin;
grant execute on procedure supply_estimate_delete to rl_admin;
grant execute on procedure supply_receipt_delete to rl_admin;
grant execute on procedure purchase_order_delete to rl_admin;
grant execute on procedure purchase_receipt_delete to rl_admin;