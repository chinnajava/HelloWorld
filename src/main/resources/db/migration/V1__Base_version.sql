CREATE TABLE categories (
  category_id bigserial NOT NULL ,
  category_name varchar(15) DEFAULT NULL UNIQUE,
  description TEXT,
  image_url varchar(1024) DEFAULT NULL,
  created timestamp DEFAULT NULL,
  created_by varchar(255) DEFAULT NULL,
  modified timestamp DEFAULT NULL,
  modified_by varchar(255) DEFAULT NULL
) ;

CREATE TABLE customer_type (
  customer_type_id bigserial,
  description varchar(255) DEFAULT NULL,
  created timestamp DEFAULT NULL,
  created_by varchar(255) DEFAULT NULL,
  modified timestamp DEFAULT NULL,
  modified_by varchar(255) DEFAULT NULL
) ;

CREATE TABLE regions (
  region_id serial PRIMARY KEY,
  region_name varchar(15) DEFAULT NULL unique,
  created timestamp DEFAULT NULL,
  created_by varchar(255) DEFAULT NULL,
  modified timestamp DEFAULT NULL,
  modified_by varchar(255) DEFAULT NULL
) ;

CREATE TABLE territories (
  territory_id bigserial PRIMARY KEY,
  region_id bigint DEFAULT NULL,
  territory_name varchar(64) DEFAULT NULL,
  created timestamp DEFAULT NULL,
  created_by varchar(255) DEFAULT NULL,
  modified timestamp DEFAULT NULL,
  modified_by varchar(255) DEFAULT NULL,
   FOREIGN KEY (region_id) REFERENCES regions(region_id)
) ;

CREATE TABLE customers (
  customer_id bigserial PRIMARY KEY ,
  address varchar(60) DEFAULT NULL,
  city varchar(30) DEFAULT NULL,
  company_name varchar(40) DEFAULT NULL,
  contact_name varchar(30) DEFAULT NULL,
  contact_title varchar(30) DEFAULT NULL,
  country varchar(15) DEFAULT NULL,
  credit_rating varchar(50) DEFAULT NULL,
  fax varchar(24) DEFAULT NULL,
  phone varchar(24) DEFAULT NULL,
  postal_code varchar(10) DEFAULT NULL,
  region_id bigint NOT NULL,
  created timestamp DEFAULT NULL,
  created_by varchar(255) DEFAULT NULL,
  modified timestamp DEFAULT NULL,
  modified_by varchar(255) DEFAULT NULL,
   FOREIGN KEY (region_id) REFERENCES regions (region_id)
) ;



CREATE TABLE employees (
  employee_id bigserial PRIMARY KEY ,
  address varchar(128) DEFAULT NULL,
  city varchar(64) DEFAULT NULL,
  date_of_birth date DEFAULT NULL,
  date_of_hire date DEFAULT NULL,
  first_name varchar(64) DEFAULT NULL,
  home_phone varchar(10) DEFAULT NULL,
  last_name varchar(64) DEFAULT NULL,
  postal_code varchar(10) DEFAULT NULL,
  state varchar(2) DEFAULT NULL,
  supervisor_id bigint DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  created timestamp DEFAULT NULL,
  created_by varchar(255) DEFAULT NULL,
  modified timestamp DEFAULT NULL,
  modified_by varchar(255) DEFAULT NULL
) ;


CREATE TABLE employee_territories (
  employee_territory_id bigserial PRIMARY KEY,
  employee_id bigint NOT NULL,
  territory_id bigint DEFAULT NULL,
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
   FOREIGN KEY (territory_id) REFERENCES territories (territory_id)
) ;

CREATE TABLE entity_history (
  entity_history_id bigserial NOT NULL,
  api_version bigint DEFAULT NULL,
  entity_id bigint DEFAULT NULL,
  entity_type varchar(255) ,
  history_action varchar(255) DEFAULT NULL,
  serialized_entry text,
  timestamp timestamp DEFAULT NULL,
  "user" varchar(255) DEFAULT NULL,
  PRIMARY KEY (entity_history_id)
) ;

