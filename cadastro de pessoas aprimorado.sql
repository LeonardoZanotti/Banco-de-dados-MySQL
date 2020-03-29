
/*
Exercícios da aula 13
1. Agrupar e contar as profissões
	select profissao, count(*) from gafanhotos group by profissao order by count(*);
    
2. Quantos homens e mulheres nasceram depois de 2005-01-01
	select sexo, count(*) from gafanhotos where nascimento > '2005-01-01' group by sexo;

3. Mostrar quantas pessoas nasceram em cada país, sendo que o país não pode ser Brasil e deve ter pelo menos 4 pessoas de origem do país
	select nacionalidade, count(*) from gafanhotos where nacionalidade != 'Brasil' group by nacionalidade having count(*) > 3;

4. Mostrar altura e o peso das pessoas que tem mais de 100 kg e estão acima da média da altura
	select altura, peso, count(*) from gafanhotos where peso > 100 group by altura having altura > (select avg(altura) from gafanhotos);

Exercícios da aula 12
1. Lista com nome de todas as gafanhotas:
		select * from gafanhotos where sexo = "F";
        
2. Lista de gafanhotos que nasceram entre 2000-01-01 e 2015-12-31:
		select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31'; 

3. Lista de homens que trabalham como programadores:
		select * from gafanhotos where sexo = "M" and profissao = "programador";

4. Lista de mulheres brasileiras em que o nome começa com J:
		select * from gafanhotos where sexo = "F" and nacionalidade = "Brasil" and nome like "j%";

5. Lista com nome e nacionalidade de todos os homens que tem silva no nome, não nasceram no Brasil e pesam menos de 100 kg:
		select nome, nacionalidade from gafanhotos where sexo = "M" and nome like "%silva%" and nacionalidade <> "Brasil" and peso < "100";
        
6. Maior altura dos homens brasileiros:
		select max(altura) from gafanhotos where sexo = "M" and nacionalidade = "Brasil";

7. Média de peso dos gafanhotos:
		select avg(peso) from gafanhotos;
        
8. O menor peso das gafanhotas que nasceram fora do Brasil e entre 1990-01-01 e 2000-12-31:
		select min(peso) from gafanhotos where sexo = "F" and nacionalidade != "Brasil" and nascimento between '1990-01-01' and '2000-12-31';
        
9. Quantas gafanhotas tem mais de 1.90 de altura:
		select count(*) from gafanhotos where sexo = "F" and altura > "1.90";

Exportação de dados (fazer backup):
Clicar em Server --> Data Export --> Selecionar os bancos de dados e tabelas que quiser, escolher se faz o Dump só da estrutura, só dos
dados ou dos dois --> escolher se quer fazer numa pasta ou num arquivo único e o local de destino da exportação --> marca 
"Include Create Schema" para já criar o banco de dados pra você (se n vc teria que dar um 'create database' e daí importar o dump pra
usar ele) --> Start Export --> não há senha para root --> exportado

Importar dados:
Server -> Data Import -> seleciona o arquivo -> manda importar e dale

Comandos DQL (Data Query Language)
describe cursos ou desc cursos; 				mostra a estrutura da tabela cursos
select * from pessoas; 			mostra todos os dados da tabela 'pessoas'
select id, nome, sexo from pessoas; 			mostra apenas as colunas citadas da tabela 'pessoas' na ordem em que foram citadas
select * from pessoas order by id desc/asc;		ordena ascendente ou descendente
select idcurso, nome from cursos where ano = "2016" order by nome;			mostra o idcurso e o nome da tabela cursos das colunas em que o ano é 2016, interessante notar que o ano não vai aparecer, mas se sabe que em todos é 2016
select nome, descricao, ano from cursos where ano <= "2015" order by ano, nome;			mostra o nome e a descrição da tabela cursos das colunas em que o ano é menor ou igual a 2015 interessante notar que o ano não vai aparecer, mas se sabe que em todos é menor ou igual a 2015
select id, nome, sexo, nascimento from gafanhotos order by altura asc/desc, nascimento asc/desc;	 	mostra as colunas citadas na ordem em que foram citadas e ordena elas primeiro pela altura e depois pelo nascimento
select nome, descricao, ano from cursos where ano (!= ou <>)"2016" order by ano, nome;			mostra apenas os cursos onde o ano é diferente de 2016
select nome, peso from gafanhotos where peso between '60' and '70' order by peso, nome;			mostra apenas pessoas entre 60 e 70 de peso
select nome, descricao, ano from cursos where ano in ('2014', '2016') order by ano, nome;		mostra apenas cursos que tem ano igual a 2014 ou 2016
select * from cursos where carga < 30 and totaulas < 10 order by ano;		mostra apenas cursos que tem carga menor que 30 e aulas totais menores que 10
select * from cursos where carga < 30 or totaulas < 10 order by ano;		mostra apenas cursos que tem carga menor que 30 ou aulas totais menores que 10
select * from cursos where nome like 'P%';					mostra as tuplas em que o nome começa com 'p' sendo que é um comando case sensitive
select * from cursos where nome like '%P';					mostra as tuplas em que o nome termina em 'p', note que o % é como se fosse um coringa pro resto das letras
select * from cursos where nome like '%P%';					mostra as tuplas em que o nome começa, possuem ou terminam com 'P'. lembre-se que o % pode significar nada. toma cuidado que no MySQL, se você usar tipo %a% ele vai pegar as palavras em que tem A com acento também
select * from cursos where nome not like '%P%';				mostra as tuplas em que o nome não tem P em nenhum lugar
select * from cursos where nome like 'ph%p';				mostra as tuplas em que o nome começa com ph e terminam com p, o que é diferente de ph%p%, que daí vai pegar PHP4 e PHP7
select * from cursos where nome like 'pH%P_';				mostra as tuplas em que o nome começa com ph e terminam com p tendo ainda mais um caracter após o p do final
select * from cursos where nome like 'P_p%';				mostra as tuplas em que o nome começa com p, tem um caracter daí tem mais um p e daí pode ou não ter algo depois disso
select * from cursos where nome like 'P%o__';				mostra as tuplas em que o nome começa com P daí pode ter algo daí tem um O e daí tem 2 caracter depois do O
select * from gafanhotos where nome like '%silva%';			Pessoas que possuem silva no nome - mostra o nome Silvana
select * from gafanhotos where nome like '%_silva%';		Restringe o silva a ser apenas um sobrenome, pois o _ vai contar o espaço entre os nomes como caracter
select * from gafanhotos where nome like 'silva%';			Apenas nomes que comecem com silva	
select * from gafanhotos where nome like '%silva';	 		Apenas nomes que terminem em silva
select distinct nacionalidade from gafanhotos order by nacionalidade;			Se tiver nacionalidades repetidas ele vai mostrar apenas a primeira ocorrência, bom pra tipo ver todas as modalidades que tem sem se importar com a quantidade
select count(*) from cursos;								Conta quantas tuplas tem a tabela cursos
select count(*) from cursos where carga > 30;				Quantas tuplas tem carga > 30
select max(carga) from cursos;								Qual a maior carga da tabela cursos
select max(totaulas) from cursos where ano = "2016";		seleciona qual foi o maior total de aulas que um curso de 2016 teve
select min(totaulas) from cursos;							seleciona o menor total de aulas da tabela cursos
select nome, min/max(totaulas) from cursos;					mostra o nome e o totaulas da tupla da tabela cursos com menos/mais totaulas -- Se tiver mais de um com o mesmo valor ele mostra só o primeiro
select sum(totaulas) from cursos;							Somatória das aulas totais
select avg(totaulas) from cursos;							Média das aulas totais
select carga, count(nome) from cursos group by carga order by carga;		// Realiza agrupamentos pela carga e o count(nome) mostra quantos elementos tem em cada agrupamento
select carga, totaulas, count(*) from cursos where totaulas = 30 group by carga;	// Faz agrupamento por carga dos cursos que possuem totaulas = 30
select carga, count(*) from cursos group by carga having count(*) > 3;		// Agrupa pela carga mas só mostra os grupos que tem mais de 3 elementos. Esse having só vai funcionar se for um dos elementos que vc selecionou: nesse caso o count(*) e a carga, tipo vc n pode pedir pra ter mais de 20 totaulas pq isso vc n selecionou
select ano, count(*) from cursos where totaulas >  20 group by ano having ano > 2013 order by count(*);	 	// o que dá pra fazer é usar um where que não depende de você selecionar ou não (continuação do comentário de cima)
select carga, count(*) from cursos where ano > 2013 group by carga having carga > (select avg(carga) from cursos) order by carga; 	// Agrupa os cursos que tem carga maior que a média de carga lançados depois de 2013 por carga e ordena eles por carga, mostra a carga e a quantidade de elementos em cada grupo
select gafanhotos.nome, cursos.nome, cursos.ano from gafanhotos join cursos on cursos.idcurso = gafanhotos.cursopreferido;		seleciona o nome da tabela gafanhotos e junta com o nome do curso e o ano da tabela cursos, como tem aquele "on" ali, ele seleciona apenas os nomes e anos da tabela curso referentes aos cursos preferidos, caso contrário todos os nomes e anos iam ser mostrados ali, tendo isso, apenas as pessoas que tem curso preferido são selecionadas
select g.nome, c.nome, c.ano from gafanhotos as g inner join cursos as c on c.idcurso = g.cursopreferido;		seleciona o nome da tabela gafanhotos e junta com o nome do curso e o ano da tabela cursos, como tem aquele "on" ali, ele que faz a ligação entre a chave estrangeira, ele seleciona apenas os nomes e anos da tabela curso referentes aos cursos preferidos, caso contrário todos os nomes e anos iam ser mostrados ali, tendo isso, apenas as pessoas que tem curso preferido são selecionadas, aqui foi usado "inner join" que é basicamente o comando completo de join, é tipo usar describe ao invés de desc, além de usar apelidos de coluna pra se referenciar às colunas gafanhotos e cursos (gafanhotos tá definido como g e cursos como c)
select g.nome, c.nome, c.ano from gafanhotos as g left outer (ou só left) join cursos as c on c.idcurso = g.cursopreferido;		seleciona o nome da tabela gafanhotos e junta com o nome do curso e o ano da tabela cursos, como tem aquele "on" ali, ele que faz a ligação entre a chave estrangeira, ele seleciona apenas os nomes e anos da tabela curso referentes aos cursos preferidos, caso contrário todos os nomes e anos iam ser mostrados ali, como usamos o left outer join, a tabela da esquerda (esquerda do join) vai mostrar todos os nomes, mesmo que a pessoa não tenha curso preferido, além de usar apelidos de coluna pra se referenciar às colunas gafanhotos e cursos (gafanhotos tá definido como g e cursos como c)
select g.nome, c.nome, c.ano from gafanhotos as g right outer (ou só right) join cursos as c on c.idcurso = g.cursopreferido;		seleciona o nome da tabela gafanhotos e junta com o nome do curso e o ano da tabela cursos, como tem aquele "on" ali, ele que faz a ligação entre a chave estrangeira, como estamos usando right join, a tabela da direita (do join) vai mostrar todos os dados, mesmo que o curso não seja o preferido de um dos nomes, tendo isso, apenas as pessoas que tem curso preferido são selecionadas,além de usar apelidos de coluna pra se referenciar às colunas gafanhotos e cursos (gafanhotos tá definido como g e cursos como c)

isso aqui é um comando só:
select g.nome, a.curso, c.nome from gafanhotos as g			selecione nome da tabela gafanhotos (apelidado de g), curso da tabela gafanhoto_assiste_curso (apelidado de a) e nome da tabela cursos (apelidado de c)
join gafanhoto_assiste_curso as a							junte a tabela gafanhoto_assiste_curso (a)
on g.id = a.idgafanhoto										restrição: junte apenas os dados que tiverem id da tabela gafanhotos igual ao idgafanhoto da tabela gafanhoto_assiste_curso 
join cursos as c											junte essa nova tabela com a tabela cursos (c)
on a.curso = c.idcurso										restrição: junte apenas os dados que tenham curso da tabela gafanhoto_assiste_curso igual ao idcurso da tabela cursos
order by g.nome;											ordenados pelo nome da tabela gafanhotos

show tables;
show create table amigos;				mostra os comandos usados para criar a tabela amigos
show create database phpmyadmin;				mostra os comandos usados para criar o banco de dados phpmyadmin

Comandos DML (Data Manipulation Language):
delete from pessoas where id = 1;						deleta o registro da tabela pessoas que tem id = 1, se houver uma chave estrangeira referenciando o registro, o registro não poderá ser apagado
update pessoas set id = id - 7 where id = id;			atualiza a tabela pessoas setando o id como id - 7
update pessoas set nome = 'Rafael' where id = 1;		na tabela pessoas o registro que tem id = 1 vai ter nome Rafael
update cursos set nome = 'C#', carga = '24', aulastotais = "22" where idcurso = 4 limit 1;		limit 1 impede que o update afete mais de uma linha, importante caso o safe mode esteja desligado
truncate table pessoas;		Deleta todos os dados da tabela pessoas	

insert into pessoas values										Inserir várias pessoas de uma só vez
(default, 'Ana', '1989-05-25', 'F', '71.4', '1.69', 'EUA'),
(default, 'Pedro', '2000-03-30', 'M', '70.99', '1.81', 'Portugal'),
(default, 'Kirito', '1998-05-01', 'M', '75.70', '1.79', 'Japão');

insert into pessoas values
(default, 'José Samuel', '2001-01-07', 'M', '85.85', '1.64', 'Congo');		Pode-se ocultar a ordem exigida se for colocar tudo na ordem em que aparecem mesmo ali nas colunas

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Felipe', '2002-03-17', 'M', '73.15', '1.74', default);		usa o id e nacionalidade default (ou seja, o id normal msm do auto_increment e Brasil

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)			não coloca-se o id pq ele tem o auto_increment
values
('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil'); 	aspas em banco de dados significa um dado, sem aspas é um constrain
				data em 'ano-mês-dia'



Comandos DDL (Data Definition Language)
create database cadastro		definindo o padrão de caracter que a gente usa (BR), se vc for ver a info do database vai ver que aparece daí
default character set utf8		esses dois default se chamam constrains (regras impostas ai que se cria)
default collate utf8_general_ci;	collation

drop table cursos;			deleta a tabela cursos
drop database cadastro;		deleta o banco de dados cadastro;

create table pessoas (
	id int not null auto_increment,		gera um id inteiro não nula automáticamente
	nome varchar(30) not null,
    nascimento date,					ao invés de usar idade usa-se o nascimento como uma data para não precisar atualizar
    sexo enum('M','F'), 				sexo só é possível ser esses dois valores
    peso decimal(5, 2),					decimal com 5 casas sendo duas depois da vírgula
    altura decimal(3, 2),
    nacionalidade varchar(20) default 'Brasil',
    primary key (id)					chave primária é o id, não podendo se repetir e facilitando a diferenciação das pessoas
) default charset = utf8;				define o padrão como utf8

create table if not exists cursos (				se não houver esse if not exists, o create table pode sobrescrever a tabela
	nome varchar(30) not null unique,			unique não permite um mesmo nome, sendo parecido com um primary key
    descricao text,
    carga int unsigned,							unsigned não permite sinais, nesse caso, negativos (-)
    aulastotais int,
    anoinicio year default '2020'
) default charset = utf8;

create table gafanhoto_assiste_curso (			criar a tabela gafanhoto_assite_curso
	id int not null auto_increment,				id inteiro não nulo com auto increment
    data date,									data no formato de data
    idgafanhoto int,							idgafanhoto inteiro
    curso int,									curso inteiro
    primary key (id),							id é chave primária
    foreign key (idgafanhoto) references gafanhotos(id),		chave estrangeira idgafanhoto referenciando o id da tabela gafanhotos
    foreign key (curso) references cursos(idcurso)			chave estrangeira curso referenciando o idcurso da tabela cursos
) default charset = utf8;				charset padrão é o utf8

alter table pessoas change altura altura decimal(3, 2);		para alterar o nome de um campo da tabela pessoas
alter table pessoas add column profissao varchar(10);		adiciona a coluna como sendo a última
alter table pessoas drop column profissao;					apaga a coluna
alter table pessoas add column profissao varchar(10) after nascimento;		escolhe a posição da coluna
alter table pessoas modify column profissao varchar (50);		modifica as constrains
alter table pessoas add column desq varchar(10) first;			adiciona a coluna na primeira posição
alter table pessoas auto_increment = 0; 					reiniciar a contagem pra vc n ter tipo id 4, 5, 10, 11, 15, só que nesse caso já começaria em 16, então vc tem que arrumar esses id ai antes de adicionar outra pessoa
alter table pessoas rename to tabela1; 						renomear a tabela
alter table cursos add primary key (idcurso);				adiciona a chave primária através do alter table
alter table cursos drop primary key;						remove a chave primária através do alter table, desse jeito vc pode modificar os id sem ter o problema deles ficarem iguais por um instante
alter table gafanhotos add foreign key (cursopreferido) references cursos(idcurso);			cria uma chave estrengeira entre a tabela cursos e a tabela gafanhotos, sendo a coluna curso preferido a chave estrangeira que referencia o idcurso da tabela cursos
*/