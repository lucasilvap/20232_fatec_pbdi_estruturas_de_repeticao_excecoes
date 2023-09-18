DO
$$
DECLARE
	i INT;
	j INT;
BEGIN
	i := 0;
	<<externo>>
	LOOP
		i := i + 1;
		EXIT WHEN i > 10;
		j := 1;
		<<interno>>
		LOOP
			RAISE NOTICE '% %', i, j;
			j := j + 1;
			EXIT WHEN j > 10;
			-- j vai contar até 5, o loop externo vai ser interrompido e o programa acaba
			EXIT externo WHEN j > 5;
		END LOOP;
	END LOOP;
END;
$$




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