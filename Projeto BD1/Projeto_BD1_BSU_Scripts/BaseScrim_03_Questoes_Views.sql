/*
Questões 1 a 5: 	Criadas pelo professor
Questões 6 a 10: 	Criadas pelo grupo
*/

/*
1) Liste o id e o nome do time, bem como o nome e o cpf do seu
responsável.
*/
CREATE OR REPLACE VIEW basescrim.Q01_Responsavel_Time AS
SELECT 	T.Time_ID, T.Time_Nome,
		U.Usuario_Nome, R.Responsavel_CPF
FROM basescrim.Time as T
inner join basescrim.responsavel as R on T.Responsavel_ID = R.Usuario_ID
inner join basescrim.usuario as U on U.Usuario_ID = R.Usuario_ID
order by time_ID, Usuario_Nome;

/*
2) Liste o id e o nome do time, bem como o nome e o nível de cada
jogador pertencente ao mesmo.
*/
CREATE OR REPLACE VIEW basescrim.Q02_Nivel_Jogador_Time AS
SELECT 	T.Time_ID, T.Time_Nome,
		U.Usuario_Nome, J.Jogador_Nivel
FROM basescrim.Time as T
inner join basescrim.jogador as J on T.Time_ID = J.Time_ID
inner join basescrim.usuario as U on U.Usuario_ID = J.Usuario_ID
order by time_ID, Usuario_Nome;

/*
3) Liste o id e o nome dos usuários que não atuam como responsáveis
de time.
*/
CREATE OR REPLACE VIEW basescrim.Q03_Usuario_Nao_Responsavel AS
SELECT 	Usuario_ID, Usuario_Nome 
FROM basescrim.usuario 
where Usuario_Responsavel <> 1
order by Usuario_ID;

/*
4) Liste o número de treinos realizados por mês durante o ano de 2020.
*/
CREATE OR REPLACE VIEW basescrim.Q04_Qtd_Treino_Mensal_2020 AS
    SELECT  MONTHNAME(treino.Treino_DataHora) AS Treino_Mes,
			COUNT(treino.Treino_DataHora) AS qtd_Treino
    FROM basescrim.treino
    WHERE (YEAR(treino.Treino_DataHora) = 2020)
    GROUP BY MONTHNAME(treino.Treino_DataHora)
    ORDER BY MONTH(treino.Treino_DataHora);

/*
5) Liste o id e o nome do time que agendou treino, o id e o nome do
time que aceitou treinar, além das notas atribuídas por cada time.
*/
CREATE OR REPLACE VIEW basescrim.Q05_Treino_Agendado AS
select 	TAG.Time_ID as TimeAgenda_ID, TAG.Time_Nome as TimeAgenda_Nome,TRE.Nota_TimeAgenda,
		TAC.Time_ID as TimeAceita_ID, TAC.Time_Nome as TimeAceita_Nome,TRE.Nota_TimeAceita
FROM basescrim.treino as TRE
inner join basescrim.time as TAG on TRE.TimeAgenda_ID = TAG.Time_ID
inner join basescrim.time as TAC on TRE.TimeAceita_ID = TAC.Time_ID
order by TimeAgenda_ID, TimeAceita_ID;

/*
6) Listar os times (id e nome) registrados em ordem alfabética
*/
CREATE OR REPLACE VIEW basescrim.Q06_Time_Ordem_Alfabetica AS
SELECT T.Time_ID, T.Time_Nome
FROM basescrim.Time as T
order by T.Time_Nome;

/*
7) Listar (id e nome) de todos os jogadores reservas
*/
CREATE OR REPLACE VIEW basescrim.Q07_Jogador_Reserva AS
SELECT U.Usuario_ID, Usuario_Nome 
FROM basescrim.jogador as J 
inner join basescrim.usuario as U on U.Usuario_ID = J.Usuario_ID
WHERE J.Jogador_Titular = 0 
order by U.Usuario_ID;

/*
8) Listar (id e nome) dos times em ordem decrescente de notas
*/
CREATE OR REPLACE VIEW basescrim.Q08_Time_Ordem_Nota_Decrescente AS
SELECT Time_ID, Time_Nome, avg(Nota) as NotaMedia
FROM (	SELECT distinct T.Time_ID, T.Time_Nome, TRE.Nota_TimeAgenda as Nota
		FROM basescrim.Time as T
		inner join basescrim.treino as TRE on T.Time_ID = TRE.TimeAgenda_ID
		union
		SELECT distinct T.Time_ID, T.Time_Nome, TRE.Nota_TimeAceita as Nota
		FROM basescrim.Time as T
		inner join basescrim.treino as TRE on T.Time_ID = TRE.TimeAceita_ID
        ) as A
group by Time_ID, Time_Nome
order by NotaMedia desc;

/*
9) Listar (id e nome) dos times que tenham nota média maior que 3 
*/
CREATE OR REPLACE VIEW basescrim.Q09_Time_Nota_Media_Maior3 AS
SELECT Time_ID, Time_Nome, avg(Nota) as NotaMedia
FROM (	SELECT distinct T.Time_ID, T.Time_Nome, TRE.Nota_TimeAgenda as Nota
		FROM basescrim.Time as T
		inner join basescrim.treino as TRE on T.Time_ID = TRE.TimeAgenda_ID
		union
		SELECT distinct T.Time_ID, T.Time_Nome, TRE.Nota_TimeAceita as Nota
		FROM basescrim.Time as T
		inner join basescrim.treino as TRE on T.Time_ID = TRE.TimeAceita_ID
        ) as A
group by Time_ID, Time_Nome
having avg(nota) > 3
order by Time_ID;

/*
10) Listar treinos em que as notas entre os dois times tenham diferença maior que 2
*/
CREATE OR REPLACE VIEW basescrim.Q10_Treino_Dif_Nota_Maior2 AS
select 	TRE.Treino_DataHora,
		TAG.Time_ID as TimeAgenda_ID, TAG.Time_Nome as TimeAgenda_Nome,TRE.Nota_TimeAgenda,
		TAC.Time_ID as TimeAceita_ID, TAC.Time_Nome as TimeAceita_Nome,TRE.Nota_TimeAceita
FROM basescrim.treino as TRE
inner join basescrim.time as TAG on TRE.TimeAgenda_ID = TAG.Time_ID
inner join basescrim.time as TAC on TRE.TimeAceita_ID = TAC.Time_ID
where ( TRE.Nota_TimeAgenda - TRE.Nota_TimeAceita > 2 or TRE.Nota_TimeAceita - TRE.Nota_TimeAgenda > 2 )
order by Treino_DataHora;
