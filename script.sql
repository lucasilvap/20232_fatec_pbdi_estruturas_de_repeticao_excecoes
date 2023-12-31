DO
$$
DECLARE
	valores INT[] := ARRAY[
		valor_aleatorio_entre(1, 10),
		valor_aleatorio_entre(1, 10),
		valor_aleatorio_entre(1, 10),
		valor_aleatorio_entre(1, 10),
		valor_aleatorio_entre(1, 10)
	];
	valor INT;
	soma INT := 0;
BEGIN
	FOREACH valor IN ARRAY valores LOOP
		RAISE NOTICE 'Valor da vez: %', valor;
		soma := soma + valor;
	END LOOP;
	RAISE NOTICE 'Soma: %', soma;
END;
$$





-- --criando a tabela
-- CREATE TABLE tb_aluno (
-- 	cod_aluno SERIAL PRIMARY KEY,
-- 	nota INT
-- );
-- -- gerando dez notas e inserindo na tabela
-- DO
-- $$
-- BEGIN
-- ---geramos notas para 10 alunos
-- FOR i in 1..10 LOOP
-- INSERT INTO tb_aluno (nota) VALUES (valor_aleatorio_entre(0, 10));
-- END LOOP;
-- END;
-- $$
-- --verificando se tudo deu certo até agora
-- SELECT * FROM tb_aluno;
-- --calculando a média com um FOR
-- DO
-- $$
-- DECLARE
-- aluno RECORD;
-- media NUMERIC(10, 2) := 0;
-- total INT;
-- BEGIN
-- FOR aluno IN
-- SELECT * FROM tb_aluno
-- LOOP
-- RAISE NOTICE 'Nota: %', aluno.nota;
-- media := media + aluno.nota;
-- END LOOP;
-- SELECT COUNT(*) FROM tb_aluno INTO total;
-- RAISE NOTICE 'Média: %', media / total;
-- END;
-- $$



-- DO
-- $$
-- BEGIN
-- 	--repare como não precisamos declarar a variável i
-- 	-- de 1 a 10, pulando de um em um
-- 	RAISE NOTICE 'de 1 a 10, pulando de um em um';
-- 	FOR i IN 1..10 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
-- 	-- E agora? -- não mostra nada
-- 	RAISE NOTICE 'E agora?';
-- 	FOR i IN 10..1 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
-- 	-- de 10 a 1, pulando de um em um
-- 	--repare que, usando reverse, é preciso escrever 10..1 em vez de 1..10.
-- 	RAISE NOTICE 'de 10 a 1, pulando de um em um';
-- 	FOR i IN REVERSE 10..1 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
-- 	-- de 1 a 50, pulando de dois em dois
-- 	RAISE NOTICE 'de 1 a 50, pulando de dois em dois';
-- 	FOR i IN 1..50 BY 2 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
-- 	-- de 50 a 1, pulando de dois em dois
-- 	RAISE NOTICE 'de 50 a 1, pulando de dois em dois';
-- 	FOR i IN REVERSE 50..1 BY 2 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
-- END;
-- $$



-- DO
-- $$
-- DECLARE
-- 	nota INT;
-- 	media NUMERIC(10, 2) := 0;
-- 	contador INT := 0;
-- BEGIN
-- 	-- inicialmente, valores de 0 a 11
-- 	-- com o -1, temos valores de -1 a 10
-- 	SELECT valor_aleatorio_entre (0, 11) - 1 INTO nota;
-- 	WHILE nota >= 0 LOOP
-- 		RAISE NOTICE '%', nota;
-- 		media := media + nota;
-- 		contador := contador + 1;
-- 		SELECT valor_aleatorio_entre (0, 11) - 1 INTO nota;
-- 	END LOOP;
-- 	IF contador > 0 THEN
-- 		RAISE NOTICE 'Média %.', media / contador;
-- 	ELSE
-- 		RAISE NOTICE 'Nenhuma nota gerada.';
-- 	END IF;
-- END;
-- $$



-- DO
-- $$
-- DECLARE
-- 	i INT;
-- 	j INT;
-- BEGIN
-- 	i := 0;
-- 	<<externo>>
-- 	LOOP
-- 		i := i + 1;
-- 		EXIT WHEN i > 10;
-- 		j := 1;
-- 		<<interno>>
-- 		LOOP
-- 			RAISE NOTICE '% %', i, j;
-- 			j := j + 1;
-- 			EXIT WHEN j > 10;
-- 			-- j vai contar até 5, o loop interno vai ser interrompido e prosseguimos para a próxima iteração do loop externo
-- 			CONTINUE externo WHEN j > 5;
-- 		END LOOP;
-- 	END LOOP;
-- END;
-- $$




-- DO
-- $$
-- DECLARE
-- 	i INT;
-- 	j INT;
-- BEGIN
-- 	i := 0;
-- 	<<externo>>
-- 	LOOP
-- 		i := i + 1;
-- 		EXIT WHEN i > 10;
-- 		j := 1;
-- 		<<interno>>
-- 		LOOP
-- 			RAISE NOTICE '% %', i, j;
-- 			j := j + 1;
-- 			EXIT WHEN j > 10;
-- 			-- j vai contar até 5, o loop externo vai ser interrompido e o programa acaba
-- 			EXIT externo WHEN j > 5;
-- 		END LOOP;
-- 	END LOOP;
-- END;
-- $$




-- DO
-- $$
-- DECLARE
-- 	contador INT := 0;
-- BEGIN
-- 	LOOP
-- 		contador := contador + 1;
-- 		EXIT WHEN contador > 100;
-- 		-- ignorando iteração da vez quando contador for múltiplo de 7 com
-- --IF/CONTINUE
-- 		IF contador % 7 = 0 THEN
-- 			CONTINUE;
-- 		END IF;
-- 		--ignorando iteração da vez quando contador for múltiplo de 11 com
-- --CONTINUE WHEN
-- 		CONTINUE WHEN contador % 11 = 0;
-- 		RAISE NOTICE '%', contador;
-- 	END LOOP;
-- END;
-- $$





-- - Contando de 1 a 10
-- -- Saída com EXIT/WHEN
-- DO
-- $$
-- DECLARE
-- 	contador INT := 1;
-- BEGIN
-- 	LOOP
-- 	RAISE NOTICE '%', contador;
-- 	contador := contador + 1;
-- 	EXIT WHEN contador > 10;
-- 	END LOOP;
-- END;
-- $$






-- -- Contando de 1 a 10
-- -- Saída com IF/EXIT
-- DO
-- $$
-- DECLARE
-- 	contador INT := 1;
-- BEGIN
-- 	LOOP
-- 		RAISE NOTICE '%', contador;
-- 		contador := contador + 1;
-- 		IF contador > 10 THEN
-- 			EXIT;
-- 		END IF;
-- 	END LOOP;
-- END;$$






-- -- Observe como não é condição de continuidade
-- -- Estamos diante de um loop infinito
-- DO
-- $$
-- BEGIN
-- 	LOOP
-- 		RAISE NOTICE 'Teste loop simples...';
-- 	END LOOP;
-- END;
-- $$





-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- 	RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;
-- SELECT valor_aleatorio_entre (2, 10);






-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- 	RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;