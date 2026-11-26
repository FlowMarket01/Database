CREATE DATABASE flowmarket;
USE flowmarket;

CREATE TABLE usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_completo VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
senha VARCHAR(255) NOT NULL,
telefone CHAR(11) NOT NULL
);

CREATE TABLE porte_mercado(
id_porte INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL
);

CREATE TABLE mercado(
id_mercado INT PRIMARY KEY AUTO_INCREMENT,
cnpj CHAR(14) NOT NULL,
razao_social VARCHAR(200) NOT NULL,
nome_fantasia VARCHAR(100),
fk_porte_mercado INT,
fk_usuario INT,
FOREIGN KEY (fk_porte_mercado) REFERENCES porte_mercado(id_porte),
FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE caixa(
id_caixa INT AUTO_INCREMENT,
fk_mercado INT,
descricao VARCHAR(75) NOT NULL,
PRIMARY KEY(id_caixa, fk_mercado),
FOREIGN KEY (fk_mercado) REFERENCES mercado(id_mercado)
);

CREATE TABLE alerta(
id_alerta INT PRIMARY KEY AUTO_INCREMENT,
fk_caixa INT,
fk_mercado INT,
data_alerta DATE DEFAULT (CURDATE()),
duracao INT DEFAULT 0,
FOREIGN KEY (fk_caixa) REFERENCES caixa(id_caixa),
FOREIGN KEY (fk_mercado) REFERENCES caixa(fk_mercado)
);

CREATE TABLE regiao_fila(
id_regiao INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45) NOT NULL
);

CREATE TABLE status_sensor(
id_status INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45)
);

CREATE TABLE sensor(
id_sensor INT PRIMARY KEY AUTO_INCREMENT,
identificacao VARCHAR(150),
fk_status_sensor INT,
fk_regiao_fila INT,
fk_caixa INT,
fk_mercado INT,
FOREIGN KEY (fk_status_sensor) REFERENCES status_sensor(id_status),
FOREIGN KEY (fk_regiao_fila) REFERENCES regiao_fila(id_regiao),
FOREIGN KEY (fk_caixa) REFERENCES caixa(id_caixa),
FOREIGN KEY (fk_mercado) REFERENCES caixa(fk_mercado)
);

CREATE TABLE leitura(
id_leitura INT PRIMARY KEY AUTO_INCREMENT,
fk_sensor INT,
valor_leitura INT,
data_leitura DATETIME DEFAULT CURRENT_TIMESTAMP(),
FOREIGN KEY (fk_sensor) REFERENCES sensor(id_sensor)
);


INSERT INTO usuario(nome_completo, email, senha, telefone) VALUES 
("Antônio Cortez","antonio.cortez@gmail.com","jpnk_756d@13","55-07832154"),
("Maria das Graças","maria.graca1967@gmail.com","bssrhwf%4vf","55-18467308"),
("Gabriel Gomes","Gab_gomes@gmail.com","K#7xN!2wQ$9zL&4vM*1pB%8sT@5jF(","11-75090725"),
("Gustavo Almeida de Oliveira","Gustavo7_oliv@outlook.com","pR9$mX2!vK7*bZ5&qW1#fN4@tY8%jL_","11-27864321"),
("Ricardo da Silva Brito","Ricardo_silva@gmail.com","7zQ#2wN!9mX$4vL&1pB*8sT@5jF(3kX","19-13452750"),
("Giovanni vannuchi","Giovanni_vannuchi@gmail.com","tY8%jL6pQ9#mX2!vK7*bZ5&qW1$fN4@","55-07832153"); 

INSERT INTO porte_mercado(nome) VALUES 
("Grande"),
("Médio"),
("Pequeno");

INSERT INTO mercado (cnpj, nome_fantasia, razao_social, fk_usuario, fk_porte_mercado) VALUES 
("53303316000119", "Supermercado Sol e Mar", "Comércio de Alimentos Sol e Mar e Distribuidora de Produtos Hortifrutigranjeiros da Costa Litorânea Ltda.", 1, 1),
("30339128000145", "Hipermercado Preço Justo", "Preço Justo Hipermercados e Logística de Alimentos Perecíveis e Produtos de Limpeza Doméstica S.A.", 2, 2),
("77105916000130", "Minimercado do Bairro", "Minimercado e Mercearia do Bairro Conveniências, Panificação e Comércio de Bebidas em Geral Ltda.", 3, 3),
("85771856000113", "Rede Hortifruti Raízes", "Raízes Hortifruti e Comércio de Produtos Orgânicos, Naturais, Integrais e Suplementos Alimentares Eireli.", 4, 1),
("19451439000169", "Supermercado Vale Verde", "Vale Verde Supermercados, Açougue, Panificação e Comércio Atacadista de Alimentos do Vale Ltda.", 5, 2),
("66859327000121", "Atacadão Pague Menos", "Pague Menos Comércio Atacadista e Varejista de Gêneros Alimentares e Utilidades Domésticas S.A.", 6, 3);


INSERT INTO caixa (fk_mercado, descricao) VALUES
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

INSERT INTO regiao_fila(descricao) VALUES 
("Região 1"),
("Região 2"),
("Região 3");

INSERT INTO status_sensor(descricao) VALUES
("Ativo"),
("Inativo"),
("Em manutenção");

INSERT INTO sensor (identificacao, fk_status_sensor, fk_regiao_fila, fk_caixa, fk_mercado) VALUES 
("Sensor Caixa 1 - 1", 1, 1, 1, 1),
("Sensor Caixa 1 - 2", 1, 2, 1, 1),
("Sensor Caixa 1 - 3", 1, 3, 1, 1),
("Sensor Caixa 2 - 1", 3, 1, 2, 1),
("Sensor Caixa 2 - 2", 1, 2, 2, 1),
("Sensor Caixa 2 - 3", 1, 3, 2, 1);

INSERT INTO alerta (fk_caixa, fk_mercado, data_alerta, duracao) VALUES
(1, 1, DEFAULT, 5),
(1, 1, '2026-10-25', 10);

UPDATE alerta SET duracao = duracao + 5 WHERE id_alerta = 1;


INSERT INTO leitura (fk_sensor, valor_leitura, data_leitura) VALUES 
(1, 1, '2026-06-01 08:30:00'),
(1, 0, '2026-06-01 08:35:00'),
(2, 1, '2026-06-01 08:40:00'),
(2, 1, '2026-06-01 08:45:00'),
(3, 0, '2026-06-01 08:50:00'),
(3, 1, '2026-06-01 08:55:00'),
(4, 0, '2026-06-01 09:00:00'),
(4, 1, '2026-06-01 09:05:00'),
(5, 1, '2026-06-01 09:10:00'),
(5, 0, '2026-06-01 09:15:00'),
(6, 0, '2026-06-01 09:20:00'),
(6, 1, '2026-06-01 09:25:00');
