DROP DATABASE IF EXISTS basescrim ;
CREATE DATABASE  basescrim  ;

--
-- Table structure for table  Usuario 
--
-- DROP TABLE IF EXISTS  Usuario ;
CREATE TABLE  basescrim.Usuario  (
   Usuario_ID  int NOT NULL AUTO_INCREMENT,
   Usuario_Nome  varchar(255) NOT NULL,
   Usuario_Responsavel  boolean NOT NULL,
  PRIMARY KEY ( Usuario_ID )
)  AUTO_INCREMENT=1 ;

--
-- Table structure for table  Responsavel 
--
-- DROP TABLE IF EXISTS  Responsavel ;
CREATE TABLE  basescrim.Responsavel  (
   Usuario_ID  int NOT NULL,
   Responsavel_CPF  varchar(11) NOT NULL, 
  PRIMARY KEY ( Usuario_ID ),
  CONSTRAINT  Responsavel_Usuario_ID  FOREIGN KEY ( Usuario_ID ) REFERENCES  Usuario  ( Usuario_ID )
)  ;

--
-- Table structure for table  Time 
--
-- DROP TABLE IF EXISTS  Time ;
CREATE TABLE  basescrim.Time  (
   Time_ID  int NOT NULL AUTO_INCREMENT,
   Time_Nome  varchar(45) NOT NULL,  
   Responsavel_ID  int NOT NULL,
  PRIMARY KEY ( Time_ID ),
  KEY  Responsavel_ID  ( Responsavel_ID ),
  CONSTRAINT  Responsavel_ID  FOREIGN KEY ( Responsavel_ID ) REFERENCES  Responsavel  ( Usuario_ID )
)  AUTO_INCREMENT=1 ;

--
-- Table structure for table  Jogador 
--
-- DROP TABLE IF EXISTS  Jogador ;
CREATE TABLE  basescrim.Jogador  (
   Usuario_ID  int NOT NULL,
   Time_ID  int NOT NULL,
   Jogador_Conta  varchar(50) NOT NULL,
   Jogador_Nivel  tinyint NOT NULL,
   Jogador_Titular  boolean NOT NULL,
  PRIMARY KEY ( Usuario_ID ),
  KEY  Jogador_Time_ID  ( Time_ID ),
  CONSTRAINT  Jogador_Usuario_ID  FOREIGN KEY ( Usuario_ID ) REFERENCES  Usuario  ( Usuario_ID ),
  CONSTRAINT  Jogador_Time_ID  FOREIGN KEY ( Time_ID ) REFERENCES  Time  ( Time_ID )
)  ;

--
-- Table structure for table  Treino 
--
-- DROP TABLE IF EXISTS  Treino ;
CREATE TABLE  basescrim.Treino  (
   Treino_ID  int NOT NULL auto_increment,
   Treino_DataHora  datetime NOT NULL,
   Nota_TimeAceita  tinyint DEFAULT NULL,
   Nota_TimeAgenda  tinyint DEFAULT NULL,
   TimeAceita_ID  int NOT NULL,
   TimeAgenda_ID  int NOT NULL,
  PRIMARY KEY ( Treino_ID ),
  KEY  TimeAceita_ID  ( TimeAceita_ID ),
  KEY  TimeAgenda_ID  ( TimeAgenda_ID ),
  CONSTRAINT  TimeAceita_ID  FOREIGN KEY ( TimeAceita_ID ) REFERENCES  Time  ( Time_ID ),
  CONSTRAINT  TimeAgenda_ID  FOREIGN KEY ( TimeAgenda_ID ) REFERENCES  Time  ( Time_ID )
)  AUTO_INCREMENT=1 ;


--
-- Gerar_CPF Function
--
DELIMITER $$
CREATE  FUNCTION basescrim.gerar_CPF() RETURNS varchar(11) 
DETERMINISTIC
BEGIN
RETURN (
select  concat(substr(cpf, 1, 3), substr(cpf, 4, 3),  substr(cpf, 7, 3), first_dig, if(second_soma % 11 < 2, 0, 11 - (second_soma % 11))) AS cpf
from (
  select cpf, first_dig, second_one+second_two+second_three+second_four+second_five+second_six+second_seven+second_eight+second_nine+second_ten AS second_soma
  from (
    select
      cpf,
      11*original_one AS second_one,
      10*original_two AS second_two,
      9*original_three AS second_three,
      8*original_four AS second_four,
      7*original_five AS second_five,
      6*original_six AS second_six,
      5*original_seven AS second_seven,
      4*original_eight AS second_eight,
      3*original_nine AS second_nine,
      2*if(soma % 11 < 2, 0, 11 - (soma % 11)) AS second_ten,
      if(soma % 11 < 2, 0, 11 - (soma % 11)) AS first_dig
    from (
      select cpf, one, two, three, four, five, six, seven, eight, nine, one+two+three+four+five+six+seven+eight+nine AS soma,
      original_one, original_two, original_three, original_four, original_five, original_six, original_seven, original_eight, original_nine from (
        select
          cpf,
          substr(cpf, 1, 1) AS original_one,
          substr(cpf, 2, 1) AS original_two,
          substr(cpf, 3, 1) AS original_three,
          substr(cpf, 4, 1) AS original_four,
          substr(cpf, 5, 1) AS original_five,
          substr(cpf, 6, 1) AS original_six,
          substr(cpf, 7, 1) AS original_seven,
          substr(cpf, 8, 1) AS original_eight,
          substr(cpf, 9, 1) AS original_nine,
          10*substr(cpf, 1, 1) AS one,
          9*substr(cpf, 2, 1) AS two,
          8*substr(cpf, 3, 1) AS three,
          7*substr(cpf, 4, 1) AS four,
          6*substr(cpf, 5, 1) AS five,
          5*substr(cpf, 6, 1) AS six,
          4*substr(cpf, 7, 1) AS seven,
          3*substr(cpf, 8, 1) AS eight,
          2*substr(cpf, 9, 1) AS nine
        from (
          select concat(lpad(floor(rand() * 1000), 3, '0'), lpad(floor(rand() * 1000), 3, '0'), lpad(floor(rand() * 1000), 3, '0')) cpf
        ) t1
      ) t2
    ) t3
  ) t4
  ) t5 limit 1) ;
END$$
DELIMITER ;


