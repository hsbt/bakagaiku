create database bakagaiku_development;
create database bakagaiku_test;
create database bakagaiku_production;
grant all on bakagaiku_development.* to 'root'@'localhost';
grant all on bakagaiku_test.* to 'root'@'localhost';
grant all on bakagaiku_prodcution.* to 'root'@'localhost';
