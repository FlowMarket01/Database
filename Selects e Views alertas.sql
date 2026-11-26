CREATE VIEW alertas AS
SELECT caixa.descricao, data_alerta AS 'data', SUM(duracao) AS 'duracao', caixa.fk_mercado AS 'mercado'
FROM caixa 
JOIN alerta ON fk_caixa = caixa.id_caixa 
GROUP BY caixa.fk_mercado, caixa.descricao, data_alerta;

SELECT * FROM alerta;

SELECT * FROM alertas WHERE mercado = 1;

DROP VIEW alertas;


