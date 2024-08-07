CREATE TABLE `ped_dados_gerais` (
  `numero_pedido` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` TIMESTAMP(6) NULL DEFAULT NULL,
  `codigo_cliente` INTEGER(11) DEFAULT NULL,
  `valor_total` DECIMAL(12,2) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`numero_pedido`),
  KEY `ped_dados_gerais_idx1` USING BTREE (`numero_pedido`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci';