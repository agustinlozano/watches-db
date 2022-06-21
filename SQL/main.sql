BEGIN TRANSACTION;

-- ---
-- Tables
-- 
-- ---
CREATE TABLE IF NOT EXISTS "Pusher" (
	"id_pusher"	INTEGER NOT NULL,
	"pusher_type"	TEXT NOT NULL,
	PRIMARY KEY("id_pusher")
);

CREATE TABLE IF NOT EXISTS "Crystal" (
	"id_crystal"	INTEGER NOT NULL,
	"crystal_type"	TEXT NOT NULL,
	PRIMARY KEY("id_crystal")
);

CREATE TABLE IF NOT EXISTS "Shape" (
	"id_shape"	INTEGER NOT NULL,
	"shape_type"	TEXT NOT NULL,
	PRIMARY KEY("id_shape")
);

CREATE TABLE IF NOT EXISTS "Material" (
	"id_material"	INTEGER NOT NULL,
	"material_type"	TEXT NOT NULL,
	PRIMARY KEY("id_material")
);

CREATE TABLE IF NOT EXISTS "Color" (
	"id_color"	INTEGER NOT NULL,
	"color_name"	TEXT NOT NULL,
	PRIMARY KEY("id_color")
);

CREATE TABLE IF NOT EXISTS "Band_type" (
	"id_band_type"	INTEGER NOT NULL,
	"band_name"	TEXT NOT NULL,
	PRIMARY KEY("id_band_type")
);

CREATE TABLE IF NOT EXISTS "Clasp" (
	"id_clasp"	INTEGER NOT NULL,
	"clasp_type"	TEXT NOT NULL,
	PRIMARY KEY("id_clasp")
);

CREATE TABLE IF NOT EXISTS "Dial_type" (
	"id_dial_type"	INTEGER NOT NULL,
	"dial_name"	TEXT NOT NULL,
	PRIMARY KEY("id_dial_type")
);

CREATE TABLE IF NOT EXISTS "Index" (
	"id_index"	INTEGER NOT NULL,
	"index_type"	TEXT NOT NULL,
	PRIMARY KEY("id_index")
);

CREATE TABLE IF NOT EXISTS "Hand" (
	"id_hand"	INTEGER NOT NULL,
	"hand_type"	TEXT NOT NULL,
	PRIMARY KEY("id_hand")
);

CREATE TABLE IF NOT EXISTS "Owner" (
	"id_owner"	INTEGER NOT NULL,
	"owner_name"	TEXT NOT NULL,
	PRIMARY KEY("id_owner" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Movement_type" (
	"id_movement_type"	INTEGER NOT NULL,
	"movement_name"	TEXT NOT NULL,
	PRIMARY KEY("id_movement_type" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Battery" (
	"id_battery"	INTEGER NOT NULL,
	"battery_type"	TEXT NOT NULL,
	PRIMARY KEY("id_battery" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Manufactured_in" (
	"id_country"	INTEGER NOT NULL,
	"country_name"	TEXT NOT NULL,
	PRIMARY KEY("id_country" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Style" (
	"id_style"	INTEGER NOT NULL,
	"style_name"	TEXT NOT NULL,
	PRIMARY KEY("id_style" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Gender" (
	"id_gender"	INTEGER NOT NULL,
	"gender_type"	TEXT NOT NULL,
	PRIMARY KEY("id_gender" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Backcase_design" (
	"id_backcase_design"	INTEGER NOT NULL,
	"backcase_design_type"	TEXT NOT NULL,
	PRIMARY KEY("id_backcase_design" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Caseback" (
	"id_caseback"	INTEGER NOT NULL,
	"id_shape"	INTEGER NOT NULL,
	"id_caseback_design"	INTEGER NOT NULL,
	"id_material"	INTEGER NOT NULL,
	FOREIGN KEY("id_shape") REFERENCES "Shape"("id_shape"),
	FOREIGN KEY("id_material") REFERENCES "Material"("id_material"),
	FOREIGN KEY("id_caseback_design") REFERENCES "Backcase_design"("id_backcase_design"),
	PRIMARY KEY("id_caseback" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Band" (
	"id_band"	INTEGER NOT NULL,
	"id_band_type"	INTEGER NOT NULL,
	"id_clasp"	INTEGER NOT NULL,
	"id_material"	INTEGER NOT NULL,
	"id_color"	INTEGER NOT NULL,
	FOREIGN KEY("id_clasp") REFERENCES "Clasp"("id_clasp"),
	FOREIGN KEY("id_material") REFERENCES "Material"("id_material"),
	FOREIGN KEY("id_band_type") REFERENCES "Band_type"("id_band_type"),
	FOREIGN KEY("id_color") REFERENCES "Color"("id_color"),
	PRIMARY KEY("id_band" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Brand" (
	"id_brand"	INTEGER NOT NULL,
	"brand_name"	TEXT NOT NULL,
	PRIMARY KEY("id_brand" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Complication" (
	"id_complication"	INTEGER NOT NULL,
	"id_complication_name"	TEXT NOT NULL,
	PRIMARY KEY("id_complication" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Crown_type" (
	"id_crown_type"	INTEGER NOT NULL,
	"crown_name"	TEXT NOT NULL,
	PRIMARY KEY("id_crown_type" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Crown_function" (
	"id_crown_function"	INTEGER NOT NULL,
	"function_name"	TEXT NOT NULL,
	PRIMARY KEY("id_crown_function" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "may_have_a_complication" (
	"id_watch"	INTEGER NOT NULL,
	"id_complication"	INTEGER NOT NULL,
	FOREIGN KEY("id_watch") REFERENCES "Basic_info"("id_info"),
	FOREIGN KEY("id_complication") REFERENCES "Complication"("id_complication"),
	PRIMARY KEY("id_watch","id_complication")
);

CREATE TABLE IF NOT EXISTS "may_have_a_crown" (
	"id_watch"	INTEGER NOT NULL,
	"id_crown"	INTEGER NOT NULL,
	FOREIGN KEY("id_watch") REFERENCES "Case"("id_case"),
	FOREIGN KEY("id_crown") REFERENCES "Crown"("id_crown"),
	PRIMARY KEY("id_watch","id_crown")
);

CREATE TABLE IF NOT EXISTS "has_a_crown_func" (
	"id_crown"	INTEGER NOT NULL,
	"id_function"	INTEGER NOT NULL,
	FOREIGN KEY("id_crown") REFERENCES "Crown"("id_crown"),
	FOREIGN KEY("id_function") REFERENCES "Crown_function"("id_crown_function"),
	PRIMARY KEY("id_function","id_crown")
);

CREATE TABLE IF NOT EXISTS "Crown" (
	"id_crown"	INTEGER NOT NULL,
	"id_crown_type"	INTEGER NOT NULL,
	FOREIGN KEY("id_crown_type") REFERENCES "Crown_type"("id_crown_type"),
	PRIMARY KEY("id_crown" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Basic_info" (
	"id_info"	INTEGER NOT NULL,
	"id_manufactured_in"	INTEGER NOT NULL,
	"id_brand"	INTEGER NOT NULL,
	"id_style"	INTEGER NOT NULL,
	"id_gender"	INTEGER NOT NULL,
	"water_resistance"	INTEGER NOT NULL,
	"weight"	INTEGER,
	FOREIGN KEY("id_style") REFERENCES "Style"("id_style"),
	FOREIGN KEY("id_gender") REFERENCES "Gender"("id_gender"),
	FOREIGN KEY("id_brand") REFERENCES "Brand"("id_brand"),
	FOREIGN KEY("id_manufactured_in") REFERENCES "Manufactured_in"("id_country"),
	PRIMARY KEY("id_info" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Case" (
	"id_case"	INTEGER NOT NULL,
	"id_crystal"	INTEGER NOT NULL,
	"id_material"	INTEGER NOT NULL,
	"id_color"	INTEGER NOT NULL,
	"id_pusher"	INTEGER NOT NULL,
	"id_shape"	INTEGER NOT NULL,
	"thickness"	REAL,
	"lug_width"	REAL,
	"lug_to_lug"	REAL,
	"id_movement"	INTEGER NOT NULL,
	"id_caseback"	INTEGER NOT NULL,
	"id_dial"	INTEGER NOT NULL,
	"id_band"	INTEGER NOT NULL,
	FOREIGN KEY("id_shape") REFERENCES "Shape"("id_shape"),
	FOREIGN KEY("id_band") REFERENCES "Band"("id_band"),
	FOREIGN KEY("id_color") REFERENCES "Color"("id_color"),
	FOREIGN KEY("id_case") REFERENCES "Basic_info"("id_info"),
	FOREIGN KEY("id_pusher") REFERENCES "Pusher"("id_pusher"),
	FOREIGN KEY("id_dial") REFERENCES "Dial"("id_dial"),
	FOREIGN KEY("id_movement") REFERENCES "Movement"("id_movement"),
	FOREIGN KEY("id_material") REFERENCES "Material"("id_material"),
	FOREIGN KEY("id_crystal") REFERENCES "Crystal"("id_crystal"),
	FOREIGN KEY("id_caseback") REFERENCES "Caseback"("id_caseback"),
	PRIMARY KEY("id_case" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Movement" (
	"id_movement"	INTEGER NOT NULL,
	"id_movement_type"	INTEGER NOT NULL,
	"id_battery"	INTEGER NOT NULL,
	"battery_life"	INTEGER,
	FOREIGN KEY("id_battery") REFERENCES "Battery"("id_battery"),
	FOREIGN KEY("id_movement_type") REFERENCES "Movement_type"("id_movement_type"),
	PRIMARY KEY("id_movement" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "Dial" (
	"id_dial"	INTEGER NOT NULL,
	"id_dial_type"	INTEGER NOT NULL,
	"id_index"	INTEGER NOT NULL,
	"id_hand"	INTEGER NOT NULL,
	"id_color"	INTEGER NOT NULL,
	"luminance"	INTEGER NOT NULL,
	FOREIGN KEY("id_color") REFERENCES "Color"("id_color"),
	FOREIGN KEY("id_dial_type") REFERENCES "Dial_type"("id_dial_type"),
	FOREIGN KEY("id_index") REFERENCES "Index"("id_index"),
	FOREIGN KEY("id_hand") REFERENCES "Hand"("id_hand"),
	PRIMARY KEY("id_dial" AUTOINCREMENT)
);

-- ---
-- Data inserted into the DB
-- 
-- ---
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (0,'other');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (1,'pump/classic');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (2,'screw-down');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (3,'rectangular');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (4,'olive');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (5,'inverted');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (6,'textured');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (7,'mushroom');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (8,'generic');
INSERT INTO "Pusher" ("id_pusher","pusher_type") VALUES (9,'none');
INSERT INTO "Crystal" ("id_crystal","crystal_type") VALUES (0,'other');
INSERT INTO "Crystal" ("id_crystal","crystal_type") VALUES (1,'Sapphire');
INSERT INTO "Crystal" ("id_crystal","crystal_type") VALUES (2,'Crystal');
INSERT INTO "Crystal" ("id_crystal","crystal_type") VALUES (3,'mineral');
INSERT INTO "Crystal" ("id_crystal","crystal_type") VALUES (4,'regular');
INSERT INTO "Crystal" ("id_crystal","crystal_type") VALUES (5,'plastic');
INSERT INTO "Crystal" ("id_crystal","crystal_type") VALUES (6,'hardlex');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (0,'other');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (1,'round');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (2,'square');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (3,'rectangle');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (4,'cushion');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (5,'tank');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (6,'tonneau');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (7,'oval');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (8,'carage');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (9,'octagon');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (10,'avante garde');
INSERT INTO "Shape" ("id_shape","shape_type") VALUES (11,'hexagon');
INSERT INTO "Material" ("id_material","material_type") VALUES (0,'other');
INSERT INTO "Material" ("id_material","material_type") VALUES (1,'ceramic');
INSERT INTO "Material" ("id_material","material_type") VALUES (2,'titanium');
INSERT INTO "Material" ("id_material","material_type") VALUES (3,'Stainless steel');
INSERT INTO "Material" ("id_material","material_type") VALUES (4,'Steel');
INSERT INTO "Material" ("id_material","material_type") VALUES (5,'gold');
INSERT INTO "Material" ("id_material","material_type") VALUES (6,'carbon');
INSERT INTO "Material" ("id_material","material_type") VALUES (7,'tungsten');
INSERT INTO "Material" ("id_material","material_type") VALUES (8,'plastic');
INSERT INTO "Material" ("id_material","material_type") VALUES (9,'crystal');
INSERT INTO "Material" ("id_material","material_type") VALUES (10,'leather');
INSERT INTO "Color" ("id_color","color_name") VALUES (0,'other');
INSERT INTO "Color" ("id_color","color_name") VALUES (1,'siver');
INSERT INTO "Color" ("id_color","color_name") VALUES (2,'chrome');
INSERT INTO "Color" ("id_color","color_name") VALUES (3,'gold');
INSERT INTO "Color" ("id_color","color_name") VALUES (4,'red');
INSERT INTO "Color" ("id_color","color_name") VALUES (5,'green');
INSERT INTO "Color" ("id_color","color_name") VALUES (6,'yellow');
INSERT INTO "Color" ("id_color","color_name") VALUES (7,'black');
INSERT INTO "Color" ("id_color","color_name") VALUES (8,'white');
INSERT INTO "Color" ("id_color","color_name") VALUES (9,'gray');
INSERT INTO "Color" ("id_color","color_name") VALUES (10,'brown');
INSERT INTO "Color" ("id_color","color_name") VALUES (11,'cream');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (0,'other');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (1,'stitched leather');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (2,'normal leather');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (3,'exotic leather');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (4,'double ridged');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (5,'rally');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (6,'bund');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (7,'nato');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (8,'zulu');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (9,'perlon');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (10,'oyster');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (11,'engineer');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (12,'Jubilee');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (13,'President');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (14,'milanese');
INSERT INTO "Band_type" ("id_band_type","band_name") VALUES (15,'resin');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (0,'other');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (1,'deployant');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (2,'hidden');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (3,'pin');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (4,'sliding');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (5,'velcro');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (6,'non-closure');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (7,'button');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (8,'generic');
INSERT INTO "Clasp" ("id_clasp","clasp_type") VALUES (9,'buckle');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (0,'other');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (1,'crosshair');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (2,'enamel');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (3,'gilt');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (4,'guilloche');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (5,'linen');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (6,'meteorite');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (7,'porcelain');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (8,'tapisserie');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (9,'skeleton');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (10,'teaked');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (11,'sector');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (12,'marquetry');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (13,'lcd');
INSERT INTO "Dial_type" ("id_dial_type","dial_name") VALUES (14,'analog');
INSERT INTO "Index" ("id_index","index_type") VALUES (0,'other');
INSERT INTO "Index" ("id_index","index_type") VALUES (1,'arabic');
INSERT INTO "Index" ("id_index","index_type") VALUES (2,'arrow');
INSERT INTO "Index" ("id_index","index_type") VALUES (3,'baton');
INSERT INTO "Index" ("id_index","index_type") VALUES (4,'breguet');
INSERT INTO "Index" ("id_index","index_type") VALUES (5,'dagger');
INSERT INTO "Index" ("id_index","index_type") VALUES (6,'diamond');
INSERT INTO "Index" ("id_index","index_type") VALUES (7,'roman');
INSERT INTO "Index" ("id_index","index_type") VALUES (8,'round');
INSERT INTO "Index" ("id_index","index_type") VALUES (9,'stick');
INSERT INTO "Index" ("id_index","index_type") VALUES (10,'digital');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (0,'other');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (1,'alpha');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (2,'arrow');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (3,'baton');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (4,'breguet');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (5,'cathedral');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (6,'dauphine');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (7,'fleur de lys');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (8,'lance');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (9,'leaf');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (10,'mercedes');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (11,'plongeur');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (12,'syringe');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (13,'snowflake');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (14,'spade');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (15,'sword');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (16,'none');
INSERT INTO "Hand" ("id_hand","hand_type") VALUES (17,'high-vis');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (0,'other');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (1,'rolex');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (2,'omega');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (3,'tag heuer');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (4,'seiko');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (5,'breitling');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (6,'patek philippe');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (7,'generic');
INSERT INTO "Owner" ("id_owner","owner_name") VALUES (8,'casio');
INSERT INTO "Movement_type" ("id_movement_type","movement_name") VALUES (0,'other');
INSERT INTO "Movement_type" ("id_movement_type","movement_name") VALUES (1,'mechanical');
INSERT INTO "Movement_type" ("id_movement_type","movement_name") VALUES (2,'automatic');
INSERT INTO "Movement_type" ("id_movement_type","movement_name") VALUES (3,'quartz');
INSERT INTO "Battery" ("id_battery","battery_type") VALUES (0,'other');
INSERT INTO "Battery" ("id_battery","battery_type") VALUES (1,'alkaline');
INSERT INTO "Battery" ("id_battery","battery_type") VALUES (2,'silver-oxide');
INSERT INTO "Battery" ("id_battery","battery_type") VALUES (3,'lithium');
INSERT INTO "Battery" ("id_battery","battery_type") VALUES (4,'cobalt');
INSERT INTO "Battery" ("id_battery","battery_type") VALUES (5,'cell');
INSERT INTO "Battery" ("id_battery","battery_type") VALUES (6,'none');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (0,'other');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (1,'Switzerland');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (2,'Germany');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (3,'Japan');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (4,'Britain');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (5,'France');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (6,'China');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (7,'Russia');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (8,'United States');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (9,'Italy');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (10,'Australia');
INSERT INTO "Manufactured_in" ("id_country","country_name") VALUES (11,'Scandinavia');
INSERT INTO "Style" ("id_style","style_name") VALUES (0,'other');
INSERT INTO "Style" ("id_style","style_name") VALUES (1,'luxury');
INSERT INTO "Style" ("id_style","style_name") VALUES (2,'nurse');
INSERT INTO "Style" ("id_style","style_name") VALUES (3,'fashion');
INSERT INTO "Style" ("id_style","style_name") VALUES (4,'dress');
INSERT INTO "Style" ("id_style","style_name") VALUES (5,'dive');
INSERT INTO "Style" ("id_style","style_name") VALUES (6,'military');
INSERT INTO "Style" ("id_style","style_name") VALUES (7,'pilot');
INSERT INTO "Style" ("id_style","style_name") VALUES (8,'racing');
INSERT INTO "Style" ("id_style","style_name") VALUES (9,'wood');
INSERT INTO "Style" ("id_style","style_name") VALUES (10,'digital');
INSERT INTO "Style" ("id_style","style_name") VALUES (11,'smart');
INSERT INTO "Style" ("id_style","style_name") VALUES (12,'casual');
INSERT INTO "Gender" ("id_gender","gender_type") VALUES (0,'other');
INSERT INTO "Gender" ("id_gender","gender_type") VALUES (1,'male');
INSERT INTO "Gender" ("id_gender","gender_type") VALUES (2,'female');
INSERT INTO "Gender" ("id_gender","gender_type") VALUES (3,'transgender');
INSERT INTO "Gender" ("id_gender","gender_type") VALUES (4,'non-binary');
INSERT INTO "Gender" ("id_gender","gender_type") VALUES (5,'unisex');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (0,'other');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (1,'minimalistic');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (2,'crowded');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (3,'personalized');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (4,'colored');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (5,'3D effect');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (6,'exibition');
INSERT INTO "Backcase_design" ("id_backcase_design","backcase_design_type") VALUES (7,'generic');
INSERT INTO "Caseback" ("id_caseback","id_shape","id_caseback_design","id_material") VALUES (0,11,7,8);
INSERT INTO "Caseback" ("id_caseback","id_shape","id_caseback_design","id_material") VALUES (1,1,6,9);
INSERT INTO "Caseback" ("id_caseback","id_shape","id_caseback_design","id_material") VALUES (2,1,6,9);
INSERT INTO "Caseback" ("id_caseback","id_shape","id_caseback_design","id_material") VALUES (3,1,6,9);
INSERT INTO "Caseback" ("id_caseback","id_shape","id_caseback_design","id_material") VALUES (4,2,7,8);
INSERT INTO "Caseback" ("id_caseback","id_shape","id_caseback_design","id_material") VALUES (5,1,2,2);
INSERT INTO "Caseback" ("id_caseback","id_shape","id_caseback_design","id_material") VALUES (6,1,6,9);
INSERT INTO "Band" ("id_band","id_band_type","id_clasp","id_material","id_color") VALUES (0,15,9,8,7);
INSERT INTO "Band" ("id_band","id_band_type","id_clasp","id_material","id_color") VALUES (1,11,1,3,2);
INSERT INTO "Band" ("id_band","id_band_type","id_clasp","id_material","id_color") VALUES (2,10,7,3,2);
INSERT INTO "Band" ("id_band","id_band_type","id_clasp","id_material","id_color") VALUES (3,2,9,10,10);
INSERT INTO "Band" ("id_band","id_band_type","id_clasp","id_material","id_color") VALUES (4,15,9,8,8);
INSERT INTO "Band" ("id_band","id_band_type","id_clasp","id_material","id_color") VALUES (5,8,9,0,5);
INSERT INTO "Band" ("id_band","id_band_type","id_clasp","id_material","id_color") VALUES (6,10,2,3,2);
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (0,'other');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (1,'Timex');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (2,'Casio');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (3,'Rolex');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (4,'Tissot');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (5,'Swatch');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (6,'Seiko');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (7,'Orient');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (8,'Richard Millie');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (9,'Cartier');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (10,'Audemars Piguet');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (11,'Omega');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (12,'Hublot');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (13,'Bulgari');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (14,'Patek Philippe');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (15,'Rexhep Rexhepi');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (16,'Unimatic');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (17,'Anordain');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (18,'Laurent Ferrier');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (19,'Ressence');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (20,'Phillippe Dufour');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (21,'Waldan');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (22,'Shinola');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (23,'Haven Watch Co.');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (24,'Weiss');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (25,'Vacheron Constantin');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (26,'Piaget');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (27,'Breguet');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (28,'Jaeger-LeCoultre');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (29,'IWC');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (30,'Breitling');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (31,'Bell & Ross');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (32,'Zenith');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (33,'Ulysse Nardin');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (34,'Panerai');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (35,'Blancpain');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (36,'Doxa');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (37,'Zodiac');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (38,'Longines');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (39,'Baume & Mercier');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (40,'Hamilton');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (41,'Tag Heuer');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (42,'Tudor');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (43,'Enicar');
INSERT INTO "Brand" ("id_brand","brand_name") VALUES (44,'Lorus');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (0,'other');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (1,'date');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (2,'chronograp');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (3,'moonphase');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (4,'power reserve');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (5,'jump hour');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (6,'alarm');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (7,'minute repeater');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (8,'tourbillon');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (9,'mode');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (10,'calculator');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (11,'calendar');
INSERT INTO "Complication" ("id_complication","id_complication_name") VALUES (12,'tachymeter');
INSERT INTO "Crown_type" ("id_crown_type","crown_name") VALUES (0,'other');
INSERT INTO "Crown_type" ("id_crown_type","crown_name") VALUES (1,'Screw-down');
INSERT INTO "Crown_type" ("id_crown_type","crown_name") VALUES (2,'Recessed');
INSERT INTO "Crown_type" ("id_crown_type","crown_name") VALUES (3,'Regular ');
INSERT INTO "Crown_function" ("id_crown_function","function_name") VALUES (0,'other');
INSERT INTO "Crown_function" ("id_crown_function","function_name") VALUES (1,'set time');
INSERT INTO "Crown_function" ("id_crown_function","function_name") VALUES (2,'wind');
INSERT INTO "Crown_function" ("id_crown_function","function_name") VALUES (3,'set date');
INSERT INTO "Crown_function" ("id_crown_function","function_name") VALUES (4,'hack');
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (0,6);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (0,9);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (0,2);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (0,1);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (1,1);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (2,1);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (3,1);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (4,6);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (4,10);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (4,11);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (5,1);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (6,2);
INSERT INTO "may_have_a_complication" ("id_watch","id_complication") VALUES (6,12);
INSERT INTO "Crown" ("id_crown","id_crown_type") VALUES (1,2);
INSERT INTO "Basic_info" ("id_info","id_manufactured_in","id_brand","id_style","id_gender","water_resistance","weight") VALUES (0,3,2,10,5,30,55.28);
INSERT INTO "Basic_info" ("id_info","id_manufactured_in","id_brand","id_style","id_gender","water_resistance","weight") VALUES (1,3,6,4,1,50,150);
INSERT INTO "Basic_info" ("id_info","id_manufactured_in","id_brand","id_style","id_gender","water_resistance","weight") VALUES (2,1,4,4,1,100,130);
INSERT INTO "Basic_info" ("id_info","id_manufactured_in","id_brand","id_style","id_gender","water_resistance","weight") VALUES (3,1,40,4,1,50,NULL);
INSERT INTO "Basic_info" ("id_info","id_manufactured_in","id_brand","id_style","id_gender","water_resistance","weight") VALUES (4,3,2,12,5,30,NULL);
INSERT INTO "Basic_info" ("id_info","id_manufactured_in","id_brand","id_style","id_gender","water_resistance","weight") VALUES (5,3,44,4,1,100,160);
INSERT INTO "Basic_info" ("id_info","id_manufactured_in","id_brand","id_style","id_gender","water_resistance","weight") VALUES (6,1,11,0,1,50,150);
INSERT INTO "Case" ("id_case","id_crystal","id_material","id_color","id_pusher","id_shape","thickness","lug_width","lug_to_lug","id_movement","id_caseback","id_dial","id_band") VALUES (0,3,8,7,0,11,8.5,NULL,35.2,0,0,0,0);
INSERT INTO "Case" ("id_case","id_crystal","id_material","id_color","id_pusher","id_shape","thickness","lug_width","lug_to_lug","id_movement","id_caseback","id_dial","id_band") VALUES (1,6,3,2,9,1,11.8,20.0,47.5,1,1,1,1);
INSERT INTO "Case" ("id_case","id_crystal","id_material","id_color","id_pusher","id_shape","thickness","lug_width","lug_to_lug","id_movement","id_caseback","id_dial","id_band") VALUES (2,1,3,2,9,1,10.5,12.0,44.25,2,2,2,2);
INSERT INTO "Case" ("id_case","id_crystal","id_material","id_color","id_pusher","id_shape","thickness","lug_width","lug_to_lug","id_movement","id_caseback","id_dial","id_band") VALUES (3,1,3,2,9,1,11.0,20.0,47.0,3,3,3,3);
INSERT INTO "Case" ("id_case","id_crystal","id_material","id_color","id_pusher","id_shape","thickness","lug_width","lug_to_lug","id_movement","id_caseback","id_dial","id_band") VALUES (4,0,4,8,9,3,8.0,20.0,42.0,4,4,4,4);
INSERT INTO "Case" ("id_case","id_crystal","id_material","id_color","id_pusher","id_shape","thickness","lug_width","lug_to_lug","id_movement","id_caseback","id_dial","id_band") VALUES (5,2,2,1,9,1,8.0,18.0,43.3,5,5,5,5);
INSERT INTO "Case" ("id_case","id_crystal","id_material","id_color","id_pusher","id_shape","thickness","lug_width","lug_to_lug","id_movement","id_caseback","id_dial","id_band") VALUES (6,1,3,2,1,1,14.3,20.0,45.0,6,6,6,6);
INSERT INTO "Movement" ("id_movement","id_movement_type","id_battery","battery_life") VALUES (0,3,3,100);
INSERT INTO "Movement" ("id_movement","id_movement_type","id_battery","battery_life") VALUES (1,2,6,NULL);
INSERT INTO "Movement" ("id_movement","id_movement_type","id_battery","battery_life") VALUES (2,2,6,NULL);
INSERT INTO "Movement" ("id_movement","id_movement_type","id_battery","battery_life") VALUES (3,2,6,NULL);
INSERT INTO "Movement" ("id_movement","id_movement_type","id_battery","battery_life") VALUES (4,3,3,150);
INSERT INTO "Movement" ("id_movement","id_movement_type","id_battery","battery_life") VALUES (5,3,5,200);
INSERT INTO "Movement" ("id_movement","id_movement_type","id_battery","battery_life") VALUES (6,2,6,NULL);
INSERT INTO "Dial" ("id_dial","id_dial_type","id_index","id_hand","id_color","luminance") VALUES (0,13,10,16,9,1);
INSERT INTO "Dial" ("id_dial","id_dial_type","id_index","id_hand","id_color","luminance") VALUES (1,14,6,1,2,0);
INSERT INTO "Dial" ("id_dial","id_dial_type","id_index","id_hand","id_color","luminance") VALUES (2,14,3,3,7,1);
INSERT INTO "Dial" ("id_dial","id_dial_type","id_index","id_hand","id_color","luminance") VALUES (3,14,9,15,7,1);
INSERT INTO "Dial" ("id_dial","id_dial_type","id_index","id_hand","id_color","luminance") VALUES (4,13,10,16,8,0);
INSERT INTO "Dial" ("id_dial","id_dial_type","id_index","id_hand","id_color","luminance") VALUES (5,14,1,17,11,1);
INSERT INTO "Dial" ("id_dial","id_dial_type","id_index","id_hand","id_color","luminance") VALUES (6,14,9,5,2,1);
COMMIT;
