CREATE TABLE `cad_produtos` (
  `codigo` INTEGER(11) NOT NULL,
  `descricao` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `preco_venda` DECIMAL(12,2) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`codigo`),
  KEY `produtos_idx1` USING BTREE (`codigo`),
  KEY `produtos_idx2` USING BTREE (`descricao`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci';