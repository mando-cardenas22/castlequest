CREATE TABLE IF NOT EXISTS public."User_Table"
(
    "User_ID" integer NOT NULL,
    "First_Name" text NOT NULL,
    "Last_Name" text NOT NULL,
    "Email" text NOT NULL,
    "PassWord" text NOT NULL,
    "Registration_Date" text NOT NULL,
    CONSTRAINT "User_Table_pkey" PRIMARY KEY ("User_ID")


);




CREATE TABLE IF NOT EXISTS public."Character_Table"
(
    "Character_ID" integer NOT NULL,
    "Character_Type" text NOT NULL,
    "Character_Ability" text NOT NULL,
    CONSTRAINT "Character_Table_pkey" PRIMARY KEY ("Character_ID")
);




CREATE TABLE IF NOT EXISTS public."Guilder_Table"
(
    "Guild_ID" integer NOT NULL,
    "Guild_Name" text NOT NULL,
    "Guild_Leader" integer NOT NULL,
    CONSTRAINT "Guilder_Table_pkey" PRIMARY KEY ("Guild_ID"),
    CONSTRAINT "User_Table" FOREIGN KEY ("Guild_Leader")
        REFERENCES public."User_Table" ("User_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION


);


CREATE TABLE IF NOT EXISTS public."Player_Table"
(
    "Player_ID" integer NOT NULL,
    "User_ID" integer NOT NULL,
    "Character_ID" integer NOT NULL,
    "Player_Username" text NOT NULL,
    "Player_XP" integer,
    "Player_LVL" integer NOT NULL,
    "Player_HP" integer,
    "Player_Gold" integer,
    "Guild_ID" integer,
    CONSTRAINT "Player_Table_pkey" PRIMARY KEY ("Player_ID"),
    CONSTRAINT "Character_Table" FOREIGN KEY ("Character_ID")
        REFERENCES public."Character_Table" ("Character_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Guilder_Table" FOREIGN KEY ("Guild_ID")
        REFERENCES public."Guilder_Table" ("Guild_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "User_Table" FOREIGN KEY ("User_ID")
        REFERENCES public."User_Table" ("User_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);








CREATE TABLE IF NOT EXISTS public."Item_Table"
(
    "Item_ID" integer NOT NULL,
    "Item_Name" text NOT NULL,
    "Item_Type" text NOT NULL,
    "Item_description" text NOT NULL,
    "Price_Gold" integer NOT NULL,
    CONSTRAINT "Item_Table_pkey" PRIMARY KEY ("Item_ID")
);


CREATE TABLE IF NOT EXISTS public."PlayerItem_Table"
(
    "Item_ID" integer NOT NULL,
    "Player_ID" integer NOT NULL,
    "Item_Quantity" integer NOT NULL,
    CONSTRAINT "PlayerItem_Table_pkey" PRIMARY KEY ("Item_ID", "Player_ID")
);


 


CREATE MATERIALIZED VIEW top_players AS
SELECT p."Player_Username", p."Player_LVL", p."Player_XP", g."Guild_Name"
FROM public."Player_Table" p
LEFT JOIN public."Guilder_Table" g ON p."Guild_ID" = g."Guild_ID"
ORDER BY p."Player_XP" DESC
LIMIT 10;


CREATE MATERIALIZED VIEW top_player_guild_xp AS
SELECT p."Player_Username", g."Guild_Name", p."Player_XP"
FROM public."Player_Table" p
LEFT JOIN public."Guilder_Table" g ON p."Guild_ID" = g."Guild_ID"
WHERE p."Player_XP" = (
    SELECT MAX("Player_XP")
    FROM public."Player_Table" p2
    WHERE p2."Guild_ID" = p."Guild_ID"
    OR (p2."Guild_ID" IS NULL AND p."Guild_ID" IS NULL)
)
ORDER BY g."Guild_Name";


DROP ROLE IF EXISTS castlequest_game ;


CREATE ROLE castlequest_game WITH
    LOGIN
    NOSUPERUSER
    CREATEDB
    CREATEROLE
    INHERIT
    NOREPLICATION
    CONNECTION LIMIT -1;


DROP ROLE IF EXISTS user_login;


CREATE ROLE user_login WITH
    LOGIN
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    INHERIT
    NOREPLICATION
    CONNECTION LIMIT -1;


DROP ROLE IF EXISTS castlequest;


CREATE ROLE castlequest WITH
    LOGIN
    NOSUPERUSER
    INHERIT
    NOCREATEDB
    NOCREATEROLE
    NOREPLICATION
    PASSWORD 'Teddybear1234';
