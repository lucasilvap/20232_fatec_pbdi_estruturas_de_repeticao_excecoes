- Contando de 1 a 10
-- Saída com EXIT/WHEN
DO
$$
DECLARE
	contador INT := 1;
BEGIN
	LOOP
	RAISE NOTICE '%', contador;
	contador := contador + 1;
	EXIT WHEN contador > 10;
	END LOOP;
END;
$$






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