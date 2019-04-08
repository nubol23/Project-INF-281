BEGIN;
--
-- Create model Dish
--
CREATE TABLE "food_recommender_dish" (
	"id" serial NOT NULL PRIMARY KEY, 
	"name" varchar(200) NOT NULL, 
	"preparation" text NOT NULL, 
	"imagePath" varchar(200) NOT NULL
);
--
-- Create model DishIngredients
--
CREATE TABLE "food_recommender_dishingredients" (
	"id" serial NOT NULL PRIMARY KEY, 
	"dish_id" integer NOT NULL
);
--
-- Create model DishInMenu
--
CREATE TABLE "food_recommender_dishinmenu" (
	"id" serial NOT NULL PRIMARY KEY, 
	"dish_id" integer NOT NULL
);
--
-- Create model DishInterest
--
CREATE TABLE "food_recommender_dishinterest" (
	"id" serial NOT NULL PRIMARY KEY, 
	"score" integer NOT NULL, 
	"dish_id" integer NOT NULL
);
--
-- Create model Ingredient
--
CREATE TABLE "food_recommender_ingredient" (
	"id" serial NOT NULL PRIMARY KEY, 
	"name" varchar(200) NOT NULL, 
	"unitaryPrice" double precision NOT NULL
);
--
-- Create model Restaurant
--
CREATE TABLE "food_recommender_restaurant" (
	"id" serial NOT NULL PRIMARY KEY, 
	"name" varchar(200) NOT NULL
);
--
-- Create model User
--
CREATE TABLE "food_recommender_user" (
	"id" serial NOT NULL PRIMARY KEY, 
	"name" varchar(200) NOT NULL, 
	"email" varchar(200) NOT NULL, 
	"sex" varchar(1) NOT NULL, 
	"role" boolean NOT NULL, 
	"hashedPassword" varchar(1) NOT NULL
);
--
-- Add field user to dishinterest
--
ALTER TABLE "food_recommender_dishinterest" ADD COLUMN "user_id" integer NOT NULL;
--
-- Add field restaurant to dishinmenu
--
ALTER TABLE "food_recommender_dishinmenu" ADD COLUMN "restaurant_id" integer NOT NULL;
--
-- Add field ingredient to dishingredients
--
ALTER TABLE "food_recommender_dishingredients" ADD COLUMN "ingredient_id" integer NOT NULL;
ALTER TABLE "food_recommender_dishingredients" ADD CONSTRAINT "food_recommender_dis_dish_id_7e3f9199_fk_food_reco" FOREIGN KEY ("dish_id") REFERENCES "food_recommender_dish" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "food_recommender_dishingredients_dish_id_7e3f9199" ON "food_recommender_dishingredients" ("dish_id");
ALTER TABLE "food_recommender_dishinmenu" ADD CONSTRAINT "food_recommender_dis_dish_id_c1c0c7cc_fk_food_reco" FOREIGN KEY ("dish_id") REFERENCES "food_recommender_dish" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "food_recommender_dishinmenu_dish_id_c1c0c7cc" ON "food_recommender_dishinmenu" ("dish_id");
ALTER TABLE "food_recommender_dishinterest" ADD CONSTRAINT "food_recommender_dis_dish_id_b8a36036_fk_food_reco" FOREIGN KEY ("dish_id") REFERENCES "food_recommender_dish" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "food_recommender_dishinterest_dish_id_b8a36036" ON "food_recommender_dishinterest" ("dish_id");
CREATE INDEX "food_recommender_dishinterest_user_id_e3bedeef" ON "food_recommender_dishinterest" ("user_id");
ALTER TABLE "food_recommender_dishinterest" ADD CONSTRAINT "food_recommender_dis_user_id_e3bedeef_fk_food_reco" FOREIGN KEY ("user_id") REFERENCES "food_recommender_user" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "food_recommender_dishinmenu_restaurant_id_18b51c56" ON "food_recommender_dishinmenu" ("restaurant_id");
ALTER TABLE "food_recommender_dishinmenu" ADD CONSTRAINT "food_recommender_dis_restaurant_id_18b51c56_fk_food_reco" FOREIGN KEY ("restaurant_id") REFERENCES "food_recommender_restaurant" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "food_recommender_dishingredients_ingredient_id_d223a22b" ON "food_recommender_dishingredients" ("ingredient_id");
ALTER TABLE "food_recommender_dishingredients" ADD CONSTRAINT "food_recommender_dis_ingredient_id_d223a22b_fk_food_reco" FOREIGN KEY ("ingredient_id") REFERENCES "food_recommender_ingredient" ("id") DEFERRABLE INITIALLY DEFERRED;
COMMIT;
