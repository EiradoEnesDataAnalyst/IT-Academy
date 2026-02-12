DROP DATABASE IF EXISTS TransferAnalytics;

CREATE DATABASE TransferAnalytics;
USE TransferAnalytics;


DROP TABLE IF EXISTS american_users;

CREATE TABLE american_users(
                            id VARCHAR(10),
							name VARCHAR(50),
                            surname VARCHAR(50),
                            phone VARCHAR(50),
                            email VARCHAR(50),
                            birth_date VARCHAR(50),
                            country VARCHAR(50),
                            city VARCHAR(50),
                            postal_code VARCHAR(50),
                            address VARCHAR(50));
                            
DROP TABLE IF EXISTS companies;

CREATE TABLE companies(
					   company_id VARCHAR(10),
					   company_name VARCHAR(50),
					   phone VARCHAR(30),
					   email VARCHAR(50),
					   country VARCHAR(30),
					   website VARCHAR(50));
                       
                       
DROP TABLE IF EXISTS credit_cards;

CREATE TABLE credit_cards(
                          id VARCHAR(10),
                          user_id VARCHAR(10),
                          iban VARCHAR(50),
                          pan VARCHAR(30),
                          pin VARCHAR(10),
                          cvv VARCHAR(10),
                          track1 VARCHAR(100),
                          track2 VARCHAR(100),
                          expiring_date VARCHAR(50));
                          
                          
DROP TABLE IF EXISTS european_users;

CREATE TABLE european_users(
                            id VARCHAR(10),
							name VARCHAR(50),
                            surname VARCHAR(50),
                            phone VARCHAR(50),
                            email VARCHAR(50),
                            birth_date VARCHAR(50),
                            country VARCHAR(50),
                            city VARCHAR(50),
                            postal_code VARCHAR(50),
                            address VARCHAR(50));
                            
DROP TABLE IF EXISTS products ;

CREATE TABLE products(
                      id VARCHAR(10),
                      product_name VARCHAR(30),
                      price VARCHAR(10),
                      colour VARCHAR(20),
                      weight VARCHAR(10),
                      warehouse_id VARCHAR(10));
                      
DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions(
                          id VARCHAR(50),
                          card_id VARCHAR(10),
                          business_id VARCHAR(10),
                          timestamp TIMESTAMP,
                          amount VARCHAR(50),
                          declined VARCHAR(10),
                          product_ids VARCHAR(30),
                          user_id VARCHAR(10),
                          lat VARCHAR(50),
                          longitude VARCHAR(50));
                          





                          