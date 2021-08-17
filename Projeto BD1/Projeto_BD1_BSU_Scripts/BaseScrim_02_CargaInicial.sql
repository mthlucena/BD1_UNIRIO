-- Limpeza da Base
delete from basescrim.treino;
delete from basescrim.jogador;
delete from basescrim.time;
delete from basescrim.responsavel;
delete from basescrim.usuario;

ALTER TABLE basescrim.treino AUTO_INCREMENT = 1;
ALTER TABLE basescrim.time AUTO_INCREMENT = 1;
ALTER TABLE basescrim.usuario AUTO_INCREMENT = 1;

-- Carga de usuários

 INSERT INTO basescrim.usuario (Usuario_Nome, Usuario_Responsavel) VALUES
("Matheus",1),
("Gabriel",0),
("Raphael",0),
("Lucas",0),
("Maria",0),
("Laura",0),

("Francesco Viergolinii",0),

("Arthur",1),
("Pedro",0),
("Whatsapp Jr",0),
("Ciro",0),
("Eduardo",0),
("Vihtube",0),

("Felipe Neto",0),

("Paulo",1),
("Jobson",0),
("Rodrigo",0),
("Vitor",0),
("Ana",0),
("Liz",0),

("Eduardo Jr",0),

("André",1),
("João",0),
("Diego",0),
("Marcelo",0),
("Malu",0),
("Adriana",0),

("Fred",0)
;


-- Carga de Responsáveis
INSERT INTO basescrim.responsavel (Usuario_ID, Responsavel_CPF)
select Usuario_ID, basescrim.gerar_CPF() as Responsavel_CPF
from basescrim.usuario where Usuario_Responsavel = 1  ;


-- Carga de Times
INSERT INTO basescrim.time (Time_Nome,Responsavel_ID)
VALUES
("Scubi Dubi Du",(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 1 and usuario_nome = 'Matheus')),
("Turma do Bairro",(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 1 and usuario_nome = 'Arthur')),
("Minerva",(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 1 and usuario_nome = 'Paulo')),
("Omegle E-Sports",(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 1 and usuario_nome = 'André'));

-- Carga de Jogadores
INSERT INTO basescrim.jogador
(Jogador_Conta,
Jogador_Nivel,
Jogador_Titular,
Usuario_ID,
Time_ID)
VALUES
("lagega",			1,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Gabriel'),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )), 
("Burn to Ashes",	6,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Raphael'),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("LucasDC",			2,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Lucas'),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("ZzCottonCandyZz",	4,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Maria'),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("LauraAh+Braba",	7,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Laura'),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("Tote Italie",		5,0,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Francesco Viergolinii'),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),

("PedrinOh+Brabo",	3,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Pedro'),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("ZapZap Jr",		8,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Whatsapp Jr'),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("ZerOII",			4,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Ciro'),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("Vanilish",		3,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Eduardo'),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("Vihtube Oficial",	5,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Vihtube'),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("Nelipe Feto",		2,0,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Felipe Neto'),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
 
("Filho do Trabson",4,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Jobson'),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("Rod10",			3,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Rodrigo'),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("VictoryKing",		7,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Vitor'),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("AnaBanana",		5,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Ana'),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("RainhaElizabeth",	2,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Liz'),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("Duduzin",			4,0,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Eduardo Jr'),(select time_ID from basescrim.time where time_nome = "Minerva" )),

("AllByNo",			1,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'João'),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("WarSoul",			8,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Diego'),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("Martelo",			2,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Marcelo'),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("Maluca23",		4,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Malu'),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("Drica",			3,1,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Adriana'),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("Fred9",			9,0,(select Usuario_ID from basescrim.usuario where Usuario_Responsavel = 0 and usuario_nome = 'Fred'),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ))
;

-- Carga de Treinos
INSERT INTO basescrim.treino (Treino_DataHora, Nota_TimeAceita, Nota_TimeAgenda, TimeAceita_ID, TimeAgenda_ID)
VALUES
("2020-07-04 19:15:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" ),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("2020-12-16 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Minerva" ),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("2020-11-23 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),

("2021-01-15 16:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" ),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("2020-10-12 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Minerva" ),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("2019-09-03 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),

("2021-01-20 16:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" ),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("2021-01-01 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" ),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("2020-07-11 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ),(select time_ID from basescrim.time where time_nome = "Minerva" )),

("2021-01-16 16:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" ),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("2019-11-19 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" ),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("2020-04-13 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Minerva" ),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),

("2020-06-04 19:15:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" ),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("2020-11-16 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Minerva" ),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),
("2020-10-23 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" )),

("2021-01-03 16:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" ),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("2020-09-12 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Minerva" ),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),
("2019-08-03 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" )),

("2021-01-02 16:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" ),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("2021-01-11 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" ),(select time_ID from basescrim.time where time_nome = "Minerva" )),
("2020-06-11 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ),(select time_ID from basescrim.time where time_nome = "Minerva" )),

("2021-01-05 16:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Scubi Dubi Du" ),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("2019-12-19 20:00:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Turma do Bairro" ),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" )),
("2020-03-13 21:30:00",FLOOR(RAND()*(5)+1),FLOOR(RAND()*(5)+1),(select time_ID from basescrim.time where time_nome = "Minerva" ),(select time_ID from basescrim.time where time_nome = "Omegle E-Sports" ))
;
