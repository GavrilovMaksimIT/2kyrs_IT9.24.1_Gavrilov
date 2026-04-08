
select 
    Name_Instrument_Type as "Вид инструмента"
from Instrument_Type
order by Name_Instrument_Type ASC;

select 
    Name_Country as "Страна производитель"
from Country
order by Name_Country ASC;

select 
    Name_Material as "Материал изделия"
from Material
order by Name_Material ASC;

select 
    Name_Post as "Название должности"
from Post
order by Name_Post ASC;

select 
    Name_Status as "Статус"
from Status
order by Name_Status ASC;

select 
    'Логин: '||UP_Login||' Пароль: '||UP_Password as "Данные для входа",
    U_Surname||' '||U_Name||' '||COALESCE(U_Patronymic, '-') as "ФИО",
    'Сотрудник' as "Роль"
from User_Profile
inner join Employee on UP_Login = Employee_Login
union
select 
    'Логин: '||UP_Login||' Пароль: '||UP_Password as "Данные для входа",
    U_Surname||' '||U_Name||' '||COALESCE(U_Patronymic, '-') as "ФИО",
    'Покупатель' as "Роль"
from User_Profile
inner join Customer on UP_Login = Customer_Login
union
select 
    'Логин: '||UP_Login||' Пароль: '||UP_Password as "Данные для входа",
    U_Surname||' '||U_Name||' '||COALESCE(U_Patronymic, '-') as "ФИО",
    'Ответственный поставщика' as "Роль"
from User_Profile
inner join Supplier on UP_Login = Responsible_Login
order by "Роль" ASC, "ФИО" ASC;

select 
    U_Surname||' '||U_Name||' '||COALESCE(U_Patronymic, '-') as "ФИО сотрудника",
    Personal_File_N as "№ личного дела"
from Employee
inner join User_Profile on UP_Login = Employee_Login
order by Personal_File_N ASC;

select 
    U_Surname||' '||U_Name||' '||COALESCE(U_Patronymic, '-') as "ФИО покупателя",
    Passport_Data as "Паспорт",
    Address as "Адрес",
    Phone as "Телефон",
    Bank_Card as "Банковская карта"
from Customer
inner join User_Profile on UP_Login = Customer_Login
order by U_Surname ASC;

select 
    Full_Name_Supplier as "Поставщик",
    Legal_Address as "Юридический адрес",
    Phone as "Телефон",
    BIK as "БИК",
    OKPO as "ОКПО",
    U_Surname||' '||U_Name||' '||COALESCE(U_Patronymic, '-') as "Ответственный"
from Supplier
inner join User_Profile on UP_Login = Responsible_Login
order by Full_Name_Supplier ASC;

select 
    Article as "Артикул",
    Name_Instrument_Type as "Вид",
    Name_Country as "Страна",
    Brand_Model as "Марка и модель",
    Frequency_Range as "Диапазон частот",
    Name_Material as "Материал",
    Quantity as "Количество",
    Price as "Цена"
from Instrument
inner join Instrument_Type on ID_Instrument_Type = ID_Instrument_Type
inner join Country on ID_Country = ID_Country
inner join Material on ID_Material = ID_Material
order by Name_Instrument_Type ASC, Brand_Model ASC;

select 
    Estimate_Number as "№ сметы",
    Full_Name_Supplier as "Поставщик",
    Name_Status as "Статус",
    Total_Amount as "Итоговая сумма",
    Create_DateTime as "Дата создания"
from Supply_Estimate
inner join Supplier on ID_Supplier = ID_Supplier
inner join Status on ID_Status = ID_Status
order by Create_DateTime DESC;

select 
    Estimate_Number as "№ сметы",
    Article as "Артикул",
    Brand_Model as "Инструмент",
    Estimate_Item.Quantity as "Количество",
    Estimate_Item.Item_Price as "Цена за ед.",
    (Estimate_Item.Quantity * Estimate_Item.Item_Price) as "Сумма"
from Estimate_Item
inner join Supply_Estimate on ID_Supply_Estimate = ID_Supply_Estimate
inner join Instrument on ID_Instrument = ID_Instrument
order by Estimate_Number ASC;

select 
    Receipt_Number as "№ чека",
    Estimate_Number as "№ сметы",
    Payment_DateTime as "Дата оплаты",
    Amount_Paid as "Сумма",
    U_Surname||' '||LEFT(U_Name, 1)||'.'||COALESCE(LEFT(U_Patronymic, 1)||'.', '') as "Принял"
from Supply_Receipt
inner join Supply_Estimate on ID_Supply_Estimate = ID_Supply_Estimate
inner join Employee on Employee_Login = Employee_Login
inner join User_Profile on UP_Login = Employee_Login
order by Payment_DateTime DESC;

select 
    Order_Number as "№ заказа",
    U_Surname||' '||U_Name as "Покупатель",
    Name_Status as "Статус",
    Total_Amount as "Сумма",
    Create_DateTime as "Дата создания"
from Purchase_Order
inner join Customer on Customer_Login = Customer_Login
inner join User_Profile on UP_Login = Customer_Login
inner join Status on ID_Status = ID_Status
order by Create_DateTime DESC;

select 
    Order_Number as "№ заказа",
    Article as "Артикул",
    Brand_Model as "Инструмент",
    Order_Item.Quantity as "Количество",
    Order_Item.Item_Price as "Цена",
    (Order_Item.Quantity * Order_Item.Item_Price) as "Сумма"
from Order_Item
inner join Purchase_Order on ID_Purchase_Order = ID_Purchase_Order
inner join Instrument on ID_Instrument = ID_Instrument
order by Order_Number ASC;

select 
    Receipt_Number as "№ чека",
    Order_Number as "№ заказа",
    Payment_DateTime as "Дата оплаты",
    Payment_Type as "Вид платежа",
    Amount_Paid as "Внесено",
    COALESCE(Change_Amount, 0) as "Сдача",
    U_Surname||' '||LEFT(U_Name, 1)||'.' as "Принял"
from Purchase_Receipt
inner join Purchase_Order on ID_Purchase_Order = ID_Purchase_Order
inner join Employee on Employee_Login = Employee_Login
inner join User_Profile on UP_Login = Employee_Login
order by Payment_DateTime DESC;

call instrument_update(1, 'МТ№0000000001', 1, 1, 'Акустическая гитара Abonas AR-10', 'от 10 Hz до 120 Hz', 1, 25, 11500.00);
call instrument_update(1, 'МТ№0000000001', 1, 1, 'Акустическая гитара Abonas AR-10', 'от 10 Hz до 120 Hz', 1, 20, 11500.00);

call supply_estimate_insert('СМ№000000004', 1, 1, 50000.00);


call purchase_order_update(1, 'ЗККП№0000000001/23', 'SergeevaAK', 1, 39500.00);

call purchase_order_update(1, 'ЗККП№0000000001/23', 'SergeevaAK', 3, 39500.00);

call supply_receipt_insert('КЧ/23/00000000003', 2, 195000.00, 'wk_IvanovII');


call purchase_receipt_insert('КЧ-23-0000000002', 2, 'Безналичный', 42000.00, null, 'wk_PetrovPP');

call status_delete(4);
call status_insert('Забронирован');