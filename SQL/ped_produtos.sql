CREATE TABLE `ped_produtos` (
  `id_autoinc` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` INTEGER(11) NOT NULL,
  `codigo_produto` INTEGER(11) DEFAULT NULL,
  `quantidade` INTEGER(11) DEFAULT NULL,
  `valor_unitario` DECIMAL(12,2) DEFAULT NULL,
  `valor_total` DECIMAL(12,2) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id_autoinc`),
  KEY `ped_produtos_fk1` USING BTREE (`numero_pedido`),
  CONSTRAINT `ped_produtos_fk1` FOREIGN KEY (`numero_pedido`) REFERENCES `ped_dados_gerais` (`numero_pedido`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci';