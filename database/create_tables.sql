-- Criação da tabela Cliente
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Criação da tabela Barbeiro
CREATE TABLE Barbeiro (
    id_barbeiro SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criação da tabela Servico
CREATE TABLE Servico (
    id_servico SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    duracao_estimada INT NOT NULL -- Duração em minutos
);

-- Criação da tabela Agendamento
CREATE TABLE Agendamento (
    id_agendamento SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_barbeiro INT NOT NULL,
    id_servico INT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente',
    
    -- Definição das Chaves Estrangeiras (Relacionamentos)
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE,
    CONSTRAINT fk_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES Barbeiro(id_barbeiro) ON DELETE CASCADE,
    CONSTRAINT fk_servico FOREIGN KEY (id_servico) REFERENCES Servico(id_servico) ON DELETE CASCADE
);
