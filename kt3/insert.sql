
insert into Instrument_Type (Name_Instrument_Type) values
('Струнный'),
('Духовой'),
('Клавишный'),
('Ударный');

call Country_Insert('Вьетнам');
call Country_Insert('Россия');
call Country_Insert('Турция');

insert into Material (Name_Material) values
('Дерево, металлические струны'),
('Дерево, металлические струны, кожаная подкладка'),
('Медь'),
('Пластмасса, метал'),
('Дерево'),
('Дерево, пластмасса, метал');

call Post_Insert('Менеджер по закупкам');
call Post_Insert('Менеджер по продажам');
call Post_Insert('Бухгалтер');
call Post_Insert('Администратор');


insert into Status (Name_Status) values
('В рассмотрении'),
('Оформлен'),
('Закрыт'),
('Забронирован');

insert into User_Profile (UP_Login, UP_Password, U_Surname, U_Name, U_Patronymic) values
('wk_IvanovII', 'Pa$$w0rd', 'Иванов', 'Иван', 'Иванович'),
('wk_PetrovPP', 'Pa$$w0rd', 'Петров', 'Пётр', 'Петрович'),
('wk_ArkadievAA', 'Pa$$w0rd', 'Аркадиев', 'Аркадий', 'Аркадьевич');


call User_Profile_Insert('wk_OlegovOO', 'Pa$$w0rd', 'Олегов', 'Олег', 'Олегович');
call User_Profile_Insert('dp_PetrovaIV', 'Pa$$w0rd', 'Петрова', 'Инга', 'Витальевна');
call User_Profile_Insert('dp_KonstantinovVP', 'Pa$$w0rd', 'Константинов', 'Владимир', 'Павлович');
call User_Profile_Insert('SergeevaAK', 'Pa$$w0rd', 'Сергеева', 'Анна', 'Кирилловна');
call User_Profile_Insert('PetrovAN', 'Pa$$w0rd', 'Петров', 'Александр', 'Николаевич');
call User_Profile_Insert('RomanovNA', 'Pa$$w0rd', 'Романов', 'Николай', 'Андреевич');
call User_Profile_Insert('FedorovaSA', 'Pa$$w0rd', 'Федорова', 'София', 'Алексеевна');


insert into Employee (Employee_Login, Personal_File_N) values
('wk_IvanovII', 'ЛД-0000000001'),
('wk_PetrovPP', 'ЛД-0000000002'),
('wk_ArkadievAA', 'ЛД-0000000003');

call Employee_Insert('wk_OlegovOO', 'ЛД-0000000004');

insert into Customer (Customer_Login, Passport_Data, Address, Phone, Bank_Card) values
('SergeevaAK', '45 24 695296', 'г. Москва, ул. Курская, д. 10, к. 5', '+7(972)728-54-15', '0677 3244 3436 2245 06/25'),
('PetrovAN', '45 23 832683', 'г. Москва, ул. Новогиреево, д. 51, стр. 9', '+7(986)791-14-93', '0034 2772 7343 8123 09/24');

call Customer_Insert('RomanovNA', '41 77 832237', 'г. Москва, ул. Окская, д. 21, к. 8', '+7(942)831-33-83', '8329 1135 7733 1445 05/25');
call Customer_Insert('FedorovaSA', '47 52 835257', 'г. Москва, ул. Измайлово, д. 6, стр. 4', '+7(972)228-99-11', '9887 6539 1745 1234 06/24');

insert into Supplier (Full_Name_Supplier, Legal_Address, Phone, BIK, OKPO, Responsible_Login) values
('ООО «Музыка в душу»', 'г. Москва, ул. Крылатской, д. 19, к. 5', '+7(499)226-82-15', '021236236', '5732343565', 'dp_PetrovaIV');

call Supplier_Insert('НПАО «Доставка инструментов»', 'г. Москва, ул. Минская, д. 82, стр. 9', '+7(495)714-78-11', '922865543', '6568743462', 'dp_KonstantinovVP');

insert into Instrument (Article, ID_Instrument_Type, ID_Country, Brand_Model, Frequency_Range, ID_Material, Quantity, Price) values
('МТ№0000000001', 1, 1, 'Акустическая гитара Abonas AR-10', 'от 10 Hz до 120 Hz', 1, 20, 11500.00),
('МТ№0000000002', 1, 2, 'Скрипка Clean Sound VL-5', 'от 30 Hz до 110 Hz', 2, 27, 14000.00),
('МТ№0000000003', 2, 2, 'Труба МузыкаПрод ТР200+', 'от 30 Hz до 210 Hz', 3, 15, 12500.00);

call Instrument_Insert('МТ№0000000004', 3, 3, 'Синтезатор Royal Paly FRG++', 'от 10 Hz до 250 Hz', 4, 3, 25000.00);
call Instrument_Insert('МТ№0000000005', 2, 2, 'Флейта МузыкаПрод ФЛ100', 'от 10 Hz до 100 Hz', 5, 20, 9500.00);
call Instrument_Insert('МТ№0000000006', 4, 2, 'Барабанная установка DrumSound DBS-120', 'от 50 Hz до 350 Hz', 6, 2, 23500.00);

insert into Supply_Estimate (Estimate_Number, ID_Supplier, ID_Status, Total_Amount, Create_DateTime) values
('СМ№000000001', 1, 3, 145000.00, '2023-08-20 10:00:00'),
('СМ№000000003', 2, 3, 117500.00, '2023-08-20 14:30:00');

call Supply_Estimate_Insert('СМ№000000002', 2, 1, 195000.00);

insert into Estimate_Item (ID_Supply_Estimate, ID_Instrument, Quantity, Item_Price) values
(1, 1, 5, 11500.00),
(1, 3, 7, 12500.00),
(3, 6, 5, 23500.00);

call Estimate_Item_Insert(2, 4, 4, 25000.00);
call Estimate_Item_Insert(2, 5, 10, 9500.00);

insert into Supply_Receipt (Receipt_Number, ID_Supply_Estimate, Amount_Paid, Employee_Login, Payment_DateTime) values
('КЧ/23/00000000001', 1, 145000.00, 'wk_IvanovII', '2023-08-29 15:10:43');

call Supply_Receipt_Insert('КЧ/23/00000000002', 3, 117500.00, 'wk_PetrovPP');
insert into Purchase_Order (Order_Number, Customer_Login, ID_Status, Total_Amount, Create_DateTime) values
('ЗККП№0000000001/23', 'SergeevaAK', 3, 39500.00, '2023-09-01 10:00:00');

call Purchase_Order_Insert('ЗККП№0000000002/23', 'PetrovAN', 3, 42000.00);

insert into Order_Item (ID_Purchase_Order, ID_Instrument, Quantity, Item_Price) values
(1, 1, 1, 11500.00),
(1, 2, 2, 14000.00);

call Order_Item_Insert(2, 2, 3, 14000.00);

insert into Purchase_Receipt (Receipt_Number, ID_Purchase_Order, Payment_Type, Amount_Paid, Change_Amount, Employee_Login, Payment_DateTime) values
('КЧ-23-0000000001', 1, 'Наличный', 47500.00, 100.00, 'wk_PetrovPP', '2023-09-01 11:48:26');