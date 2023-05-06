INSERT INTO public."User_Table"(
    "User_ID", "First_Name", "Last_Name", "Email", "PassWord", "Registration_Date")
    VALUES (10001, 'John', 'Doe', 'johndoe@example.com', 'password1', '2023-05-04'),
  (10002, 'Jane', 'Doe', 'janedoe@example.com', 'password2', '2023-05-04'),
  (10003, 'Bob', 'Smith', 'bobsmith@example.com', 'password3', '2023-05-04'),
  (10004, 'Alice', 'Jones', 'alicejones@example.com', 'password4', '2023-05-04'),
  (10005, 'Tom', 'Wilson', 'tomwilson@example.com', 'password5', '2023-05-04'),
  (10006, 'Samantha', 'Lee', 'samanthalee@example.com', 'password6', '2023-05-04'),
  (10007, 'David', 'Brown', 'davidbrown@example.com', 'password7', '2023-05-04'),
  (10008, 'Emily', 'Davis', 'emilydavis@example.com', 'password8', '2023-05-04'),
  (10009, 'Michael', 'Johnson', 'michaeljohnson@example.com', 'password9', '2023-05-04'),
  (10010, 'Olivia', 'Miller', 'oliviamiller@example.com', 'password10', '2023-05-04'),
  (10011, 'William', 'Garcia', 'williamgarcia@example.com', 'password11', '2023-05-04'),
  (10012, 'Sophia', 'Martinez', 'sophiamartinez@example.com', 'password12', '2023-05-04'),
  (10013, 'James', 'Lopez', 'jameslopez@example.com', 'password13', '2023-05-04'),
  (10014, 'Isabella', 'Gonzalez', 'isabellagonzalez@example.com', 'password14', '2023-05-04'),
  (10015, 'Benjamin', 'Taylor', 'benjamintaylor@example.com', 'password15', '2023-05-04'),
  (10016, 'Mia', 'Anderson', 'miaanderson@example.com', 'password16', '2023-05-04'),
  (10017, 'Jacob', 'Thomas', 'jacobthomas@example.com', 'password17', '2023-05-04'),
  (10018, 'Charlotte', 'Jackson', 'charlottejackson@example.com', 'password18', '2023-05-04'),
  (10019, 'Ethan', 'White', 'ethanwhite@example.com', 'password19', '2023-05-04'),
  (10020, 'Ava', 'Harris', 'avaharris@example.com', 'password20', '2023-05-04');


INSERT INTO public."Character_Table"(
    "Character_ID", "Character_Type", "Character_Ability")
    VALUES (1101, 'Warrior', 'Strength'),
(1102, 'Wizard', 'Magic'),
(1103, 'Rogue', 'Stealth'),
(1104, 'Paladin', 'Divine'),
(1105, 'Barbarian', 'Rage'),
(1106, 'Cleric', 'Healing'),
(1107, 'Druid', 'Nature'),
(1108, 'Monk', 'Martial Arts'),
(1109, 'Sorcerer', 'Sorcery'),
(1110, 'Bard', 'Music');




INSERT INTO public."Guilder_Table"(
    "Guild_ID", "Guild_Name", "Guild_Leader")
    VALUES (100, 'Knights of the Round Table',10001),
(200, 'Dark Brotherhood', 10002),
(300, 'The Companions', 10003),
(400, 'The Thieves Guild', 10004),
(500, 'The Mages Guild', 10005),
(600, 'The Blades', 10006),
(700, 'The Dark Brotherhood', 10007),
(800, 'The Dawnguard', 10008),
(900, 'The College of Winterhold', 10009),
(1000, 'The Silver Hand', 10010),
(1100, 'The Fighters Guild', 10011);


INSERT INTO public."Player_Table"(
    "Player_ID", "User_ID", "Character_ID", "Player_Username", "Player_XP", "Player_LVL", "Player_HP", "Player_Gold", "Guild_ID")
    VALUES (1, 10001, 1101, 'player1', 100, 1, 100, 1000, 100),
  (2, 10002, 1102, 'player2', 200, 2, 100, 2000, 200),
  (3, 10003, 1103, 'player3', 300, 3, 100, 3000, 300),
  (4, 10004, 1104, 'player4', 400, 4, 100, 4000, 400),
  (5, 10005, 1105, 'player5', 500, 5, 100, 5000, 500),
  (6, 10006, 1106, 'player6', 600, 6, 100, 6000, 600),
  (7, 10007, 1107, 'player7', 700, 7, 100, 7000, 700),
  (8, 10008, 1108, 'player8', 800, 8, 100, 8000, 800),
  (9, 10009, 1109, 'player9', 900, 9, 100, 9000, 900),
  (10, 10010, 1110, 'player10', 1000, 10, 140, 10000, 1000),
  (11, 10011, 1110, 'player11', 1100, 11, 150, 11000, 1100),
  (12, 10012, 1102, 'player12', 1200, 12, 160, 12000, 1100),
  (13, 10013, 1103, 'player13', 1300, 13, 170, 13000, 200),
  (14, 10014, 1104, 'player14', 1400, 14, 180, 14000, 300),
  (15, 10015, 1105, 'player15', 1500, 15, 190, 15000, 400),
  (16, 10016, 1106, 'player16', 1600, 16, 200, 16000, 500),
  (17, 10017, 1107, 'player17', 1700, 17, 210, 17000, 600),
  (18, 10018, 1108, 'player18', 1800, 18, 220, 18000, NULL),
  (19, 10019, 1109, 'player19', 1900, 19, 230, 19000, NULL),
  (20, 10020, 1110, 'player20', 2000, 20, 240, 20000, NULL);






INSERT INTO public."Item_Table"(
    "Item_ID", "Item_Name", "Item_Type", "Item_description", "Price_Gold")
    VALUES (111, 'Iron Sword', 'Weapon', 'A basic sword made of iron', 20),
(222, 'Leather Armor', 'Armor', 'A set of armor made of leather', 50),
(333, 'Potion of Healing', 'Consumable', 'Restores health when consumed', 10),
(444, 'Steel Mace', 'Weapon', 'A heavy mace made of steel', 40),
(555, 'Chainmail Armor', 'Armor', 'A set of armor made of chainmail', 75),
(666, 'Potion of Invisibility', 'Consumable', 'Makes the user invisible for a short time', 25),
(777, 'Silver Dagger', 'Weapon', 'A sharp dagger made of silver', 35),
(888, 'Plate Armor', 'Armor', 'A set of armor made of heavy plate metal', 100),
(999, 'Potion of Strength', 'Consumable', 'Increases the user', 15),
(1010, 'Golden Ring', 'Accessory', 'A ring', 200);


INSERT INTO public."PlayerItem_Table"(
    "Item_ID", "Player_ID", "Item_Quantity")
    VALUES (111, 1 ,1),
(111, 2 , 2),
(222, 2 , 3),
(222, 3 , 4),
(333, 4 , 5),
(444, 5 , 1),
(555, 6 , 1),
(666, 7 , 1),
(777, 8 , 1),
(888, 9 , 2),
(999, 10 , 1),
(1010, 11 , 1);
