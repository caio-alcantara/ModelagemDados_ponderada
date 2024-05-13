CREATE TABLE usuarios (
 id_usuario BIGSERIAL,
 nome VARCHAR(20) NOT NULL,
 idade INTEGER NOT NULL,
 email VARCHAR(20) NOT NULL,
 senha VARCHAR(50) NOT NULL,
 horas_totais INTEGER,
 cidade VARCHAR(20) NOT NULL,
 genero VARCHAR(20) NOT NULL
);


ALTER TABLE usuarios ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
ALTER TABLE usuarios ADD CONSTRAINT usuarios_pkey KEY ();

CREATE TABLE convite_para_projeto (
 id_convite BIGSERIAL NOT NULL,
 id_usuario_envia INTEGER,
 id_usuario_recebe INTEGER,
 id_acao INTEGER,
 status VARCHAR(20) NOT NULL,
 descricao VARCHAR(200) NOT NULL,
 data_envio DATE NOT NULL
);


ALTER TABLE convite_para_projeto ADD CONSTRAINT convite_para_projeto_pkey PRIMARY KEY (id_convite);

CREATE TABLE acoes (
 id_acao BIGSERIAL,
 nome VARCHAR(50) NOT NULL,
 descricao VARCHAR(200) NOT NULL,
 regiao VARCHAR(50) NOT NULL,
 qtd_vagas INTEGER NOT NULL,
 data_inicio DATE NOT NULL,
 data_fim DATE NOT NULL,
 horas_requeridas INTEGER NOT NULL
);


ALTER TABLE acoes ADD CONSTRAINT acoes_pkey PRIMARY KEY (id_acao);

CREATE TABLE usuario_por_acao (
 id_usuario INTEGER NOT NULL,
 id_acao INTEGER NOT NULL,
 funcao CHAR(20) NOT NULL,
 data_entrada DATE NOT NULL,
 data_saida DATE
);


ALTER TABLE usuario_por_acao ADD CONSTRAINT usuario_por_acao_pkey PRIMARY KEY ();

CREATE TABLE acao_realizada (
 id_acao_realizada BIGSERIAL,
 id_usuario INTEGER NOT NULL,
 titulo VARCHAR(50) NOT NULL,
 descricao VARCHAR(200),
 ano_de_atuacao DATE NOT NULL,
 horas_trabalhadas_na_acao INTEGER NOT NULL
);


ALTER TABLE acao_realizada ADD CONSTRAINT acao_realizada_pkey PRIMARY KEY (id_acao_realizada);

ALTER TABLE convite_para_projeto ADD CONSTRAINT convite_para_projeto_id_usuario_envia_fkey FOREIGN KEY (id_usuario_envia) REFERENCES usuarios(id_usuario);
ALTER TABLE convite_para_projeto ADD CONSTRAINT convite_para_projeto_id_usuario_recebe_fkey FOREIGN KEY (id_usuario_recebe) REFERENCES usuarios(id_usuario);
ALTER TABLE convite_para_projeto ADD CONSTRAINT convite_para_projeto_id_acao_fkey FOREIGN KEY (id_acao) REFERENCES acoes(id_acao);
ALTER TABLE usuario_por_acao ADD CONSTRAINT usuario_por_acao_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuario_por_acao ADD CONSTRAINT usuario_por_acao_id_acao_fkey FOREIGN KEY (id_acao) REFERENCES acoes(id_acao);
ALTER TABLE acao_realizada ADD CONSTRAINT acao_realizada_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);