CREATE DATABASE flowmarket;
USE flowmarket;

CREATE TABLE usuario (
    idUsuario     INT PRIMARY KEY AUTO_INCREMENT,
    nomeCompleto  VARCHAR(150) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    senha         VARCHAR(255) NOT NULL, 
    telefone      VARCHAR(11),
    Data_nasc     date
);
INSERT INTO USUARIO(nomeCompleto,email,senha,telefone,Data_nasc) VALUES 
("Antônio Cortez","antonio.cortez@gmail.com","jpnk_756d@13","55-07832154","1989-09-12"),
("Maria das Graças","maria.graca1967@gmail.com","bssrhwf%4vf","55-18467308","1967-04-25"),
("Gabriel Gomes","Gab_gomes@gmail.com","K#7xN!2wQ$9zL&4vM*1pB%8sT@5jF(","11-75090725","1989-11-20"),
("Gustavo Almeida de Oliveira","Gustavo7_oliv@outlook.com","pR9$mX2!vK7*bZ5&qW1#fN4@tY8%jL_","11-27864321","1990-06-27"),
("Ricardo da Silva Brito","Ricardo_silva@gmail.com","7zQ#2wN!9mX$4vL&1pB*8sT@5jF(3kX","19-13452750","1997-08-26"),
("Giovanni vannuchi","Giovanni_vannuchi@gmail.com","tY8%jL6pQ9#mX2!vK7*bZ5&qW1$fN4@","55-07832153","2000-10-13"); 

CREATE TABLE mercado (
    idMercado     INT PRIMARY KEY AUTO_INCREMENT,
    cnpj          CHAR(14) UNIQUE NOT NULL,
    Nome_mercado  VARCHAR(255),
    razaoSocial   VARCHAR(150) NOT NULL,
    fk_idUsuario  INT NOT NULL,
    CONSTRAINT ctFkUsuario FOREIGN KEY (fk_idUsuario) REFERENCES usuario(idUsuario)
);
INSERT INTO mercado (cnpj, Nome_mercado, razaoSocial, fk_idUsuario) VALUES 
("53303316000119", "Supermercado Sol e Mar", "Comércio de Alimentos Sol e Mar e Distribuidora de Produtos Hortifrutigranjeiros da Costa Litorânea Ltda.", 1),
("30339128000145", "Hipermercado Preço Justo", "Preço Justo Hipermercados e Logística de Alimentos Perecíveis e Produtos de Limpeza Doméstica S.A.", 2),
("77105916000130", "Minimercado do Bairro", "Minimercado e Mercearia do Bairro Conveniências, Panificação e Comércio de Bebidas em Geral Ltda.", 3),
("85771856000113", "Rede Hortifruti Raízes", "Raízes Hortifruti e Comércio de Produtos Orgânicos, Naturais, Integrais e Suplementos Alimentares Eireli.", 4),
("19451439000169", "Supermercado Vale Verde", "Vale Verde Supermercados, Açougue, Panificação e Comércio Atacadista de Alimentos do Vale Ltda.", 5),
("66859327000121", "Atacadão Pague Menos", "Pague Menos Comércio Atacadista e Varejista de Gêneros Alimentares e Utilidades Domésticas S.A.", 6);


CREATE TABLE caixa (
    idCaixa       INT PRIMARY KEY AUTO_INCREMENT,
    fk_idMercado     INT NOT NULL,
    identificacao VARCHAR(100) NOT NULL, -- caixa 1 ou caixa 2 etc.
    CONSTRAINT ctFkCaixa FOREIGN KEY (fk_idMercado) REFERENCES mercado(idMercado)
);

INSERT INTO caixa (fk_idMercado, identificacao) VALUES
(1, 'caixa-1 frente de loja'),
(1, 'caixa-2 frente de loja'),
(1, 'caixa-3 atendimento idoso'),
(1, 'caixa-4 express ate 15 itens'),
(1, 'caixa-5 retirada clique e retire'),

(2, 'caixa-1 frente de loja'),
(2, 'caixa-2 frente de loja'),
(2, 'caixa-3 self-checkout'),
(2, 'caixa-4 self-checkout'),
(2, 'caixa-5 eletrodomesticos'),

