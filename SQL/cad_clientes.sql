CREATE TABLE `cad_clientes` (
  `codigo` INTEGER(11) NOT NULL,
  `nome` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `cidade` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `uf` VARCHAR(2) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`codigo`),
  KEY `clientes_idx1` USING BTREE (`codigo`),
  KEY `clientes_idx2` USING BTREE (`nome`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci';