CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"idClothes" integer NOT NULL,
	"idPhoto" integer NOT NULL,
	"price" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.clothes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"idCategory" integer NOT NULL,
	"size" varchar(1) NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"idUser" integer NOT NULL,
	"idProductAmount" integer NOT NULL,
	"status" TEXT NOT NULL DEFAULT 'criada',
	"purchaseDate" DATE DEFAULT 'null',
	"idAdress" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.productsAmount" (
	"id" serial NOT NULL,
	"idProduct" serial NOT NULL,
	CONSTRAINT "productsAmount_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.Addresses" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"country" TEXT NOT NULL,
	CONSTRAINT "Addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("idClothes") REFERENCES "clothes"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("idPhoto") REFERENCES "photos"("id");


ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("idCategory") REFERENCES "categories"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("idUser") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("idProductAmount") REFERENCES "productsAmount"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("idAdress") REFERENCES "Addresses"("id");

ALTER TABLE "productsAmount" ADD CONSTRAINT "productsAmount_fk0" FOREIGN KEY ("idProduct") REFERENCES "products"("id");