#!/bin/bash

# DEV
mysql -uroot -proot -e                                  "DROP USER 'your_company'@'%'";
mysql -uroot -proot -e                                  "CREATE USER 'your_company'@'%' IDENTIFIED BY 'your_company';";

# PARTENAIRE
mysql -uroot -proot -e                                  "DROP DATABASE your_company;";
mysql -uroot -proot -e                                  "CREATE DATABASE your_company DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;";
mysql -uroot -proot -e                                  "GRANT ALL PRIVILEGES ON your_company.* TO 'your_company'@'%';";