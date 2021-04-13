DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS sources;
DROP TABLE IF EXISTS headlines;

CREATE TABLE "category" (
"category_id" serial NOT NULL,
"category_name" VARCHAR (100) NOT NULL,
"last_updated" timestamp DEFAULT localtimestamp NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE "sources" (
    "source_id" serial NOT NULL,
    "source_name" VARCHAR(100) NOT NULL,
    "last_updated" timestamp  DEFAULT localtimestamp NOT NULL,
	PRIMARY KEY (source_id)
);

CREATE TABLE "headlines" (
    "article_id" serial   NOT NULL,
    "article_name" VARCHAR(500)   NOT NULL,
    "article_sub_header" VARCHAR(500)   NOT NULL,
    "source_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    "url" VARCHAR(300)   NOT NULL,
    "last_updated" timestamp  DEFAULT localtimestamp NOT NULL,
	PRIMARY KEY (article_id),
	CONSTRAINT fk_category
		FOREIGN KEY(category_id)
			REFERENCES category(category_id),
	CONSTRAINT fk_sources
		FOREIGN KEY (source_id)
			REFERENCES sources(source_id)
);