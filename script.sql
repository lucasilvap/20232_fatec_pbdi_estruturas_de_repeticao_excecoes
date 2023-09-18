-- Observe como não é condição de continuidade
-- Estamos diante de um loop infinito
DO
$$
BEGIN
	LOOP
		RAISE NOTICE 'Teste loop simples...';
	END LOOP;
END;
$$





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