(3, 'caixa-1 mercearia'),
(3, 'caixa-2 padaria'),
(3, 'caixa-3 açougue'),
(3, 'caixa-4 atendimento idoso'),
(3, 'caixa-5 entregas delivery'),

(4, 'caixa-1 hortifruti'),
(4, 'caixa-2 lanchonete e sucos'),
(4, 'caixa-3 produtos organicos'),
(4, 'caixa-4 self-checkout'),
(4, 'caixa-5 trocas e devoluções'),

(5, 'caixa-1 frente de loja'),
(5, 'caixa-2 adega e vinhos'),
(5, 'caixa-3 atendimento gestante'),
(5, 'caixa-4 rotisseria'),
(5, 'caixa-5 e-commerce'),

(6, 'caixa-1 atacado e pallets'),
(6, 'caixa-2 atacado e pallets'),
(6, 'caixa-3 exclusivo cnpj'),
(6, 'caixa-4 atendimento idoso'),
(6, 'caixa-5 separação ifood');

CREATE TABLE corredor (
    idCorredor    INT PRIMARY KEY AUTO_INCREMENT,
    fk_idMercado     INT NOT NULL,
    identificacao VARCHAR(100) NOT NULL,
    CONSTRAINT ctFkMercado FOREIGN KEY (fk_idMercado) REFERENCES mercado(idMercado)
);
INSERT INTO corredor (fk_idMercado, identificacao) VALUES
(1, 'corredor-1 mercearia e enlatados'),
(1, 'corredor-2 bebidas e refrigerantes'),
(1, 'corredor-3 limpeza e higiene'),
(1, 'corredor-4 biscoitos e salgadinhos'),
(1, 'corredor-5 utilidades domesticas'),

(2, 'corredor-1 arroz feijao e oleo'),
(2, 'corredor-2 matinais e cereais'),
(2, 'corredor-3 pet shop'),
(2, 'corredor-4 perfumaria e cosmeticos'),
(2, 'corredor-5 bazar e automotivo'),

(3, 'corredor-1 massas e molhos'),
(3, 'corredor-2 condimentos e temperos'),
(3, 'corredor-3 matinais e café'),
(3, 'corredor-4 doces e guloseimas'),
(3, 'corredor-5 artigos para festa'),

(4, 'corredor-1 frutas frescas'),
(4, 'corredor-2 legumes e verduras'),
(4, 'corredor-3 graos e sementes granel'),
(4, 'corredor-4 produtos naturais'),
(4, 'corredor-5 ovos e laticinios'),

(5, 'corredor-1 vinhos e destilados'),
(5, 'corredor-2 queijos e frios'),
(5, 'corredor-3 congelados e sorvetes'),
(5, 'corredor-4 massas frescas'),

(5, 'corredor-5 importados e bomboniere'),
(6, 'corredor-1 fardos de alimentos'),
(6, 'corredor-2 embalagens industriais'),
(6, 'corredor-3 descartaveis e utilidades'),
(6, 'corredor-4 bomboniere atacado'),
(6, 'corredor-5 higiene atacado');


-- sensor: pertence OU a uma regiao de caixa OU a um ponto de
-- acesso de corredor nunca aos dois, nunca a nenhum dos dois

CREATE TABLE sensor (
    idSensor      INT PRIMARY KEY AUTO_INCREMENT,
    identificacao VARCHAR(100) NOT NULL,
    fk_idMercado     INT NOT NULL,
    fk_idCaixa       INT NULL,
    fk_idCorredor    INT NULL,
    regiao           INT NULL,   -- 1, 2 ou 3 só quando fk_idCaixa não é nulo
    CONSTRAINT ct_FkMercado FOREIGN KEY (fk_idMercado) REFERENCES mercado(idMercado),
    CONSTRAINT ct_FkCaixa FOREIGN KEY (fk_idCaixa) REFERENCES caixa(idCaixa),
    CONSTRAINT ctFkCorredor FOREIGN KEY (fk_idCorredor) REFERENCES corredor(idCorredor),
    CONSTRAINT chkSensorPertence CHECK (
        (fk_idCaixa IS NOT NULL AND fk_idCorredor IS NULL
            AND regiao IS NOT NULL)
        OR
        (fk_idCorredor IS NOT NULL AND fk_idCaixa IS NULL
        AND regiao IS NULL)
    ),
    CONSTRAINT chkRegiaoValida CHECK (regiao IS NULL OR regiao IN (1,2,3))
);

INSERT INTO sensor (identificacao, fk_idMercado, fk_idCaixa, fk_idCorredor, regiao) VALUES 
("Sensor Caixa 1", 1, 1, NULL, 1),
("Sensor Caixa 2", 1, 2, NULL, 2),
("Sensor Caixa Preço Justo 1", 2, 6, NULL, 1),
("Sensor Caixa Preço Justo 2", 2, 7, NULL, 3),
("Sensor Minimercado Padaria", 3, 12, NULL, 2),
("Sensor Hortifruti Caixa 1", 4, 16, NULL, 1),
("Sensor Vale Verde Adega", 5, 22, NULL, 2),
("Sensor Atacadão Pallets", 6, 26, NULL, 1),
("Sensor Corredor Mercearia", 1, NULL, 1, NULL),
("Sensor Corredor Bebidas", 1, NULL, 2, NULL);


-- leituraCorredor: amostragem periódica de presença por sensor de corredor 
CREATE TABLE leituraCorredor (
    idLeitura     INT PRIMARY KEY AUTO_INCREMENT,
    fk_idSensor   INT NOT NULL,
    presenca      INT(1) NOT NULL ,   -- 0 ou 1
    dataLeitura   DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ctFkSensor FOREIGN KEY (fk_idSensor) REFERENCES sensor(idSensor)
);
INSERT INTO leituraCorredor (fk_idSensor, presenca, dataLeitura) VALUES 
(9, 1, '2026-06-01 08:30:00'),
(9, 0, '2026-06-01 08:35:00'),
(10, 1, '2026-06-01 08:40:00'),
(10, 1, '2026-06-01 08:45:00'),
(9, 0, '2026-06-01 08:50:00'),
(10, 0, '2026-06-01 08:55:00'),
(9, 1, '2026-06-01 09:00:00'),
(10, 1, '2026-06-01 09:05:00'),
(9, 1, '2026-06-01 09:10:00'),
(10, 0, '2026-06-01 09:15:00');
-- leituraRegiaoFila: dado bruto de cada um dos 3 sensores por caixa 
CREATE TABLE leituraRegiaoFila (
    idLeitura     INT PRIMARY KEY AUTO_INCREMENT,
    fk_idSensor   INT NOT NULL,
    presenca      INT(1) NOT NULL,
    dataLeitura   DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ct_Fk_Sensor FOREIGN KEY (fk_idSensor) REFERENCES sensor(idSensor)
);
INSERT INTO leituraRegiaoFila (fk_idSensor, presenca, dataLeitura) VALUES 
(1, 1, '2026-06-01 08:30:00'),
(1, 0, '2026-06-01 08:35:00'),
(2, 1, '2026-06-01 08:40:00'),
(2, 1, '2026-06-01 08:45:00'),
(3, 0, '2026-06-01 08:50:00'),
(3, 1, '2026-06-01 08:55:00'),
(4, 0, '2026-06-01 09:00:00'),
(4, 1, '2026-06-01 09:05:00'),
(5, 1, '2026-06-01 09:10:00'),
(5, 0, '2026-06-01 09:15:00');
-- estadoFila: tabela DERIVADA — calculada a partir das leituras
-- das 3 regioes de uma caixa. Guarda quando cada nível começou
-- e terminou, pra responder "duração", o que não
-- dá pra fazer só com leituras brutas.
-- Regra: regiao 1 ocupada = vazio; 1+2 = moderado; 1+2+3 = cheio
CREATE TABLE estadoFila (
    idEstado      INT PRIMARY KEY AUTO_INCREMENT,
    idCaixa       INT NOT NULL,
    nivel         VARCHAR(100) NOT NULL,
    inicio        DATETIME NOT NULL,
    fim           DATETIME NULL,   -- nulo enquanto o nível está ativo
    FOREIGN KEY (idCaixa) REFERENCES caixa(idCaixa),
    CONSTRAINT chkFimAposInicio CHECK (fim IS NULL OR fim >= inicio),
    CONSTRAINT chkNivel check (nivel in ("vazio","moderado","cheio"))
);
INSERT INTO estadoFila (idCaixa, nivel, inicio, fim) VALUES 
(1, 'vazio', '2026-06-01 08:30:00', '2026-06-01 08:35:00'),
(1, 'moderado', '2026-06-01 08:40:00', '2026-06-01 08:45:00'),
(2, 'vazio', '2026-06-01 08:50:00', '2026-06-01 08:55:00'),
(2, 'moderado', '2026-06-01 09:00:00', '2026-06-01 09:05:00'),
(1, 'cheio', '2026-06-01 09:10:00', '2026-06-01 09:15:00'),
(3, 'vazio', '2026-06-01 09:20:00', '2026-06-01 09:25:00'),
(3, 'moderado', '2026-06-01 09:30:00', '2026-06-01 09:35:00'),
(4, 'cheio', '2026-06-01 09:40:00', '2026-06-01 09:45:00'),
(5, 'vazio', '2026-06-01 09:50:00', '2026-06-01 09:55:00'),
(5, 'moderado', '2026-06-01 10:00:00', NULL);


