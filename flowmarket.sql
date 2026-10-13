CREATE DATABASE flowmarket;
USE flowmarket;

CREATE TABLE usuario (
    idUsuario     INT PRIMARY KEY AUTO_INCREMENT,
    nomeCompleto  VARCHAR(150) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    senha         VARCHAR(255) NOT NULL, 
    telefone      VARCHAR(11)
);

CREATE TABLE mercado (
    idMercado     INT PRIMARY KEY AUTO_INCREMENT,
    cnpj          CHAR(14) UNIQUE NOT NULL,
    razaoSocial   VARCHAR(150) NOT NULL,
    fk_idUsuario     INT NOT NULL,
    CONSTRAINT ctFkUsuario FOREIGN KEY (fk_idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE caixa (
    idCaixa       INT PRIMARY KEY AUTO_INCREMENT,
    fk_idMercado     INT NOT NULL,
    identificacao VARCHAR(100) NOT NULL,
    CONSTRAINT ctFkCaixa FOREIGN KEY (fk_idMercado) REFERENCES mercado(idMercado)
);

CREATE TABLE corredor (
    idCorredor    INT PRIMARY KEY AUTO_INCREMENT,
    fk_idMercado     INT NOT NULL,
    identificacao VARCHAR(100) NOT NULL,
    CONSTRAINT ctFkMercado FOREIGN KEY (fk_idMercado) REFERENCES mercado(idMercado)
);

-- sensor: pertence OU a uma regiao de caixa OU a um ponto de
-- acesso de corredor nunca aos dois, nunca a nenhum dos dois

CREATE TABLE sensor (
    idSensor      INT PRIMARY KEY AUTO_INCREMENT,
    identificacao VARCHAR(100) NOT NULL,
    fk_idMercado     INT NOT NULL,
    fk_idCaixa       INT NULL,
    fk_idCorredor    INT NULL,
    regiao        TINYINT NULL,   -- 1, 2 ou 3 só quando fk_idCaixa não é nulo
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

-- leituraCorredor: amostragem periódica de presença por sensor de corredor 
CREATE TABLE leituraCorredor (
    idLeitura     INT PRIMARY KEY AUTO_INCREMENT,
    fk_idSensor      INT NOT NULL,
    presenca      TINYINT(1) NOT NULL ,   -- 0 ou 1
    dataLeitura   DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ctFkSensor FOREIGN KEY (fk_idSensor) REFERENCES sensor(idSensor)
);

-- leituraRegiaoFila: dado bruto de cada um dos 3 sensores por caixa 
CREATE TABLE leituraRegiaoFila (
    idLeitura     INT PRIMARY KEY AUTO_INCREMENT,
    fk_idSensor      INT NOT NULL,
    presenca      TINYINT(1) NOT NULL,
    dataLeitura   DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ct_Fk_Sensor FOREIGN KEY (fk_idSensor) REFERENCES sensor(idSensor)
);

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