SELECT 
estadoFila.idCaixa, 
caixa.identificacao, 
estadoFila.nivel,
CASE
WHEN nivel = "cheio" THEN concat(caixa.identificacao," ", estadoFila.nivel,
 ' com alto número de clientes. Recomendamos distribuir para o ', 
  (SELECT caixa2.identificacao 
 FROM estadoFila AS estadoFila2 
 JOIN caixa AS caixa2 
 ON estadoFila2.idCaixa = caixa2.idCaixa 
 WHERE estadoFila2.nivel = "vazio" AND estadoFila2.inicio > '2026-06-01 09:39:00'))
ELSE NULL
end as ALERTA
FROM estadoFila
JOIN caixa
ON estadoFila.idCaixa = caixa.idCaixa
WHERE estadoFila.inicio > '2026-06-01 09:39:0'; -- está na dash grafico inferior direito (caixa)

SELECT 
MIN(dataLeitura) 'Início',
MAX(dataLeitura) 'Fim do período',
COUNT(*) AS 'Movimentação na linha de caixas',
CASE 
WHEN COUNT(*) > 5 THEN 'movimento acima da média'
WHEN COUNT(*) > 4 THEN 'movimento médio'
ELSE 'Movimento lento'
END 'Análise do período'
FROM leituraRegiaoFila
<<<<<<< HEAD
WHERE presenca <> 0;
-- FAZER SELECT DO número individual por caixas 
-- linha cinza
=======
WHERE presenca <> 0; -- não consegui encontrar na dash 

>>>>>>> dd3e5929b4c2652140db81392d0f882ae1e53607
SELECT
 concat(AVG(presenca), corredor.identificacao) AS "Movimentação média"
FROM leituraCorredor 
join sensor 
ON leituraCorredor.fk_idSensor = sensor.idSensor 
JOIN corredor
ON sensor.fk_idCorredor = corredor.idCorredor
WHERE fk_idSensor = "9";  -- está na dash mas a concatenação está incorreta (corredor)


  SELECT 
AVG(presenca) AS "Movimentação média", 
corredor.identificacao AS 'Corredor'
FROM leituraCorredor 
JOIN sensor ON leituraCorredor.fk_idSensor = sensor.idSensor 
JOIN corredor ON sensor.fk_idCorredor = corredor.idCorredor 
<<<<<<< HEAD
WHERE fk_idSensor = "9";
-- linha cinza
=======
WHERE fk_idSensor = "9"; -- precisa ser discutido média não se encaixa no contexto da dash 
>>>>>>> dd3e5929b4c2652140db81392d0f882ae1e53607

SELECT 
corredor.identificacao AS corredor,
count(*) AS "total de movimentação",
MIN(dataLeitura) AS 'Primeira movimentação detectada',
MAX(dataLeitura) AS 'Última movimentação detectada' 
FROM leituraCorredor
JOIN sensor
 ON leituraCorredor.fk_idSensor = sensor.idSensor
 JOIN corredor 
 ON sensor.fk_idCorredor = corredor.idCorredor
<<<<<<< HEAD
WHERE presenca <> 0 AND fk_idSensor = '10';

=======
WHERE presenca <> 0 AND fk_idSensor = '10'; -- está na dash grafico superior direito (corredor)
>>>>>>> dd3e5929b4c2652140db81392d0f882ae1e53607
