-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.6-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla zgintegral.sf_guard_forgot_password
DROP TABLE IF EXISTS `sf_guard_forgot_password`;
CREATE TABLE IF NOT EXISTS `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_forgot_password: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_forgot_password` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_group
DROP TABLE IF EXISTS `sf_guard_group`;
CREATE TABLE IF NOT EXISTS `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_group: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_group` DISABLE KEYS */;
INSERT INTO `sf_guard_group` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'SuperAdmin', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 'advanced', 'Administrador(a)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 'basic', 'Usuario(a)', '2020-12-19 21:22:54', '2020-12-19 21:22:54');
/*!40000 ALTER TABLE `sf_guard_group` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_group_permission
DROP TABLE IF EXISTS `sf_guard_group_permission`;
CREATE TABLE IF NOT EXISTS `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_group_permission: ~91 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_group_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_group_permission` (`group_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 2, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 3, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 4, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 5, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 6, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 7, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 8, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 9, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 10, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 11, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 12, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 13, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 14, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 15, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 16, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 17, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 18, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 19, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 20, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 21, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 22, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 23, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 24, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 25, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 26, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 27, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 28, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 29, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 30, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 31, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 32, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 33, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(1, 34, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 3, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 4, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 8, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 9, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 10, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 11, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 12, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 13, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 14, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 15, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 16, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 17, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 18, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 19, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 20, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 21, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 22, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 23, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 24, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 25, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 26, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 27, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 28, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 29, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 30, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 31, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 32, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 33, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 34, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 8, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 16, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 35, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 36, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 37, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 38, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 39, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 40, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 41, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 42, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 43, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 44, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 45, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 46, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 47, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 48, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 49, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 50, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 51, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 52, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 53, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 54, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 55, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 56, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 57, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 58, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 59, '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 60, '2020-12-19 21:22:54', '2020-12-19 21:22:54');
/*!40000 ALTER TABLE `sf_guard_group_permission` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_login_attempt
DROP TABLE IF EXISTS `sf_guard_login_attempt`;
CREATE TABLE IF NOT EXISTS `sf_guard_login_attempt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) DEFAULT NULL,
  `host_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_login_attempt: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_login_attempt` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_permission
DROP TABLE IF EXISTS `sf_guard_permission`;
CREATE TABLE IF NOT EXISTS `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_permission: ~122 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'manageconfiguration', 'Administrar configuracion global', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(2, 'managemodule', 'Administrar módulos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(3, 'manageuser', 'Administrar usuarios', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(4, 'manageperson', 'Administrar personas', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(5, 'managelog', 'Administrar trazas', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(6, 'managefiles', 'Administrar archivos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(7, 'managecharts', 'Administrar graficos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(8, 'managecalendar', 'Administrar calendario', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(9, 'managecontacttype', 'Administrar tipos de contacto', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(10, 'manageaccount', 'Administrar cuentas', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(11, 'managecomprobant', 'Administrar comprobantes', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(12, 'managecostcenter', 'Administrar negocio', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(13, 'manageelement', 'Administrar elementos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(14, 'manageum', 'Administrar unidades de medida', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(15, 'managecurrency', 'Administrar monedas', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(16, 'managetransaction', 'Administrar balances', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(17, 'manageentity', 'Administrar entidades', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(18, 'managenationality', 'Administrar nacionalidades', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(19, 'managepaymentinstrument', 'Administrar instrumentos de pago', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(20, 'manageformat', 'Administrar formatos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(21, 'managearea', 'Administrar áreas', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(22, 'managecontractstatus', 'Administrar estados de contrato', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(23, 'managereclamationstatus', 'Administrar estados de contrato', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(24, 'manageactivity', 'Administrar actividades', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(25, 'managereminder', 'Administrar recordatorios', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(26, 'managelocation', 'Administrar localizaciones', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(27, 'manageentitytype', 'Administrar tipos de entidad', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(28, 'managedocumenttype', 'Administrar tipos de documentos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(29, 'managereclamationtype', 'Administrar tipos de reclamación', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(30, 'managecontracttype', 'Administrar tipos de contrato', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(31, 'manageposition', 'Administrar cargos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(32, 'managecontract', 'Administrar contrato', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(33, 'managetax', 'Administrar impuestos', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(34, 'manageinvoice', 'Administrar facturas', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(35, 'manageaccountadd', 'Administrar cuentas (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(36, 'managecomprobantadd', 'Administrar comprobantes (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(37, 'managecostcenteradd', 'Administrar negocio (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(38, 'manageelementadd', 'Administrar elementos (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(39, 'manageumadd', 'Administrar unidades de medida (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(40, 'managecurrencyadd', 'Administrar monedas (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(41, 'manageentityadd', 'Administrar entidades (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(42, 'managenationalityadd', 'Administrar nacionalidades (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(43, 'managepaymentinstrumentadd', 'Administrar instrumentos de pago (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(44, 'manageformatadd', 'Administrar formatos (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(45, 'managepersonadd', 'Administrar personas (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(46, 'manageareaadd', 'Administrar áreas (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(47, 'managecontractstatusadd', 'Administrar estados de contrato (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(48, 'managereclamationstatusadd', 'Administrar estados de contrato (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(49, 'managecontacttypeadd', 'Administrar tipos de contacto (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(50, 'manageactivityadd', 'Administrar actividades (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(51, 'managereminderadd', 'Administrar recordatorios (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(52, 'managelocationadd', 'Administrar localizaciones (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(53, 'manageentitytypeadd', 'Administrar tipos de entidad (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(54, 'managedocumenttypeadd', 'Administrar tipos de documentos (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(55, 'managereclamationtypeadd', 'Administrar tipos de reclamación (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(56, 'managecontracttypeadd', 'Administrar tipos de contrato (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(57, 'managepositionadd', 'Administrar cargos (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(58, 'managecontractadd', 'Administrar contrato (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(59, 'managetaxadd', 'Administrar impuestos (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(60, 'manageinvoiceadd', 'Administrar facturas (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(61, 'managemoduleadd', 'Administrar módulos (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(62, 'managemoduleedit', 'Administrar módulos (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(63, 'managemoduledelete', 'Administrar módulos (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(64, 'manageuseradd', 'Administrar usuarios (adicionar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(65, 'manageuseredit', 'Administrar usuarios (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(66, 'manageuserdelete', 'Administrar usuarios (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(67, 'managecontacttypeedit', 'Administrar tipos de contacto (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(68, 'managecontacttypedelete', 'Administrar tipos de contacto (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(69, 'managepaymentinstrumentedit', 'Administrar instrumentos de pago (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(70, 'managepaymentinstrumentdelete', 'Administrar instrumentos de pago (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(71, 'managereclamationtypeedit', 'Administrar tipos de reclamación (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(72, 'managereclamationtypedelete', 'Administrar tipos de reclamación (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(73, 'managecontracttypeedit', 'Administrar tipos de contrato (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(74, 'managecontracttypedelete', 'Administrar tipos de contrato (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(75, 'managecurrencyedit', 'Administrar monedas (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(76, 'managecurrencydelete', 'Administrar monedas (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(77, 'manageumedit', 'Administrar unidades de medida (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(78, 'manageumdelete', 'Administrar unidades de medida (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(79, 'manageaccountedit', 'Administrar cuentas (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(80, 'manageaccountdelete', 'Administrar cuentas (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(81, 'manageaccountsplit', 'Aperturar cuentas para análisis', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(82, 'manageaccountconsolidate', 'Consolidar saldos de cuentas', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(83, 'managecomprobantedit', 'Administrar comprobantes (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(84, 'managecomprobantdelete', 'Administrar comprobantes (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(85, 'managecostcenteredit', 'Administrar negocio (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(86, 'managecostcenterdelete', 'Administrar negocio (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(87, 'manageelementedit', 'Administrar elementos (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(88, 'manageelementdelete', 'Administrar elementos (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(89, 'manageentityedit', 'Administrar entidades (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(90, 'manageentitydelete', 'Administrar entidades (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(91, 'managelocationedit', 'Administrar localizaciones (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(92, 'managelocationdelete', 'Administrar localizaciones (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(93, 'manageentitytypeedit', 'Administrar tipos de entidad (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(94, 'manageentitytypedelete', 'Administrar tipos de entidad (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(95, 'manageactivityedit', 'Administrar actividades (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(96, 'manageactivitydelete', 'Administrar actividades (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(97, 'managedocumenttypeedit', 'Administrar tipos de documentos (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(98, 'managedocumenttypedelete', 'Administrar tipos de documentos (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(99, 'managenationalityedit', 'Administrar nacionalidades (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(100, 'managenationalitydelete', 'Administrar nacionalidades (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(101, 'managepositionedit', 'Administrar cargos (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(102, 'managepositiondelete', 'Administrar cargos (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(103, 'managecontractedit', 'Administrar contrato (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(104, 'managecontractdelete', 'Administrar contrato (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(105, 'managecontractstatusedit', 'Administrar estados de contrato (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(106, 'managecontractstatusdelete', 'Administrar estados de contrato (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(107, 'managereclamationstatusedit', 'Administrar estados de contrato (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(108, 'managereclamationstatusdelete', 'Administrar estados de contrato (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(109, 'manageformatedit', 'Administrar formatos (editar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(110, 'manageformatdelete', 'Administrar formatos (eliminar)', '2020-12-19 21:22:54', '2020-12-19 21:22:54'),
	(111, 'managepersonedit', 'Administrar personas (editar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(112, 'managepersondelete', 'Administrar personas (eliminar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(113, 'manageinvoiceedit', 'Administrar facturas (editar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(114, 'manageinvoicedelete', 'Administrar facturas (eliminar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(115, 'managetaxedit', 'Administrar impuestos (editar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(116, 'managetaxdelete', 'Administrar impuestos (eliminar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(117, 'manageselfentity', 'Administrar propia entidad', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(118, 'managecostcenterconsolidate', 'Consolidar elementos de negocio', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(119, 'managereminderedit', 'Administrar recordatorios (editar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(120, 'managereminderdelete', 'Administrar recordatorios (eliminar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(121, 'manageareaedit', 'Administrar áreas (editar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(122, 'manageareadelete', 'Administrar áreas (eliminar)', '2020-12-19 21:22:55', '2020-12-19 21:22:55');
/*!40000 ALTER TABLE `sf_guard_permission` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_remember_key
DROP TABLE IF EXISTS `sf_guard_remember_key`;
CREATE TABLE IF NOT EXISTS `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_remember_key: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_remember_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_remember_key` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_user
DROP TABLE IF EXISTS `sf_guard_user`;
CREATE TABLE IF NOT EXISTS `sf_guard_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `algorithm` varchar(128) NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_super_admin` tinyint(1) DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_user: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_user` DISABLE KEYS */;
INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES
	(1, 'Donel', 'Vazquez Zambrano', 'zentro@nauta.cu', 'admin', 'sha1', 'ff4aae7e2101c167263430101e989959', '612db2128e89d2100a9f7c9568d092b6888ed3c8', 1, 1, NULL, '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(2, 'Reynerio', 'Cruz Hechavarria', 'cobransa@nauta.cu', 'reynerio', 'sha1', '3e1faf01245cb64c6d6ea993c85f8ba2', 'b93a0d6e2ebdac8b803763edfe8b24bc2c2a8c99', 1, 1, NULL, '2020-12-19 21:22:55', '2020-12-19 21:22:55');
/*!40000 ALTER TABLE `sf_guard_user` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_user_group
DROP TABLE IF EXISTS `sf_guard_user_group`;
CREATE TABLE IF NOT EXISTS `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`),
  CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_user_group: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_user_group` DISABLE KEYS */;
INSERT INTO `sf_guard_user_group` (`user_id`, `group_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2020-12-19 21:22:55', '2020-12-19 21:22:55'),
	(2, 2, '2020-12-19 21:22:55', '2020-12-19 21:22:55');
/*!40000 ALTER TABLE `sf_guard_user_group` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_user_password
DROP TABLE IF EXISTS `sf_guard_user_password`;
CREATE TABLE IF NOT EXISTS `sf_guard_user_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `algorithm` varchar(128) NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_user_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_user_password: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_user_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_user_password` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.sf_guard_user_permission
DROP TABLE IF EXISTS `sf_guard_user_permission`;
CREATE TABLE IF NOT EXISTS `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.sf_guard_user_permission: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sf_guard_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_user_permission` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_calendar
DROP TABLE IF EXISTS `zab_calendar`;
CREATE TABLE IF NOT EXISTS `zab_calendar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `color` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_calendar: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_calendar` DISABLE KEYS */;
INSERT INTO `zab_calendar` (`id`, `code`, `name`, `comment`, `color`) VALUES
	(1, '09476c3cf5f13e5c36d0e812f7364d88', 'Trabajo', NULL, 6),
	(2, 'e41ee28e036aab0388bea90110a2ec74', 'Casa', NULL, 15),
	(3, '17d311bb72096d252c26b3b926786211', 'Escuela', NULL, 26),
	(4, 'c887627d5429b1806465edd7f5b3e4a4', 'En edición', 'Este estado se usa para contratos en proceso de creación', 6),
	(5, 'b91f3f817d76d0103bfcae4ac260313d', 'En ejecución', 'Este estado se usa para contratos que se encuentran vigentes ydeben estarse ejecutando según sus fechas', 11),
	(6, 'ce33d03cdebd9f998063309bd6d71389', 'Ejecutado', 'Este estado se usa para contratos que se han terminado o cumplido', 16),
	(7, '5a58c6ab9b29b342f05e7283c1e0eb1b', 'Cerrado', 'Este estado se usa para contratos que se han terminado o incumplido para evaluar el resultado', 21),
	(8, 'f2af27b0fea4e60a6adab45a438f6310', 'Cancelado', 'Este estado se usa para contratos que no se han ejecutado', 26);
/*!40000 ALTER TABLE `zab_calendar` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_contacttype
DROP TABLE IF EXISTS `zab_contacttype`;
CREATE TABLE IF NOT EXISTS `zab_contacttype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_contacttype: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_contacttype` DISABLE KEYS */;
INSERT INTO `zab_contacttype` (`id`, `code`, `name`, `comment`) VALUES
	(1, 'e97dd0fbd28d24199b154c8b80fea290', 'Teléfono Fijo', '\\+(?:[0-9] ?){6, 14}[0-9]'),
	(2, '101c09e46111e0b8e972d6d908ba6d1e', 'Teléfono Móvil', NULL),
	(3, '8e467397ce3ea1d84b02719bd3abc595', 'Fax', NULL),
	(4, '0cbe06459c1a8c93ed1162ee5d312c72', 'Correo electrónico', '([\\w\\-\\\'\\-]+)(\\.[\\w-\\\'\\-]+)*@([\\w\\-]+\\.){1,5}([A-Za-z]){2,4}');
/*!40000 ALTER TABLE `zab_contacttype` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_entity
DROP TABLE IF EXISTS `zab_entity`;
CREATE TABLE IF NOT EXISTS `zab_entity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `shortname` varchar(130) DEFAULT NULL,
  `specialcode` varchar(50) DEFAULT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `locationid` bigint(20) DEFAULT NULL,
  `nationalityid` bigint(20) DEFAULT NULL,
  `entitytypeid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parentid_idx` (`parentid`),
  KEY `locationid_idx` (`locationid`),
  KEY `nationalityid_idx` (`nationalityid`),
  KEY `entitytypeid_idx` (`entitytypeid`),
  CONSTRAINT `zab_entity_entitytypeid_zgctr_entitytype_id` FOREIGN KEY (`entitytypeid`) REFERENCES `zgctr_entitytype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_entity_locationid_zgctr_location_id` FOREIGN KEY (`locationid`) REFERENCES `zgctr_location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_entity_nationalityid_zgctr_nationality_id` FOREIGN KEY (`nationalityid`) REFERENCES `zgctr_nationality` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_entity_parentid_zab_entity_id` FOREIGN KEY (`parentid`) REFERENCES `zab_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_entity: ~188 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_entity` DISABLE KEYS */;
INSERT INTO `zab_entity` (`id`, `code`, `name`, `shortname`, `specialcode`, `nit`, `comment`, `address`, `logo`, `images`, `path`, `parentid`, `profile`, `locationid`, `nationalityid`, `entitytypeid`) VALUES
	(1, 'b029e3fec1f7064b8aac2826db00cfe5', 'BANCO NACIONAL DE CUBA', 'BNC', '251-0-00251', '', NULL, 'Calle 25', 'http://localhost:58003/uploads/assets/logos/20180508-115100-11CE567CE2CF0B349535FE5BDE2ED9AF.jpg', '[{"url":"uploads/assets/entity//20180508-113837-8B2F72395BF43453623A8A7806AB54EC.JPG","name":"20180508-113837-8B2F72395BF43453623A8A7806AB54EC.JPG","href":"uploads/assets/entity//20180508-113837-8B2F72395BF43453623A8A7806AB54EC.JPG","shortname":"20180508-113...","id":"35999ea08e7924844dea8312ceef4025"},{"url":"uploads/assets/entity//20180508-113850-BC373835FC58164EFED78A8A4A1E43B4.JPG","name":"20180508-113850-BC373835FC58164EFED78A8A4A1E43B4.JPG","href":"uploads/assets/entity//20180508-113850-BC373835FC58164EFED78A8A4A1E43B4.JPG","shortname":"20180508-113...","id":"b668c2d7fe1388fdb7e648bc4908613e"}]', NULL, NULL, NULL, 29, NULL, 1),
	(2, '5758311b3c1e65b9aec73e4b2eba9fd3', 'BANCO POPULAR DE AHORRO', 'BPA', '253-0-00253', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 26, NULL, 1),
	(3, 'f86b4893625a1a7a039c4f1f60afd06b', 'BANCO CENTRAL DE CUBA', 'BCC', '257-0-00257', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 29, NULL, 1),
	(4, '39f4cf5e83588035ccc1d8dd46698fca', 'BANCO DE CREDITO Y COMERCIO', 'BANDEC', '258-0-00258', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 29, NULL, 1),
	(5, 'e2e5a8cbec2f44ee32aa80cc15b618ea', 'BANCO EXTERIOR DE CUBA', 'BEC', '259-0-00259', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 27, NULL, 1),
	(6, '692c26cd5f68c4823a67076059fbdfe6', 'PODER POPULAR PROVINCIAL DE HOLGUIN', '', '321-1-00510', NULL, NULL, 'PROLONGACION DE FREXES S/N E/ GONZALEZ CLAVEL E INDEPENDENCIA, VISTA ALEGRE', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(7, '6d08c6ac60337a04e1526c34c0bf9103', 'PODER POPULAR MUNICIPAL DE HOLGUIN', '', '321-2-00516', NULL, NULL, 'CALLE AGRAMONTE NO. 184 E/ LIBERTAD Y MACEO', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(8, '08aea2b11700942352d1120af94f1188', 'EMPRESA DE COMBINADAS CANERAS "LX ANIVERSARIO DE LA REVOLUCION DE OCTUBRE"', '', '102-0-01112', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(9, '78c8944d08a7d7d2177a64c9430fe4c8', 'EMPRESA DE CERAMICA BLANCA DE HOLGUIN', '', '126-0-01340', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(10, '49f04e3ef1387b7af66055d032efe97d', 'EMPRESA CARNICA HOLGUIN', '', '111-0-01591', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(11, '3e7a5e601c1b0dd81edf7122b1381548', 'EMPRESA DE PRODUCTOS LACTEOS HOLGUIN', '', '111-0-01611', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(12, '032154b00265213b7783a9e94fcfa261', 'EMPRESA DE ACOPIO, BENEFICIO Y TORCIDO DE TABACO HOLGUIN', '', '131-0-01714', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(13, '94cca74f2307144095f941e43bf5f910', 'EMPRESA MECANICA HEROES DEL 26 DE JULIO', '', '102-0-02417', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(14, '5b0a5f6d50302d30979aa7a3f7440162', 'CENTRO DE DESARROLLO DE LA MAQUINARIA AGRICOLA', 'CEDEMA', '102-0-02665', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(15, '91e910f20a7a91284a6a6ec7cefef004', 'EMPRESA PRODUCTORA DE PREFABRICADO DE HOLGUIN', '', '126-0-02701', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(16, '3c0090ab2d554145187f50b7ab7e8381', 'EMPRESA CONSTRUCTORA DE OBRAS DE ARQUITECTURA NO. 19', '', '126-0-02889', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(17, 'adab23cc979bde2c65c9e878d735a2ef', 'EMPRESA CONSTRUCTORA DE OBRAS DE INGENIERIA NO. 17', '', '126-0-02891', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(18, '9536871a0bd9d360fff9a189d14b1e8c', 'EMPRESA CONSTRUCTORA DE OBRAS INDUSTRIALES NO. 9', '', '126-0-02893', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(19, 'ac95f8323c639ef5c84590c0a3a95b14', 'EMPRESA CONSTRUCTORA MILITAR No. 2', '', '271-0-03176', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(20, '90cce346cd4f71765daf56da74f46572', 'EMPRESA HORTICOLA "WILFREDO PENA CABRERA"', '', '131-0-03544', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(21, '5b9989a4c249fbe75cf12e1c0fbb3fa7', 'EMPRESA PORCINA HOLGUIN', '', '131-0-03731', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(22, '24eec39064fd41d82f8fdff407c05d36', 'EMPRESA AVICOLA HOLGUIN', '', '131-0-03752', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(23, '2c6a4dc5efa1cd2d28deb409fd78582e', 'EMPRESA DE INVESTIGACIONES Y PROYECTOS HIDRAULICOS DE HOLGUIN', '', '113-0-04204', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(24, '5e52d5502861d1018060990fca0bcc8d', 'EMPRESA PROVINCIAL PRODUCTORA Y DISTRIBUIDORA DE ALIMENTOS DE HOLGUIN', '', '321-1-04237', NULL, NULL, 'CALLE MORALES LEMUS NO. 193 E/ FREXES Y MARTI', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(25, 'f2455d033f8b2ad0e4ad4b9d41c73805', 'EMPRESA AGROFORESTAL HOLGUIN', '', '131-0-04324', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(26, 'ad1ac20b079633f380ae38721bda626d', 'EMPRESA DE SUMINISTROSAGROPECUARIOS HOLGUIN', '', '131-0-04934', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(27, 'c54bb3522a30cd8f31cb10488b6c5c12', 'EMPRESA DE RECUPERACION DE MATERIAS PRIMAS DE HOLGUIN', '', '102-0-04980', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(28, 'c5bcc4164c87d9734f300e46c7a4e2b2', 'EMPRESA MUNICIPAL DE COMERCIO HOLGUIN', '', '321-2-05327', NULL, NULL, 'CALLE LIBERTAD NO. 150 E/ MARTI Y LUZ CABALLERO', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(29, 'b979c0383693f3fbf5291ce685cd0b04', 'EMPRESA DE ACOPIO HOLGUIN', '', '131-0-05395', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(30, 'ede90544452d7820a74c58b08a04e541', 'EMPRESA COMERCIALIZADORA Y DE SERVICIOS DE PRODUCTOS UNIVERSALES HOLGUIN', '', '171-0-05472', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(31, '0c16a489f31e7afc56877990b384855c', 'EMPRESA PROVINCIAL DE SUMINISTROS HOLGUIN', '', '321-1-05685', NULL, NULL, 'CALLE GARAYALDE NO. 221 ESQ. MORALES LEMUS', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(32, '6723164bade2c1f131e9a4a5df744cd0', 'CENTRO PROVINCIAL DEL LIBRO Y LA LITERATURA DE HOLGUIN', '', '321-1-05700', NULL, NULL, 'CALLE AREAS NO. 144 E/ CERVANTES Y FOMENTO', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(33, '2c06062000f45d8dc89771a7af853532', 'EMPRESA DE ASEGURAMIENTO A LA EDUCACION HOLGUIN', '', '321-1-05787', NULL, NULL, 'CALLE MIRO NO. 103 E/ ARIAS Y AGUILERA', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(34, '9349b52707ca84899b4a23a27a66cbc3', 'EMPRESA PROVINCIAL DE TRANSPORTE DE HOLGUIN', '', '321-1-06052', NULL, NULL, 'CALLE FOMENTO NO. 173 E/ GARAYALDE Y AGRAMONTE', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(35, 'a8dfc181952e6fe2950af92ccfde2eca', 'UNIDAD PRESUPUESTADA MUNICIPAL DE SERVICIOS COMUNALES HOLGUIN', '', '321-2-06443', NULL, NULL, 'CALLE C.M. DE CESPEDES NO. 102 ESQ. CARRETERA DE MAYARI', NULL, NULL, NULL, 7, NULL, 139, NULL, 5),
	(36, '7c5bf5f0e04d85a7ce4d2eadf2a21f2d', 'UNIVERSIDAD DE HOLGUIN', '', '223-0-06821', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(37, 'cb462d51665632731109c668e097c53f', 'UNIDAD PRESUPUESTADA MUNICIPAL DE EDUCACION HOLGUIN', '', '321-2-06989', NULL, NULL, 'CALLE MORALES LEMUS NO. 174 E/ CABLES Y ARICOCHEA', NULL, NULL, NULL, 7, NULL, 139, NULL, 5),
	(38, '47601309232f01f1ac4436f4c9e0877b', 'UNIDAD PRESUPUESTADA PROVINCIAL DE EDUCACION HOLGUIN', '', '321-1-07116', NULL, NULL, 'CALLE CUBA NO. 241 E/ LIBERTAD Y MACEO', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(39, 'ec5d78095a8e26dbbdfc9954e33fac5e', 'UNIVERSIDAD DE CIENCIAS MEDICAS DE HOLGUIN', '', '241-0-07123', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(40, 'e4ae37e936e04395bf01f6e21fc71081', 'UNIDAD PRESUPUESTADA PROVINCIAL ESCUELA VOCACIONAL "JOSE MARTI"', '', '321-1-07149', NULL, NULL, 'CARRETERA MAYARI KM. 4 1/2', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(41, '028a81389d22dc87f7df72db486e2ffb', 'UNIDAD PRESUPUESTADA PROVINCIAL ESCUELA DE INICIACION DEPORTIVA "PEDRO DIAZ COELLO"', '', '321-1-07184', NULL, NULL, 'CARRETERA MAYARI KM. 2 1/2', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(42, 'eb2d94b997701ad1a440e7bac10f0f8e', 'UNIDAD PRESUPUESTADA PROVINCIAL ATENCION AL PLANTEL INSTITUTO TECNICO DE HOLGUIN', '', '321-1-07185', NULL, NULL, 'CARRETERA CENTRAL KM. 774 VIA HABANA', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(43, 'a41dcb50acbc8106ab3f5205b0d1b646', 'EMPRESA DE MATERIALES DE CONSTRUCCION DE HOLGUIN', '', '126-0-07411', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(44, 'd14ffb38d95591ec41cc7709f4e9c639', 'EMPRESA PESQUERA DE HOLGUIN, PESCAHOL', 'PESCAHOL', '111-0-07491', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(45, '06b8b8ee32993b7a2b7d90a5f7bac86b', 'ADUANA HOLGUIN', '', '304-0-07710', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(46, '7315334ff4875ff32d8bd5bd524097dc', 'EMPRESA DE MANTENIMIENTO VIAL Y CONSTRUCCIONES DE HOLGUIN', '', '151-0-07781', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(47, '2db8c9568def22f659b455d2b2c76125', 'DIRECCION PROVINCIAL DE SERVICIOS COMUNALES DE HOLGUIN', '', '321-1-07830', NULL, NULL, 'CALLE MIRO NO. 151 ENTRE MARTI Y FREXES', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(48, '7d8c2d9bae4e3070fa8a717eba34c516', 'EMPRESA PROVINCIAL DE SERVICIOS TECNICOS, PERSONALES Y DEL HOGAR DE HOLGUIN', '', '321-1-07854', NULL, NULL, 'CALLE FREXES NO. 145 E/ MARTIRES Y MAXIMO GOMEZ', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(49, '12b233e53174d544bf7b347fa303525e', 'EMPRESA GEOCUBA ORIENTE NORTE', '', '271-0-07991', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(50, 'd9cf38ad836f428f43f0eb91141fe4d1', 'CENTRO PROVINCIAL DEL CINE DE HOLGUIN', '', '321-1-08014', NULL, NULL, 'CALLE MARTIRES NO. 77 ALTOS ENTRE FREXES Y AGUILERA', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(51, 'd016e2c17dab056fe27d4303888f157f', 'UNIDAD PRESUPUESTADA PROVINCIAL DE RADIO HOLGUIN', '', '321-1-08046', NULL, NULL, 'CALLE MAXIMO GOMEZ NO. 298 E/ FREXES Y MARTI', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(52, 'da64e071ba7a03fecc768f708135931d', 'UNIDAD PROVINCIAL DE APOYO A LA ACTIVIDAD CULTURAL DE HOLGUIN', '', '321-1-08068', NULL, NULL, 'CALLE MARIANA DE LA TORRES NO. 146 ENTRE 14 Y 18 REPARTO LENIN', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(53, '216ab142962f7a39bc24127682b69c85', 'UNIDAD MUNICIPAL DE APOYO A LA ACTIVIDAD CULTURAL DE HOLGUIN', '', '321-2-08069', NULL, NULL, 'CALLE NARCISO LOPEZ NO. 127 E/ AGUILERA Y ARIAS', NULL, NULL, NULL, NULL, NULL, 139, NULL, NULL),
	(54, 'c186e22d669db0c79316d3b97d60e68e', 'UNIDAD PRESUPUESTADA TELE CRISTAL', '', '233-0-08133', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(55, '7e00ae044e3aaeb5b153de372b38b2b0', 'EMPRESA PROVINCIAL COMERCIALIZADORA DE LA MUSICA Y LOS ESPECTACULOS "FAUSTINO ORAMAS OSORIO"', '', '321-1-08137', NULL, NULL, 'CALLE MARTIRES NO. 73 ENTRE LAS CALLES FREXES Y AGUILERA', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(56, '62e92b98355193e6da1b883361f09cd1', 'DELEGACION TERRITORIAL INRE HOLGUIN', 'INRE-HOLGUIN', '271-0-08205', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(57, 'a57e8decfb8dce31b69fb6d8c999fa22', 'UNIDAD PRESUPUESTADA MUNICIPAL SALUD PUBLICA HOLGUIN', '', '321-2-08584', NULL, NULL, 'CALLE ARIAS NO. 193 E/ MARTIRES Y MAXIMO GOMEZ', NULL, NULL, NULL, 7, NULL, 139, NULL, 5),
	(58, '1e56b9e1ed177078c700bc654a076ab3', 'UNIDAD PRESUPUESTADA PROVINCIAL HOSPITAL PEDIATRICO DE HOLGUIN', '', '321-1-08586', NULL, NULL, 'AVE. LOS LIBERTADORES NO. 91', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(59, '37a84a11daeadf27036ef20e5e8dee01', 'UNIDAD PRESUPUESTADA PROVINCIAL HOSPITAL "LENIN" HOLGUIN', '', '321-1-08587', NULL, NULL, 'AVENIDA LENIN NO. 2', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(60, '71ab32c6b092b52bd36b24416b530076', 'UNIDAD PRESUPUESTADA MUNICIPAL DE DEPORTES Y CULTURA FISICA HOLGUIN', '', '321-2-08642', NULL, NULL, 'CALLE MORALES LEMUS NO. 156 E/ MARTI Y LUZ CABALLERO', NULL, NULL, NULL, 7, NULL, 139, NULL, 5),
	(61, 'd2a6d2feb5ccb97ea4e670e91120d95f', 'UNIDAD PRESUPUESTADA PROVINCIAL DE DEPORTES Y CULTURA FISICA HOLGUIN', '', '321-1-08671', NULL, NULL, 'AVE. DE LOS LIBERTADORES E/ CALLE 1RA Y AVE. XX ANIVERSARIO', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(62, '9c12d9f3c5861229667973ffa7ef4e27', 'CENTRO PROVINCIAL DE HIGIENE Y EPIDEMIOLOGIA HOLGUIN', '', '321-1-08710', NULL, NULL, 'CALLE LIBERTAD NO. 36 E/ 12 Y 14', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(63, 'a430c20c7a79447342bf3efddd96b753', 'UNIDAD PRESUPUESTADA PROVINCIAL DE SALUD HOLGUIN', '', '321-1-08725', NULL, NULL, 'CALLE MORALES LEMUS, ESQ. FREXES', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(64, 'c99675e1c6c18598f23551ce54254475', 'EMPRESA COMERCIALIZADORA DE COMBUSTIBLES DE HOLGUIN', '', '104-0-08876', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(65, '8ea73c5a7d2c5d047bdd4dcedcf5a1d3', 'EMPRESA ELECTRICA HOLGUIN', 'OBE HOLGUIN', '104-0-09090', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(66, '0fe1112e69dc51ef5060f7978d1626e8', 'FISCALIA PROVINCIA HOLGUIN', '', '268-0-09226', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(67, '9a0ab3a2be413d9709aa38e12d297e60', 'OFICINA PROVINCIAL DE LA ONEI EN HOLGUIN', '', '305-0-09270', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(68, 'b9cff9edd388636b7f61dc122a1b9d2f', 'DELEGACION PROVINCIAL DEL MINISTERIO DE LA AGRICULTURA EN HOLGUIN', '', '131-0-09292', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(69, '0c1f2eb45443cbed02525212dbcf17ac', 'DIRECCION PROVINCIAL DE TRABAJO DE HOLGUIN', '', '321-1-09340', NULL, NULL, 'CALLE 27 NO. 28 E/ 4TA Y 6TA, RPTO. LENIN', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(70, 'e74ee1e13d68387c895c375152619d77', 'UNIDAD PRESUPUESTADA DE APOYO AL MINISTERIO DE CIENCIA, TECNOLOGIA Y MEDIO AMBIENTE EN HOLGUIN', '', '211-0-09366', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(71, 'e4f6828376eaec575f11ad6703a9b4ca', 'DIRECCION PROVINCIAL DE PLANIFICACION FISICA HOLGUIN', '', '321-1-09384', NULL, NULL, 'CALLE CARBO NO. 114 E/ FREXES Y PEREZ ZORRILLA', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(72, '81747e29e441be00703554dfe67a650e', 'TRIBUNAL PROVINCIAL POPULAR DE HOLGUIN', '', '267-0-09567', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(73, '215a921d9adac99802ef270c645caded', 'OFICINA TERRITORIAL DE NORMALIZACION DE HOLGUIN', '', '211-0-09676', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(74, '5eefd536def799bb4f91eb7ab5c56fb7', 'COMITE PROVINCIAL DEL PCC HOLGUIN', '', '501-0-09912', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 3),
	(75, '93e0cf58ad1ef81a5cfa5f877b6cd982', 'HOSPITAL CLINICO QUIRURGICO DE HOLGUIN', '', '321-1-11027', NULL, NULL, 'CARRETERA VIA VALLE DE MAYABE', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(76, '0d24a6b3ef62f48d25b49a72bfd35011', 'DIRECCION PROVINCIAL DE LA VIVIENDA DE HOLGUIN', '', '321-1-11070', NULL, NULL, 'CALLE FOMENTO NO. 237 ENTRE ARIAS Y AGUILERA', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(77, '0efe42f52beaecafe35b7e1fdab0d7bd', 'EMPRESA DE APROVECHAMIENTO HIDRAULICO DE HOLGUIN', '', '113-0-11121', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(78, '475c65fff435aff2111cf7a2278b729f', 'EMPRESA RECINTO DE EXPOSICIONES DE HOLGUIN', 'EXPOHOLGUIN', '321-1-11137', NULL, NULL, 'AVE. DE LOS LIBERTADORES NO. 44', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(79, '176f0d1dc2913c777360dd7b3b19c219', 'EMPRESA DE SERVICIOS A TRABAJADORES DE HOLGUIN', '', '126-0-11592', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(80, 'd64ee136a751ebb115b77605b5707f0a', 'EMPRESA "CAMPISMO POPULAR" HOLGUIN', '', '256-0-11955', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(81, '469dfd654ea9c20123c4c8677ee36662', 'EMPRESA MUNICIPAL DE GASTRONOMIA HOLGUIN', '', '321-2-11961', NULL, NULL, 'CALLE PERALTA NO. 39 ENTRE 20 DE MAYO E INDEPENDENCIA, REPARTO SANTIESTEBAN', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(82, 'deccdbdb266860b1a111c857e91a82ec', 'EMPRESA DE SEGURIDAD Y PROTECCION DEL CONSEJO DE ADMINISTRACION PROVINCIAL DEL PODER POPULAR DE HOLGUIN', 'SEPRO', '321-1-12050', NULL, NULL, 'NARCISO LOPEZ NO. 112 ENTRE ARIAS Y AGRAMONTE', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(83, 'dbf102132cd5f48dab77ed80f460fede', 'CENTRO DE INVESTIGACIONES Y SERVICIOS AMBIENTALES Y TECNOLOGICOS', '', '211-0-12119', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(84, '20582bcfbcce5f996e3b545a7196e945', 'EMPRESA DE CIGARROS "LAZARO PENA"', '', '131-0-12216', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(85, '34fd27796836e3a8fe3cd8b5a431c7f0', 'DIRECCION PROVINCIAL DE FINANZAS Y PRECIOS DE HOLGUIN', '', '321-1-12217', NULL, NULL, 'CALLE LIBERTAD NO. 207 E/ LUZ CABALLERO Y MARTI', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(86, '595ce7380c6e45d413bb5b10bafeba52', 'EMPRESA MAYORISTA DE PRODUCTOS ALIMENTICIOS Y OTROS BIENES DE CONSUMO DE HOLGUIN', '', '171-0-12461', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(87, 'f84315fbb46fbc4e5d4de1f16a789bea', 'EMPRESA PROVINCIAL DE ALOJAMIENTO Y GASTRONOMIA HOLGUIN', '', '321-1-12464', NULL, NULL, 'LIBERTAD ENTRE CUBA Y GARAYALDE', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(88, '7a9e898fa32eeb7c7b27d15eb2e8957b', 'EMPRESA AGROPECUARIA MILITAR HOLGUIN-LAS TUNAS', '', '271-0-12491', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(89, 'cff6bb4c455d110c0d80a4c669b32c66', 'EMPRESA DE ENVASES DE ALUMINIOS', 'ENVAL', '102-0-12555', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(90, 'b7ca70661269f0bb931eecce18ed9751', 'EMPRESA DE RESIDUOS SOLIDOS URBANOS DE HOLGUIN', '', '102-0-12558', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(91, 'bac355962e970bbea9cfff1267366e79', 'EMPRESA AGROPECUARIA E INDUSTRIAL DEL MININT HOLGUIN', '', '272-0-12665', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(92, '38aa3401a0ba29ee82e41e1334c31805', 'DELEGACION PROVINCIAL DEL INSTITUTO NACIONAL DE RECURSOS HIDRAULICOS DE HOLGUIN', '', '113-0-12694', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(93, 'f94909491f3a922dda52889385e83e35', 'EMPRESA PROVINCIAL DE INDUSTRIAS LOCALES VARIAS DE HOLGUIN', '', '321-1-12721', NULL, NULL, 'CALLE CUBA NO. 248, ESQ. NARCISO LOPEZ', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(94, 'ab90c6bc86143a8282fee22e6635aa66', 'EMPRESA PROVINCIAL CONSTRUCTORA DE HOLGUIN', '', '321-1-12777', NULL, NULL, 'CALLE MARTIRES E/ MARTI Y FREXES', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(95, 'b199693db808667519638fbac8ce13fa', 'EMPRESA DE ACUEDUCTO Y ALCANTARILLADO DE HOLGUIN', '', '113-0-12820', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(96, 'b9c5a56923e17e9086ba6fb684731ee9', 'EMPRESA DE SERVICIOS DE INGENIERIA Y DISENO DE HOLGUIN, VERTICE', '', '126-0-12928', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(97, '43300bfe19020853535a4f8ad01ad8bd', 'UNIDAD ADMINISTRATIVA COMERCIAL HOLGUIN', '', '271-0-13098', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(98, '20bfa8371f9040bc72dcb0ecdf3a56b1', 'EMPRESA DE MANTENIMIENTO Y REHABILITACION DE OBRAS HIDRAULICAS DE ORIENTE', '', '113-0-13107', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(99, '9822c4f6ebe485a7e833928e34a4a7f7', 'EMPRESA INTEGRAL AGROPECUARIA HOLGUIN', '', '131-0-13213', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(100, '3d1be7821c0c066becaeafeeb6083dbe', 'CENTRO DE GESTION CONTABLE MUNICIPAL DE HOLGUIN', '', '321-2-13438', NULL, NULL, 'CALLE ARIAS NO. 324 ALTOS E/ MENDIETA Y DOSITEO AGUILERA', NULL, NULL, NULL, 7, NULL, 139, NULL, 5),
	(101, '57e748267fa53e2178df542710ca93e3', 'EMPRESA DE SERVICIOS INGENIEROS HIDRAULICOS ESTE', 'ESIHE', '113-0-13508', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(102, 'ef5d1296831dc1996b58f942cfaf98f5', 'EMPRESA HOLPLAST', '', '113-0-13534', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(103, '7f82383f380a8cb019724f2ed1a5c19d', 'DIRECCION MUNICIPAL DE LA VIVIENDA DE HOLGUIN', '', '321-2-13704', NULL, NULL, 'AGUILERA NO. 225 A, E/ LIBERTAD Y MACEO', NULL, NULL, NULL, 7, NULL, 139, NULL, 5),
	(104, '60630ba3b9455c6b651821b0dc547bc7', 'DIRECCION PROVINCIAL DE JUSTICIA DE HOLGUIN', '', '321-1-13728', NULL, NULL, 'JOSE ANTONIO CARDET NO. 198 ESQUINA AGUILERA', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(105, 'b8279765dfcc9a7e9151b99926c783ea', 'DIRECCION MUNICIPAL DE TRABAJO Y SEGURIDAD SOCIAL DE HOLGUIN', '', '321-2-14015', NULL, NULL, 'CALLE AGUILERA NO. 54 E/ PROGRESO Y FOMENTO, REPARTO VISTA ALEGRE', NULL, NULL, NULL, 7, NULL, 139, NULL, 5),
	(106, 'df19812b0aa2a39316876d20484c7e99', 'SALA DE TELEVISION PROVINCIAL HOLGUIN', '', '321-1-14041', NULL, NULL, 'CALLE FREXES NO. 84 ALTOS ENTRE FOMENTO Y MARANON', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(107, '003c5ec8c137caebf7f1510e14cb9a10', 'EMPRESA PROVINCIAL DE SERVICIOS A LA SALUD DE HOLGUIN', '', '321-1-14129', NULL, NULL, 'CARRETERA CENTRAL S/N ENTRE SAN PABLO Y ANGEL GUERRA', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(108, 'c7d493e2e5e150726625c2933c4743ec', 'EMPRESA PROVINCIAL DE FARMACIAS Y OPTICAS DE HOLGUIN', '', '321-1-14130', NULL, NULL, 'MIRO NO. 84 E/ FREXES Y MARTI', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(109, '7161e8cacd7ff08f088a11d41084ca3b', 'EMPRESA PROVINCIAL DE CONSERVACION, REHABILITACION Y SERVICIOS A LA VIVIENDA DE HOLGUIN', 'UMBRALES', '321-1-14131', NULL, NULL, 'CALLE LIBERTAD NO. 61 E/ LAS CALLES CUBA Y HABANA', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(110, '3b6db2cc82612b1c2dca92c8d74b1870', 'EMPRESA AZUCARERA HOLGUIN', '', '658-0-14230', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(111, '9332722827d8af41b45fd54d0b5b4511', 'DIRECCION ESTATAL DE COMERCIO DE HOLGUIN', '', '321-1-14260', NULL, NULL, 'CALLE FREXES NO. 346 ALTO ENTRE CARBO Y CARRETERA CENTRAL', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(112, '7cbd38d09bd8f39f12d7251320b0defb', 'GRUPO EMPRESARIAL DE COMERCIO DE HOLGUIN', '', '321-1-14261', NULL, NULL, 'LIBERTAD NO. 140 ENTRE MARTI Y LUZ CABALLERO', NULL, NULL, NULL, 6, NULL, 139, NULL, 6),
	(113, '713371843031e356df9b881513bbc749', 'EMPRESA CONSTRUCTORA HOLGUIN DEL MININT', 'ECM HOLGUIN', '272-0-14272', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(114, 'deae5fe8c11a8956c1e28c6d7edfa3a3', 'EMPRESA PROVINCIAL DE ASEGURAMIENTOS Y SERVICIOS A LA ACTIVIDAD COMUNAL DE HOLGUIN', '', '321-1-14301', NULL, NULL, 'PEPE TORRES 144 ENTRE FREXES Y AGUILERA', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(115, '21af433521a3b82a941b4a63b09ffa63', 'EMPRESA DE CORREOS HOLGUIN', '', '161-0-14411', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(116, 'c5b62e27f613bfa5d95f1f2fa32e136e', 'EMPRESA DE UNIDADES DE ADMINISTRACION COMERCIAL HOLGUIN', 'EMPRESA UAC HOLGUIN', '272-0-14435', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 2),
	(117, '7f977cacedc7934a126706eeb028378a', 'CASA DE IBEROAMERICA DE HOLGUIN', '', '321-1-14447', NULL, NULL, 'CALLE AREAS NO. 161 ENTRE LIBERTAD Y MACEO.', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(118, '0757b545d0da26bd4f7e11129c87dd01', 'EMPRESA PROVINCIAL DE SERVICIOS LEGALES HOLGUIN', '', '321-1-14448', NULL, NULL, 'CALLE AGRAMONTE NO. 141 ENTRE MORALES LEMUS Y NARCISO LOPEZ.', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(119, '2ad46472678e4cee6335487a220d87e8', 'EMPRESA PROVINCIAL DE SERVICIOS TECNICOS DEL ARQUITECTO DE LA COMUNIDAD DE HOLGUIN', '', '321-1-14459', NULL, NULL, 'CALLE AREAS NO. 222 ENTRE MACEO Y MARTIRES', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(120, '9fcf22145a85bf55b94c37ed6f93f46c', 'CENTRO PROVINCIAL DE ARTES ESCENICAS DE HOLGUIN', '', '321-1-14460', NULL, NULL, 'CALLE MARTI NO. 115 ENTRE MACEO Y LIBERTAD', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(121, '031e3e3963af45c5692adf975c27ca0e', 'EMPRESA PROVINCIAL DE SERVICIOS AL ARTE DE HOLGUIN', '', '321-1-14461', NULL, NULL, 'CALLE LUZ CABALLERO NO. 120 ESQUINA MARTIRES', NULL, NULL, NULL, 6, NULL, 139, NULL, 2),
	(122, '51b307493c1f76bc965ed553f5b05a0e', 'DELEGACION MUNICIPAL DEL MINISTERIO DE LA AGRICULTURA EN HOLGUIN', '', '131-0-14642', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(123, '91192c2aa0d85c580764bfd285dc7539', 'CENTRO PROVINCIAL DE ELECTROMEDICINA DE HOLGUIN', '', '321-1-14690', NULL, NULL, 'CARRETERA CENTRAL VIA BAYAMO, KM 774', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(124, 'b7f04581c98a1593d22f39b3088c7e3d', 'BANCO PROVINCIAL DE SANGRE DE HOLGUIN', '', '321-1-14694', NULL, NULL, 'CALLE SEPTIMA NO. 10 ENTRE 10 Y AVENIDA LIBERTADORES', NULL, NULL, NULL, 6, NULL, 139, NULL, 5),
	(125, 'be194fbb0a082c1e01b6bfab06db7591', 'CENTRO PROVINCIAL DE ATENCION SOCIAL A PERSONAS CON CONDUCTAS DEAMBULANTES DE HOLGUIN', '', '321-1-14717', NULL, NULL, 'CARRETERA CENTRAL KM 6 1/2 OSCAR LUCERO', NULL, NULL, NULL, NULL, NULL, 139, NULL, 5),
	(126, '2fc6ba8d93f6e9dfdad49808651cdefa', 'Ministerio de Industrias', 'MINDUS', '102-0-00102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(127, 'cea73ac36a78072972257507c856c80e', 'Ministerio de Energía y Minas', 'MINEM', '104-0-00104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(128, 'c22f28771b7f7a03987551ea6c2f2040', 'Ministerio de la Industria Alimentaria', 'MINAL', '111-0-00111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(129, '6086e4b1388c4a2ae686f55eac107d66', 'Instituto Nacional de Recursos Hidráulicos', 'INRH', '113-0-00113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(130, 'ba78adcce78a7e84c1e3c2ce34ef7efe', 'Ministerio de la Construcción', 'MICONS', '126-0-00126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(131, '01760b62478c23f2cc5c78f65a003504', 'Ministerio de la Agricultura', 'MINAG', '131-0-00131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(132, '2b05d5d588358a7c38610abfaa2f2fdf', 'Ministerio del Transporte', 'MITRANS', '151-0-00151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(133, 'ade465d00e78ba4089702bb70360c896', 'Ministerio de Comunicaciones', 'MINCOM', '161-0-00161', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(134, '11a8237112cb17dda48a861f6b196a96', 'Ministerio del  Comercio Interior', 'MINCIN', '171-0-00171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(135, '48c5dc1a1aeafa8373bfe3901f6afd78', 'Ministerio del Comercio Exterior y la Inversión Extranjera', 'MINCEX', '174-0-00174', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(136, '46a834ed771480257993efea7e0c966e', 'Ministerio de Ciencia,Tecnología y Medio Ambiente', 'CITMA', '211-0-00211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(137, '7b382679f752486162007b5781e37633', 'Ministerio de Educación', 'MINED', '221-0-00221', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(138, 'eef2b79e44e776a728d2d1804b139a88', 'Ministerio de Educación Superior', 'MES', '223-0-00223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(139, 'c72716fdb59ea25b5692970ce819caac', 'Instituto Cubano de Radio y Televisión', 'ICRT', '233-0-00233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(140, 'cdf59b443dba6e2777e96d1c6afc1622', 'Ministerio de  Cultura', 'MINCULT', '234-0-00234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(141, '5ce5d2ed1b3fb7fd3221992d4d0686d5', 'Ministerio de Salud Publica', 'MINSAP', '241-0-00241', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(142, 'c2a8b1e558a4aa54d63fa2e94091a616', 'Instituto Nacional de Deportes,Educación Física y Recreación', 'INDER', '242-0-00242', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(143, '32fe2490ae96233769c24dbabdef670d', 'Contraloría General de la República', 'CGR', '249-0-00249', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(144, '1102eac4b26d063db9d66670a5bfb32d', 'Ministerio de Finanzas y Precios', 'MFP', '254-0-00254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(145, 'a0326310af25b2d2b79332784bb35983', 'Ministerio de Turismo', 'MINTUR', '256-0-00256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(146, 'dda233d758da2292ffd1cd53477657f3', 'Ministerio de Economía y Planificación', 'MEP', '261-0-00261', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(147, 'edf05673d5213c647995561ec76e83bc', 'Ministerio de Trabajo y Seguridad Social', 'MTSS', '262-0-00262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(148, '686302f85c61ca0bca423dc9e2aca643', 'Ministerio de Justicia', 'MINJUS', '263-0-00263', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(149, '42a4e009ed9230f5199352922d2c9cfa', 'Ministerio de Relaciones Exteriores', 'MINREX', '264-0-00264', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(150, '270c5a5bde8b2320d4a63c9c80ba7a6f', 'Tribunal Supremo Popular', 'TSP', '267-0-00267', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(151, '08c0b3c11b209bdd7fa1571af35554cd', 'Fiscalía General de la República', 'FGR', '268-0-00268', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(152, 'aba7c69c9305d8df185a9d3887f56201', 'Ministerio de las Fuerzas Armadas Revolucionarias', 'MINFAR', '271-0-00271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(153, 'd50e9918eb1b0e93c298ab47b942a646', 'Ministerio del Interior', 'MININT', '272-0-00272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(154, '36c656d357f1d553c1c616f99fa0414b', 'Consejo de Estado', 'CE', '300-0-00300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(155, '8f9d10edeae00843475f980f6cbcc94f', 'Poder Popular Nacional - Asamblea Nacional', 'ANPP', '301-0-00301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(156, 'd451955d0beb330c57f47ade8eab5aea', 'Comité Ejecutivo del Consejo de Ministros', 'CECM', '302-0-00302', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(157, '73dd5c4b049752b60c1ee09ae18b545c', 'Aduana General de la República Nivel Central', 'AGR', '304-0-00304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(158, 'c6556a164643c7fc4540c12ad8c2fb63', 'Consejo de Ministros', 'CM', '305-0-00305', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(159, '7999b15338823baeb96e02d4b34e4a9e', 'Oficina del Historiador de la Ciudad de la Habana', 'OHCH', '306-0-00306', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(160, '1bbd98219294166a032b25a9233e09b9', 'Poder Popular de Pinar del Rio', 'PPPR', '311-0-00311', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(161, 'ee28ac647703fa88a20a10fcc12c3376', 'Poder Popular de La Habana', 'PPLH', '313-0-00313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(162, '1561594b0d0e56e1246ec3024a63d667', 'Poder Popular de Matanzas', 'PPMT', '314-0-00314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(163, 'edf36b01ee3360ef904a9a89c23ab4de', 'Poder Popular de Villa Clara', 'PPVC', '315-0-00315', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(164, 'd469a5afb008e6ae7de6f14a782bbc0c', 'Poder Popular de Cienfuegos', 'PPCF', '316-0-00316', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(165, 'c655325db61dc1e2a67628bbd94d10af', 'Poder Popular de Sancti Spíritus', 'PPSS', '317-0-00317', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(166, '8cbe44c62a7aa377a1b3a25d9063df8c', 'Poder Popular de Ciego de Ávila', 'PPCA', '318-0-00318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(167, '5bbf4705d8660971867d41900619f8ae', 'Poder Popular de Camagüey', 'PPCM', '319-0-00319', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(168, '73e6f7763d1b7a9565865b7d81ce1f48', 'Poder Popular de Las Tunas', 'PPLT', '320-0-00320', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(169, '70d1875e9741e771a6510c1e659f0a09', 'Poder Popular de Holguín', 'PPHG', '321-0-00321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(170, '8b733e25820a8d6f4508f3387ab368ba', 'Poder Popular de Granma', 'PPGR', '322-0-00322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(171, '892cf58f00a954e6a358fa5b0811bdc4', 'Poder Popular de Santiago de Cuba', 'PPSC', '323-0-00323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(172, '1a35e995d5d4d76861eb68cbe700f659', 'Poder Popular de Guantánamo', 'PPGT', '324-0-00324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(173, 'b34d858fc24d86c7793085711f133adc', 'Poder Popular de Isla de la Juventud', 'PPIJ', '325-0-00325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(174, '411579694e0c62c48c07158f7050b07b', 'Poder Popular de Artemisa', 'PPAR', '326-0-00326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(175, '6678d68842a48c29cb038664cbb3111e', 'Poder Popular de Mayabeque', 'PPMY', '327-0-00327', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(176, 'd64aff8a559c10879f7c0f476984659d', 'Partido Comunista de Cuba', 'PCC', '501-0-00501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(177, '7a7d600002e5d51bce2de8b18c2bb8c1', 'Unión de Jóvenes Comunistas', 'UJC', '502-0-00502', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(178, '39a6584fe0a5ded87302f3f98ffce722', 'Organización de Pioneros José Marti', 'OPJM', '503-0-00503', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(179, '63ec6460b57024355f2c2b5af61c777c', 'Central de Trabajadores de Cuba', 'CTC', '504-0-00504', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(180, '29f88188981bde5c6f1fa78b0b9165cd', 'Federación de Mujeres Cubanas', 'FMC', '505-0-00505', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(181, '9c79f4016ce3e1d76bfcb31a34ddfae7', 'Comité de Defensa de la Revolución', 'CDR', '506-0-00506', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(182, '1221501053dc4bdf7831127ee72a15af', 'Asociación Nacional de Agricultores Pequeños', 'ANAP', '507-0-00507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(183, '24495e2ab7ec25c1307eebe56d67bf2c', 'Grupo Empresarial PALCO', 'GRUPO PALCO', '654-0-00654', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(184, 'fd24dfc5d37878796db464f7d0118ff9', 'GRUPO AZUCARERO', 'AZCUBA', '658-0-00658', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(185, '732feefa55ba835e7f680cb44db24124', 'Grupo de las Industrias Biotecnológica y Farmacéutica', 'BIOCUBAFARMA', '692-0-00692', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(186, '94808bafbf8386585acb7b700d8b3213', 'GRUPO EMPRESARIAL CENTRO HISTORICO', 'GRUPO CTROHIST', '700-0-00700', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(187, 'eb12f8c220da8c01ef20206a20c79a83', 'No se subordina a un Organismo', 'NOSUBORDINAD', '998-0-00998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(188, '68350e4c5aa0cd609a874308e27f2f67', 'Organismo Desconocido', 'DESCONOCIDO', '999-0-00999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `zab_entity` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_entityuserrelation
DROP TABLE IF EXISTS `zab_entityuserrelation`;
CREATE TABLE IF NOT EXISTS `zab_entityuserrelation` (
  `entity_id` bigint(20) NOT NULL,
  `sf_guard_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`entity_id`,`sf_guard_user_id`),
  KEY `zab_entityuserrelation_sf_guard_user_id_sf_guard_user_id` (`sf_guard_user_id`),
  CONSTRAINT `zab_entityuserrelation_entity_id_zab_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `zab_entity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_entityuserrelation_sf_guard_user_id_sf_guard_user_id` FOREIGN KEY (`sf_guard_user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_entityuserrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_entityuserrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zab_entityuserrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_event
DROP TABLE IF EXISTS `zab_event`;
CREATE TABLE IF NOT EXISTS `zab_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `allday` tinyint(1) DEFAULT 0,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `calendarid` bigint(20) DEFAULT NULL,
  `reminderid` bigint(20) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `calendarid_idx` (`calendarid`),
  KEY `reminderid_idx` (`reminderid`),
  CONSTRAINT `zab_event_calendarid_zab_calendar_id` FOREIGN KEY (`calendarid`) REFERENCES `zab_calendar` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_event_reminderid_zab_reminder_id` FOREIGN KEY (`reminderid`) REFERENCES `zab_reminder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_event: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_event` DISABLE KEYS */;
INSERT INTO `zab_event` (`id`, `code`, `name`, `comment`, `allday`, `start`, `end`, `calendarid`, `reminderid`, `location`, `link`) VALUES
	(1, '0d57c220a3ef147e1cf35430e303a603', 'Vacaciones', 'Tiempo de diversion...', 0, '2020-11-28 14:00:00', '2020-12-09 15:00:00', 2, 1, NULL, NULL),
	(2, '40336cf3edc079a4f64446dffa121fdb', 'Almuerzo con Dcita', 'Debo estar una hora antes en el restaurant', 0, '2020-12-19 11:30:00', '2020-12-19 13:00:00', 1, 1, NULL, NULL),
	(3, '9ff0c2c742ef6eff9ebb0a8160898008', 'Pagar la electricidad', NULL, 0, '2020-12-19 15:00:00', '2020-12-19 15:00:00', 1, NULL, NULL, NULL),
	(4, 'd61915029953cccd22cc4df817b398c8', 'Cumpleaños de Mayra', 'Hay q comprar un regalo', 1, '2020-12-19 00:00:00', '2020-12-19 00:00:00', 2, NULL, NULL, NULL),
	(5, 'bdbcb6692ff90ceeb50a26847d306f2f', 'Hacer ejercicios', NULL, 1, '2020-12-07 00:00:00', '2020-12-28 23:59:59', 1, NULL, NULL, NULL),
	(6, 'e141a4c2bd74aa2c4efd27d07541c718', 'Pelarme', NULL, 0, '2020-12-19 09:00:00', '2020-12-19 09:30:00', 2, NULL, NULL, NULL),
	(7, '4cbf1a8c26a033b0331597a48c3187a1', 'Consejo de direccion', NULL, 0, '2020-12-17 13:00:00', '2020-12-17 18:00:00', 1, NULL, NULL, NULL),
	(8, '43568a3b57377c8866c644f3707a12aa', 'Noche de peliculas', NULL, 0, '2020-12-21 19:00:00', '2020-12-21 23:00:00', 2, NULL, NULL, NULL),
	(9, '3ff2953c341b75df009234886ae7019f', 'Forum nacional', NULL, 0, '2020-12-27 08:00:00', '2021-01-01 16:00:00', 3, NULL, 'Ciudad de la Habana', 'www.forum.cuba.cu');
/*!40000 ALTER TABLE `zab_event` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_file
DROP TABLE IF EXISTS `zab_file`;
CREATE TABLE IF NOT EXISTS `zab_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `url` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_file: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `zab_file` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_metadata
DROP TABLE IF EXISTS `zab_metadata`;
CREATE TABLE IF NOT EXISTS `zab_metadata` (
  `name` varchar(50) NOT NULL,
  `comment` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_metadata: ~37 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_metadata` DISABLE KEYS */;
INSERT INTO `zab_metadata` (`name`, `comment`, `value`, `category`, `is_visible`) VALUES
	('app_authldapfilterdn', 'Establece la ubicación de los usuarios en el LDAP', 'OU=Unit,DC=domain,DC=com', 'LDAP', 1),
	('app_authldaprootdn', 'Establece la ubicación del usuario de búsqueda en el LDAP', 'CN=Users,DC=domain,DC=com', 'LDAP', 1),
	('app_authldapsearchinguser', 'Establece el usuario usado para realizar la conexión con el LDAP', 'administrador', 'LDAP', 1),
	('app_authldapsearchinguserpass', 'Establece la contraseña del usuario usado para realizar la conexión con el LDAP', 'C0ntrasenna', 'LDAP', 1),
	('app_authldapserver', 'Permite definir el Nombre o Dirección IP del servidor LDAP', '192.168.3.22', 'LDAP', 1),
	('app_authmode', 'Establece el tipo de autenticación a usar en el sistema: "local" (sin comillas) para usar la base de datos, "ldap" (sin comillas) para usar un directorio activo y "mixed" (sin comillas) para combinar ambos métodos', 'local', 'Seguridad', 1),
	('app_businessmail', 'Permite definir la cuenta de correo que será utilizada para la realización de las transferencias de pago mediante PayPal y para el envío de las notificaciones generadas por el sistema.', 'zentro@nauta.cu', 'Sistema', 1),
	('app_characteramounttofind', 'Permite definir a partir de cuántos caracteres se realizan búsquedas', '1', 'Sistema', 1),
	('app_closureconfig', 'Configuracion de moviemiento de saldos entre cuentas al realizar cierre contable', '[{"fromaccount":{"id":"61","code":"40","name":"GRUPO DE CUENTAS NOMINALES","comment":"","path":"/NULL/61","parentid":null,"costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":"","entityid":"1","customicon":null,"leaf":"0","qtip":"GRUPO DE CUENTAS NOMINALES","text":"GRUPO DE CUENTAS NOMINALES","virtual":null,"deleteable":"1","loader":false,"qtipTitle":"40","iconCls":"icon-money"},"toaccount":{"id":"78","code":"50.999","name":"Resultado","comment":"Esta cuenta refleja al final del periodo contable, el resultado obtenido por el TCP en esta actividad, bien sea utilidad o perdida, producto del cierre de los saldos de las cuentas nominales","path":"/NULL/77/78","parentid":"77","costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":"","entityid":"1","Account":{"id":"77","code":"ME1->50","name":"CUENTA DE CIERRE","comment":"","path":"/NULL/77","parentid":null,"costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":null,"entityid":"1"},"customicon":null,"leaf":"1","qtip":"Resultado","text":"Resultado","virtual":null,"deleteable":"1","loader":false,"qtipTitle":"50.999","iconCls":"icon-money_open"}},{"fromaccount":{"id":"78","code":"50.999","name":"Resultado","comment":"Esta cuenta refleja al final del periodo contable, el resultado obtenido por el TCP en esta actividad, bien sea utilidad o perdida, producto del cierre de los saldos de las cuentas nominales","path":"/NULL/77/78","parentid":"77","costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":"","entityid":"1","Account":{"id":"77","code":"ME1->50","name":"CUENTA DE CIERRE","comment":"","path":"/NULL/77","parentid":null,"costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":null,"entityid":"1"},"customicon":null,"leaf":"1","qtip":"Resultado","text":"Resultado","virtual":null,"deleteable":"0","loader":false,"qtipTitle":"50.999","iconCls":"icon-money_open"},"toaccount":{"id":"59","code":"30.610","name":"Utilidad Retenida","comment":"Utilidades obtenidas enel periodo contable para su distribucion","path":"/NULL/52/59","parentid":"52","costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":"","entityid":"1","Account":{"id":"52","code":"ME1->30","name":"GRUPO DE PATRIMONIO","comment":"","path":"/NULL/52","parentid":null,"costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":null,"entityid":"1"},"customicon":null,"leaf":"1","qtip":"Utilidad Retenida","text":"Utilidad Retenida","virtual":null,"deleteable":"0","loader":false,"qtipTitle":"30.610","iconCls":"icon-money_open"},"condition":"Saldo positivo","conditionvalue":"balanceplus"},{"fromaccount":{"id":"78","code":"50.999","name":"Resultado","comment":"Esta cuenta refleja al final del periodo contable, el resultado obtenido por el TCP en esta actividad, bien sea utilidad o perdida, producto del cierre de los saldos de las cuentas nominales","path":"/NULL/77/78","parentid":"77","costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":"","entityid":"1","Account":{"id":"77","code":"ME1->50","name":"CUENTA DE CIERRE","comment":"","path":"/NULL/77","parentid":null,"costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":null,"entityid":"1"},"customicon":null,"leaf":"1","qtip":"Resultado","text":"Resultado","virtual":null,"deleteable":"0","loader":false,"qtipTitle":"50.999","iconCls":"icon-money_open"},"toaccount":{"id":"60","code":"30.620","name":"Perdida","comment":"Resultado negativo obtenido en cada periodo contable","path":"/NULL/52/60","parentid":"52","costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":"","entityid":"1","Account":{"id":"52","code":"ME1->30","name":"GRUPO DE PATRIMONIO","comment":"","path":"/NULL/52","parentid":null,"costcenterid":null,"elementid":null,"nature":false,"manualcode":true,"icon":null,"entityid":"1"},"customicon":null,"leaf":"0","qtip":"Perdida","text":"Perdida","virtual":null,"deleteable":"1","loader":false,"qtipTitle":"30.620","iconCls":"icon-money"},"condition":"Saldo negativo","conditionvalue":"balanceminus"}]', 'Negocio', 0),
	('app_currencycode', 'Permite definir la moneda base con la que contabiliza el sistema.', 'CUP', 'Negocio', 1),
	('app_defaultlanguaje', 'Define el idioma en que por defecto se cargarán las interfaces del sistema aun cuando pueden ser variadas localmente mediante el uso de la Barra superior.', 'es-Es', 'Sistema', 1),
	('app_elementsongrid', 'Establece la cantidad de elementos a mostrar en una página de interfaz tabular correspondiente al área de trabajo. De esta forma el sistema se encarga de generar la paginación que entre otras cosas permite elevar el rendimiento de las consultas realizadas a las bases de datos.', '20', 'Tablas de datos', 1),
	('app_fileintegrity', 'Establece la suma de chequeo de integridad de los archivos del sistema', 'ee71b4b08d497ab9f4ebc2735d8e3fea', 'Archivos', 0),
	('app_filemaxsize', 'Establece el tamaño (en bytes) máximo de los archivos subidos del sistema', '50242880', 'Archivos', 1),
	('app_filereadcontent', 'Permite definir la forma de leer los contenidos de un archivo. ("text" solo texto y "all" todo el contenido)', 'text', 'Archivos', 0),
	('app_indexablefiles', 'Permite definir los tipos de archivos subidos al servidor que seran indexados para búsquedas. Deben ser especificados separados por coma.', 'doc,docx,xls,xlsx,pdf', 'Archivos', 0),
	('app_ismultientidable', 'Permite definir si el sistema debe comportarse como multientidad: 0 (NO ES MULTIENTIDAD), 1 (ES MULTIENTIDAD), 2 (ES MULTIENTIDAD EXCLUSIVO SOLO DE UNA DE ELLAS)', '1', 'Sistema', 1),
	('app_lockaccountfor', 'Permite definir el tiempo en segundos por el que se bloquea a los usuarios que superan el máximo de intentos fallidos de autenticación', '300', 'Seguridad', 1),
	('app_mailencryption', 'Establece el Tipo de Encriptado utilizado por el servidor de correo: ~, ssl, tls', '~', 'Correo', 1),
	('app_mailhost', 'Establece el Nombre o la Dirección IP del servidor de correo', '127.0.0.1', 'Correo', 1),
	('app_mailhostport', 'Establece el Puerto por el que escucha el servidor de correo', '1111', 'Correo', 1),
	('app_mailpassword', 'Establece el la Contraseña del usuario de correo utilizado para enviar las notificaciones', '', 'Correo', 1),
	('app_mailstrategy', 'Establece el la estrategia de envío de correos notificaciones: "queue" (sin comillas) para encolarlos y enviarlos mediante tarea programada del sistema y "realtime" (sin comillas) para entrega en tiempo real', 'queue', 'Correo', 1),
	('app_mailusername', 'Establece el Usuario de correo utilizado para enviar las notificaciones', 'administrador@domain.com', 'Correo', 1),
	('app_multientityid', 'Permite definir el id de la entidad base para un sistema con multientidad exclusiva (app_ismultientidable = 2)', '44', 'Sistema', 0),
	('app_name', 'Permite variar el nombre del sistema mostrado el banner superior', 'Zentro&reg; Gestor Integral', 'Sistema', 0),
	('app_notificationrefreshperiod', 'Permite definir cada cuantos segundos se recargarán los datos del panel de notificaciones', '60', 'Sistema', 0),
	('app_sendsystememails', 'Permite definir si el sistema enviará notificaciones por correo o no', '', 'Sistema', 1),
	('app_showgridtitle', 'Permite personalizar las vistas de las interfaces de gestión usando o no los títulos en las tablas.', '1', 'Tablas de datos', 1),
	('app_showmessageonformloadfailed', 'Permite establecer si el sistema mostrará mensajes de notificación cuando NO se hayan cargado datos a un formulario satisfactoriamente', '1', 'Notificaciones', 1),
	('app_showmessageonformloadposition', 'Permite establecer cómo el sistema mostrará mensajes de notificación (top: notificacion superior, window: en una ventana de información).', 'top', 'Notificaciones', 1),
	('app_showmessageonformloadsuccessful', 'Permite establecer si el sistema mostrará mensajes de notificación cuando se hayan cargado datos a un formulario satisfactoriamente', '', 'Notificaciones', 1),
	('app_showmessageonmoduleloadsuccessful', 'Permite establecer si el sistema mostrará mensajes de notificación cuando se active un módulo satisfactoriamente', '1', 'Notificaciones', 1),
	('app_showmessageonstoreloadfailed', 'Permite establecer si el sistema mostrará mensajes de notificación cuando NO se hayan cargado satisfactoriamente las fuentes de datos', '1', 'Notificaciones', 1),
	('app_showmessageonstoreloadsuccessful', 'Permite establecer si el sistema mostrará mensajes de notificación cuando se hayan cargado satisfactoriamente las fuentes de datos', '', 'Notificaciones', 1),
	('app_unsuccessfulloginattempts', 'Permite definir la cantidad de intentos de autenticación fallidos antes de bloquear el acceso al usuario', '3', 'Seguridad', 1),
	('app_uploadimagedestination', 'Permite definir el lugar donde se desean guardar las imagenes de usuarios del sistema. ("file" como archivos y "db" en la base de datos)', 'file', 'Archivos', 1);
/*!40000 ALTER TABLE `zab_metadata` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_module
DROP TABLE IF EXISTS `zab_module`;
CREATE TABLE IF NOT EXISTS `zab_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `nick` varchar(130) NOT NULL,
  `icon` varchar(130) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `attributes` text DEFAULT NULL,
  `relations` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_multientity` tinyint(1) DEFAULT 0,
  `is_multientidable` tinyint(1) DEFAULT 0,
  `is_base` tinyint(1) DEFAULT 0,
  `parentid` bigint(20) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `increase` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parentid_idx` (`parentid`),
  CONSTRAINT `zab_module_parentid_zab_module_id` FOREIGN KEY (`parentid`) REFERENCES `zab_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_module: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_module` DISABLE KEYS */;
INSERT INTO `zab_module` (`id`, `code`, `name`, `nick`, `icon`, `comment`, `attributes`, `relations`, `is_active`, `is_multientity`, `is_multientidable`, `is_base`, `parentid`, `path`, `increase`) VALUES
	(1, 'd1a48b493ed7a0c9249cead5cc6ec205', 'Contratación', 'Contractorall', 'page_attach.png', 'Agrupación de nomencladores necesarios para la gestión de la Contratación', NULL, NULL, 1, 0, 0, 1, NULL, NULL, '00000000030'),
	(2, 'f77828c55becd4d2013f22bfbf5ccf94', 'Configuración', 'Metadata', 'wtop-config.png', 'Configuraci&oacute;n general del sistema', NULL, NULL, 1, 0, 0, 1, NULL, NULL, '0000000940'),
	(3, 'a95374dafe28f54b7ce7729f8378c819', 'Módulos', 'Module', 'wtop-modules.png', 'Gestión de módulos del sistema', '[{"name":"Código","nick":"code","type":"string","restriction":"","nulleable":false},{"name":"Nombre","nick":"name","type":"string","restriction":"","nulleable":false},{"name":"Alias","nick":"nick","type":"string","restriction":"","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":false},{"name":"Ícono","nick":"icon","type":"string","restriction":"","nulleable":true}]', NULL, 0, 0, 0, 1, 2, NULL, '1000000140'),
	(4, '0abc28bcb832a6bbd1c673309cbad21a', 'Usuarios', 'User', 'wtop-users.png', 'Gestión de usuarios del sistema', NULL, NULL, 1, 0, 0, 1, 2, NULL, '0000000930'),
	(5, '1b57cc8f13c60c87a1c96d8f6d538c20', 'Tipos de contacto', 'Contacttype', 'telephone.png', 'Gestión de tipos de contacto', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 2, NULL, '0000000920'),
	(6, 'cb3e4ecbdf632ed82b6921f0a57bc48d', 'Contabilidad General', 'Accountantall', 'coins.png', 'Agrupación de nomencladores necesarios para la gestión de la Contabilidad de las entidades', NULL, NULL, 1, 0, 0, 1, NULL, NULL, '00000000034'),
	(7, '9d0d42d740a7b6f565d40c1c20ec791b', 'Contabilidad de la Entidad', 'Accountantentity', 'coins.png', 'Agrupación de módulos para la gestión de la Contabilidad de la entidad', NULL, NULL, 1, 0, 1, 1, NULL, NULL, '00000000032'),
	(8, 'e7af0863035207943f53f63d68f6f170', 'Gráficos', 'Chart', 'wtop-charts.png', 'Generador de gráficos del sistema', NULL, NULL, 0, 0, 0, 1, NULL, NULL, '1000000080'),
	(9, 'a6d080f2730d57c1da1e777002102139', 'Calendario', 'Calendar', 'wtop-calendars.png', 'Visor de eventos del sistema', '[{"name":"Nombre","nick":"name","type":"string","restriction":"","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":false}]', NULL, 0, 0, 0, 1, NULL, NULL, '1000000090'),
	(10, 'a7c68a28d40f282bae2ee54b5abcb65a', 'Recordatorios', 'Reminder', 'wtop-reminders.png', 'Gestión de recordatorios del sistema', '[{"name":"Nombre","nick":"name","type":"string","restriction":"","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":false},{"name":"Valor","nick":"value","type":"int","restriction":"","nulleable":false},{"name":"Periodo","nick":"period","type":"int","restriction":"","nulleable":false}]', NULL, 0, 0, 0, 1, 2, NULL, '0000000100'),
	(11, 'bf2d27ca3e7f635e06ac60a586240083', 'Trazas', 'Log', 'wtop-logs.png', 'Auditoría de trazas del sistema', NULL, NULL, 1, 0, 0, 1, NULL, NULL, '0000000950'),
	(12, '88a72558f6d824e814086ec6abd3854c', 'Editor de contenido', 'Contenteditor', 'page_paintbrush.png', 'Editor de contenido', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 0, 0, 0, 1, NULL, NULL, '1000000150'),
	(13, '566e353f89a32c0ff6d3f1374a7d54d1', 'Explorador', 'Explorer', 'wtop-explorer.png', 'Gestión de archivos y carpetas del sistema', '[{"name":"Nombre","nick":"name","type":"string","restriction":"","nulleable":false},{"name":"Fecha de modificación","nick":"lastmod","type":"string","restriction":"","nulleable":false},{"name":"Tamaño","nick":"size","type":"string","restriction":"","nulleable":false}]', NULL, 0, 0, 0, 1, 2, NULL, '1000000160'),
	(14, '80b5b2da7cd15147b2806b3538203255', 'Editor de notas', 'Note', 'page_paintbrush.png', 'Editor de notas', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 0, 0, 0, 1, NULL, NULL, '1000000170'),
	(15, 'ebf0e1820c9faa8e1f121d60ee1585df', 'Entidades', 'Entity', 'building.png', 'Gestión de entidades', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true},{"name":"Padre","nick":"parentid","type":"integer","restriction":"","nulleable":true}]', '[{"attributeid":"parentid","attribute":"Padre","typeid":"onetomany","type":"Uno a muchos","moduleid":"Entity","module":"Entidades"}]', 1, 1, 0, 1, NULL, NULL, '0000000100'),
	(16, '5ccc852b901c562665fa9adc13dbf9fc', 'Localizaciones', 'Location', 'flag_orange.png', 'Gestión de localizaciones', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true},{"name":"Padre","nick":"parent","type":"integer","restriction":"","nulleable":true}]', '[{"attributeid":"parent","attribute":"Padre","typeid":"onetomany","type":"Uno a muchos","moduleid":"Location","module":"Ã?rbol paginado"}]', 1, 0, 0, 0, 15, NULL, '0000000300'),
	(17, '0cd47242730f4a8d9303792453fe71e3', 'Tipos de entidad', 'Entitytype', 'shape_align_left.png', 'Gestión de tipos de entidad', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 15, NULL, '0000000200'),
	(18, 'dad5bebc4467f517ec979ae98f54c87e', 'Monedas', 'Currency', 'money.png', 'Gestión de monedas', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 6, NULL, '0000000830'),
	(19, '531034c747663a655b4951f529e3172a', 'Actividades', 'Activity', 'book_open.png', 'Gestión de actividades', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 15, NULL, '0000000900'),
	(20, '20a72bd0f94e7ad70b142fdf7cfec2ba', 'Tipos de documentos', 'Documenttype', 'page_white_stack.png', 'Gestión de tipos de documentos', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 15, NULL, '0000000700'),
	(21, '4def486c760e3feec9e5c8d35c1b22fc', 'Nacionalidades', 'Nationality', 'anchor.png', 'Gestión de nacionalidades', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 15, NULL, '0000000400'),
	(22, '7011b72ac65892653e4e2de53aefba51', 'Instrumentos de pago', 'Paymentinstrument', 'medal_gold_1.png', 'Gestión de instrumentos de pago', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 1, NULL, '0000000600'),
	(23, '44979a4338a33e80b5c2757f0a9ce25b', 'Tipos de reclamaciones', 'Reclamationtype', 'text_signature.png', 'Gestión de tipos de reclamaciones', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 1, NULL, '0000000800'),
	(24, 'c9a1bbee70991b87f97120bed2d893d2', 'Tipos de contrato', 'Contracttype', 'page_white_wrench.png', 'Gestión de tipos de contrato', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 1, NULL, '0000000910'),
	(25, 'd42980e1028280346a73c9cc3ea2d60d', 'Cargos', 'Position', 'vcard.png', 'Gestión de cargos', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 1, 0, NULL, NULL, '00000000930'),
	(26, 'eb550cb3eb8102a82efd806b6a7cb757', 'Contratos', 'Contract', 'page_attach.png', 'Gestión de contratos', '[{"isak":true,"name":"N\\u00famero del contrato","nick":"name","mapping":"Event","type":"string","restriction":"130","nulleable":false},{"name":"Fecha de firma del contrato","nick":"start_with_format","mapping":"Event","type":"date","restriction":"","nulleable":true},{"name":"Fecha de vencimiento del contrato","nick":"end_with_format","mapping":"Event","type":"date","restriction":"","nulleable":true},{"name":"Objeto del contrato","nick":"comment","mapping":"Event","type":"string","restriction":"","nulleable":true}]', '[{"attributeid":"","attribute":"Fecha de la computadora al generar el documento","modulenick":"PHP:php,date()","moduleattributeid":"d\\/m\\/Y"},{"attributeid":"contracttypeid","attribute":"Tipo de contrato","typeid":"onetomany","type":"Uno a muchos","moduleid":"Contracttype","module":"Tipos de contrato","moduleattributeid":"name","moduleattribute":"Nombre"},{"attributeid":"contractstatusid","attribute":"Estado del contrato","typeid":"onetomany","type":"Uno a muchos","moduleid":"Contractstatus","module":"Estados de contrato","moduleattributeid":"name","moduleattribute":"Nombre"},{"attributeid":"areaid","attribute":"\\u00c1rea que genera el contrato","typeid":"onetomany","type":"Uno a muchos","moduleid":"Area","module":"\\u00c1reas","moduleattributeid":"name","moduleattribute":"Nombre"},{"attributeid":"providerid","attribute":"Denominaci\\u00f3n\\/Nombre y Apellidos del proveedor","typeid":"onetomany","type":"Uno a muchos","moduleid":"Entity","modulenick":"Provider","module":"Entidades","moduleattributeid":"name","moduleattribute":"Nombre"},{"attribute":"Firmante por el proveedor","modulenick":"ProviderUser;Person","moduleattributeid":"full_name"},{"attribute":"Instrumentos de pago","modulenick":"Paymentinstruments:decode[name],"},{"attributeid":"","attribute":"Direcci\\u00f3n del proveedor","modulenick":"Provider","moduleattributeid":"address"},{"attributeid":"","attribute":"Localizaci\\u00f3n del proveedor","modulenick":"Provider;Location","moduleattributeid":"name"},{"attributeid":"","attribute":"Nacionalidad del proveedor","modulenick":"Provider;Nationality","moduleattributeid":"name"},{"attributeid":"","attribute":"Abreviatura\\/Carn\\u00e9 de Identidad del proveedor","modulenick":"Provider","moduleattributeid":"shortname"},{"attributeid":"","attribute":"REEUP\\/Patente del proveedor","modulenick":"Provider","moduleattributeid":"specialcode"},{"attributeid":"","attribute":"NIT del proveedor","modulenick":"Provider","moduleattributeid":"nit"},{"attributeid":"","attribute":"NIT del proveedor","modulenick":"Provider","moduleattributeid":"nit"},{"attributeid":"","attribute":"Cuentas del proveedor","modulenick":"Provider:decode[name,officetitle,office,accounttitle,account,currencytitle,currency],accounts","moduleattributeid":"profile"},{"attributeid":"","attribute":"Contactos del proveedor","modulenick":"Provider:decode[name,value],contacts","moduleattributeid":"profile"},{"attributeid":"","attribute":"Constituci\\u00f3n del proveedor","modulenick":"Provider:object[document{name,number,date}],metadatas","moduleattributeid":"profile"},{"attributeid":"","attribute":"Inscripci\\u00f3n en el registro mercantil del proveedor","modulenick":"Provider:object[reeup{tomotitle,tomo,foliotitle,folio,pagetitle,datetitle,date}],metadatas","moduleattributeid":"profile"},{"attributeid":"","attribute":"Licencia para operar en divisa del proveedor","modulenick":"Provider:object[cuc{numbertitle,number,datetitle,date}],metadatas","moduleattributeid":"profile"},{"attributeid":"","attribute":"Actividades del proveedor","modulenick":"Provider:decode[name,value],activities","moduleattributeid":"profile"},{"attributeid":"","attribute":"Forma de pago del proveedor","modulenick":"Provider:decodeid[name,value],paymentways","moduleattributeid":"profile"},{"attributeid":"","attribute":"Entrega del proveedor","modulenick":"Provider:decodeid[name,value],paymentplaces","moduleattributeid":"profile"},{"attributeid":"","attribute":"Cargo del firmante por el proveedor","modulenick":"ProviderPosition:decode[name,documenttype,metadata],positions","moduleattributeid":"profile"},{"attributeid":"clientid","attribute":"Denominaci\\u00f3n\\/Nombre y Apellidos del cliente","typeid":"onetomany","type":"Uno a muchos","moduleid":"Entity","modulenick":"Client","module":"Entidades","moduleattributeid":"name","moduleattribute":"Nombre"},{"attribute":"Firmante por el cliente","modulenick":"ClientUser;Person","moduleattributeid":"full_name"},{"attributeid":"","attribute":"Direcci\\u00f3n del cliente","modulenick":"Client","moduleattributeid":"address"},{"attributeid":"","attribute":"Localizaci\\u00f3n del cliente","modulenick":"Client;Location","moduleattributeid":"name"},{"attributeid":"","attribute":"Nacionalidad del cliente","modulenick":"Client;Nationality","moduleattributeid":"name"},{"attributeid":"","attribute":"Abreviatura\\/Carn\\u00e9 de Identidad del cliente","modulenick":"Client","moduleattributeid":"shortname"},{"attributeid":"","attribute":"REEUP\\/Patente del cliente","modulenick":"Client","moduleattributeid":"specialcode"},{"attributeid":"","attribute":"NIT del cliente","modulenick":"Client","moduleattributeid":"nit"},{"attributeid":"","attribute":"NIT del cliente","modulenick":"Client","moduleattributeid":"nit"},{"attributeid":"","attribute":"Cuentas del cliente","modulenick":"Client:decode[name,officetitle,office,accounttitle,account,currencytitle,currency],accounts","moduleattributeid":"profile"},{"attributeid":"","attribute":"Personas autorizadas a comprar y\\/o firmar facturas","modulenick":"Client:decode[full_name,Person>comment],persons","moduleattributeid":"LegalImportant"},{"attributeid":"","attribute":"Contactos del cliente","modulenick":"Client:decode[name,value],contacts","moduleattributeid":"profile"},{"attributeid":"","attribute":"Constituci\\u00f3n del cliente","modulenick":"Client:object[document{name,number,date}],metadatas","moduleattributeid":"profile"},{"attributeid":"","attribute":"Inscripci\\u00f3n en el registro mercantil del cliente","modulenick":"Client:object[reeup{tomotitle,tomo,foliotitle,folio,pagetitle,datetitle,date}],metadatas","moduleattributeid":"profile"},{"attributeid":"","attribute":"Licencia para operar en divisa del cliente","modulenick":"Client:object[cuc{numbertitle,number,datetitle,date}],metadatas","moduleattributeid":"profile"},{"attributeid":"","attribute":"Actividades del cliente","modulenick":"Client:decode[name,value],activities","moduleattributeid":"profile"},{"attributeid":"","attribute":"Cargo del firmante por el cliente","modulenick":"ClientPosition:decode[name,documenttype,metadata],positions","moduleattributeid":"profile"}]', 1, 0, 1, 0, NULL, NULL, '00000000034'),
	(27, '218adcfd2ba7d5c9fd4feed1dd67e038', 'Áreas', 'Costcenter', 'building.png', 'Gestión de áreas', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true},{"name":"Padre","nick":"parentid","type":"integer","restriction":"","nulleable":true}]', '[{"attributeid":"parentid","attribute":"Padre","typeid":"onetomany","type":"Uno a muchos","moduleid":"Costcenter","module":"Ã?rbol paginado"}]', 1, 0, 1, 0, 7, NULL, '00000000040'),
	(28, '6aa4601e49a56d928205c271b55fd463', 'Elementos', 'Element', 'bricks.png', 'Gestión de elementos', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 1, 0, 7, NULL, '00000000050'),
	(29, '38001b8d078e73b61835c0f1d249e66c', 'Unidades de medida', 'Um', 'text_letterspacing.png', 'Gestión de unidades de medida', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 0, 0, 6, NULL, '0000000830'),
	(30, '2c5b0d062fba06bb31a98e9c6dbc616c', 'Estados de contrato', 'Contractstatus', 'page_paintbrush.png', 'Gestión de los estados de contrato', '[{"name":"Código","nick":"code","type":"string","restriction":"","nulleable":false},{"name":"Nombre","nick":"name","type":"string","restriction":"","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":false}]', NULL, 1, 0, 1, 0, 26, NULL, '0000000040'),
	(31, '4eb201028302f05620abcadacda5183a', 'Estados de reclamaciones', 'Reclamationstatus', 'comment.png', 'Gestión de los estados de reclamaciones', '[{"name":"Código","nick":"code","type":"string","restriction":"","nulleable":false},{"name":"Nombre","nick":"name","type":"string","restriction":"","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":false}]', NULL, 1, 0, 1, 0, 26, NULL, '0000000800'),
	(32, '8a0bef7f00c29abd6db19b3f97166a33', 'Plantillas', 'Format', 'rainbow.png', 'Gestión de plantillas', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 1, 0, 26, NULL, '0000000030'),
	(33, 'a1bc2d6ebcc1280df1d2d35cb69eb038', 'Personas', 'Person', 'user.png', 'Gestión de personas de la entidad', NULL, NULL, 1, 0, 1, 1, NULL, NULL, '00000000900'),
	(34, '6d1832aa44593693a1dd7b5c6aa29627', 'Facturas', 'Invoice', 'script_edit.png', 'Gestión de facturas', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 1, 0, NULL, NULL, '00000000020'),
	(35, 'c944b62fb3b139ee372966b9c2cfbd55', 'Comprobantes de operaciones', 'Comprobant', 'page_copy.png', 'Gestión de comprobantes de operaciones', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 1, 0, 7, NULL, '00000000020'),
	(36, '8e802ff76d88148c2a8b99085d6c168f', 'Balances de comprobación', 'Transaction', 'map.png', 'Balances de comprobación de saldos', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true},{"name":"Cantidad","nick":"amount","type":"decimal","restriction":""}]', NULL, 0, 0, 1, 0, 7, NULL, NULL),
	(37, '4ef57fbbc7acfa2e546e427470578117', 'Productos y/o Servicios', 'Product', 'paste_plain.png', 'Gestión de productos y/o servicios', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 1, 0, 34, NULL, '00000000050'),
	(38, '1472e47657724d3d9afd6a3897ffe5fa', 'Impuestos', 'Tax', 'coins.png', 'Gestión de impuestos', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true}]', NULL, 1, 0, 1, 0, NULL, NULL, '00000000930'),
	(39, 'b568e034a58149ab3e8233273bb6714f', 'Entidad', 'Entitymanager', 'building.png', 'Gestión de la entidad', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"50","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true},{"name":"Padre","nick":"parentid","type":"integer","restriction":"","nulleable":true}]', '[{"attributeid":"parentid","attribute":"Padre","typeid":"onetomany","type":"Uno a muchos","moduleid":"Entity","module":"Entidades"}]', 1, 0, 1, 1, NULL, NULL, '00000000010'),
	(40, 'fd634f3522b4d3d915011d95683c8464', 'Nomenclador de cuentas', 'Account', 'money.png', 'Gestión de cuentas, su naturaleza, aperturas y saldos', '[{"ispk":true,"name":"Código","nick":"code","type":"string","restriction":"30","nulleable":false},{"isak":true,"name":"Nombre","nick":"name","type":"string","restriction":"130","nulleable":false},{"name":"Descripción","nick":"comment","type":"string","restriction":"","nulleable":true},{"name":"Padre","nick":"parentid","type":"integer","restriction":"","nulleable":true}]', '[{"attributeid":"parentid","attribute":"Padre","typeid":"onetomany","type":"Uno a muchos","moduleid":"Account","module":"Ã?rbol paginado"}]', 1, 0, 1, 0, 7, NULL, '00000000030');
/*!40000 ALTER TABLE `zab_module` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_moduledependencyrelation
DROP TABLE IF EXISTS `zab_moduledependencyrelation`;
CREATE TABLE IF NOT EXISTS `zab_moduledependencyrelation` (
  `module_id` bigint(20) NOT NULL,
  `dependency_id` bigint(20) NOT NULL,
  PRIMARY KEY (`module_id`,`dependency_id`),
  KEY `zab_moduledependencyrelation_dependency_id_zab_module_id` (`dependency_id`),
  CONSTRAINT `zab_moduledependencyrelation_dependency_id_zab_module_id` FOREIGN KEY (`dependency_id`) REFERENCES `zab_module` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_moduledependencyrelation_module_id_zab_module_id` FOREIGN KEY (`module_id`) REFERENCES `zab_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_moduledependencyrelation: ~58 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_moduledependencyrelation` DISABLE KEYS */;
INSERT INTO `zab_moduledependencyrelation` (`module_id`, `dependency_id`) VALUES
	(1, 3),
	(3, 4),
	(4, 5),
	(6, 3),
	(7, 3),
	(9, 10),
	(10, 4),
	(12, 13),
	(14, 12),
	(15, 5),
	(15, 13),
	(15, 14),
	(15, 16),
	(15, 17),
	(15, 18),
	(15, 19),
	(15, 20),
	(15, 21),
	(16, 13),
	(26, 15),
	(26, 22),
	(26, 23),
	(26, 24),
	(26, 25),
	(26, 27),
	(26, 30),
	(26, 31),
	(26, 32),
	(26, 33),
	(26, 37),
	(27, 28),
	(27, 29),
	(28, 29),
	(32, 12),
	(33, 4),
	(33, 5),
	(33, 20),
	(33, 25),
	(34, 26),
	(34, 35),
	(35, 9),
	(35, 18),
	(35, 27),
	(35, 28),
	(35, 29),
	(35, 36),
	(37, 18),
	(37, 28),
	(37, 38),
	(39, 14),
	(39, 15),
	(40, 9),
	(40, 13),
	(40, 27),
	(40, 28),
	(40, 29),
	(40, 35),
	(40, 36);
/*!40000 ALTER TABLE `zab_moduledependencyrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_modulepermission
DROP TABLE IF EXISTS `zab_modulepermission`;
CREATE TABLE IF NOT EXISTS `zab_modulepermission` (
  `module_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`module_id`,`permission_id`),
  KEY `zab_modulepermission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `zab_modulepermission_module_id_zab_module_id` FOREIGN KEY (`module_id`) REFERENCES `zab_module` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_modulepermission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_modulepermission: ~166 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_modulepermission` DISABLE KEYS */;
INSERT INTO `zab_modulepermission` (`module_id`, `permission_id`) VALUES
	(1, 19),
	(1, 29),
	(1, 30),
	(1, 43),
	(1, 55),
	(1, 56),
	(1, 69),
	(1, 70),
	(1, 71),
	(1, 72),
	(1, 73),
	(1, 74),
	(2, 1),
	(3, 2),
	(3, 61),
	(3, 62),
	(3, 63),
	(4, 3),
	(4, 64),
	(4, 65),
	(4, 66),
	(5, 9),
	(5, 49),
	(5, 67),
	(5, 68),
	(6, 14),
	(6, 15),
	(6, 39),
	(6, 40),
	(6, 75),
	(6, 76),
	(6, 77),
	(6, 78),
	(7, 10),
	(7, 11),
	(7, 12),
	(7, 13),
	(7, 16),
	(7, 35),
	(7, 36),
	(7, 37),
	(7, 38),
	(7, 79),
	(7, 80),
	(7, 81),
	(7, 82),
	(7, 83),
	(7, 84),
	(7, 85),
	(7, 86),
	(7, 87),
	(7, 88),
	(8, 7),
	(9, 8),
	(10, 8),
	(11, 5),
	(12, 2),
	(12, 61),
	(12, 62),
	(12, 63),
	(13, 6),
	(14, 2),
	(14, 61),
	(14, 62),
	(14, 63),
	(15, 17),
	(15, 41),
	(15, 89),
	(15, 90),
	(16, 26),
	(16, 52),
	(16, 91),
	(16, 92),
	(17, 27),
	(17, 53),
	(17, 93),
	(17, 94),
	(18, 15),
	(18, 40),
	(18, 75),
	(18, 76),
	(19, 24),
	(19, 50),
	(19, 95),
	(19, 96),
	(20, 28),
	(20, 54),
	(20, 97),
	(20, 98),
	(21, 18),
	(21, 42),
	(21, 99),
	(21, 100),
	(22, 19),
	(22, 43),
	(22, 69),
	(22, 70),
	(23, 29),
	(23, 55),
	(23, 71),
	(23, 72),
	(24, 30),
	(24, 56),
	(24, 73),
	(24, 74),
	(25, 31),
	(25, 57),
	(25, 101),
	(25, 102),
	(26, 32),
	(26, 58),
	(26, 103),
	(26, 104),
	(27, 12),
	(27, 37),
	(27, 85),
	(27, 86),
	(28, 13),
	(28, 38),
	(28, 87),
	(28, 88),
	(29, 14),
	(29, 39),
	(29, 77),
	(29, 78),
	(30, 22),
	(30, 47),
	(30, 105),
	(30, 106),
	(31, 23),
	(31, 48),
	(31, 107),
	(31, 108),
	(32, 20),
	(32, 44),
	(32, 109),
	(32, 110),
	(33, 4),
	(33, 45),
	(33, 111),
	(33, 112),
	(34, 34),
	(34, 60),
	(34, 113),
	(34, 114),
	(35, 11),
	(35, 36),
	(35, 83),
	(35, 84),
	(36, 16),
	(37, 13),
	(37, 38),
	(37, 87),
	(37, 88),
	(38, 33),
	(38, 59),
	(38, 115),
	(38, 116),
	(39, 17),
	(39, 117),
	(40, 10),
	(40, 35),
	(40, 79),
	(40, 80),
	(40, 81),
	(40, 82);
/*!40000 ALTER TABLE `zab_modulepermission` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_note
DROP TABLE IF EXISTS `zab_note`;
CREATE TABLE IF NOT EXISTS `zab_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `json` longtext DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `entityid` text DEFAULT NULL,
  `entity` text DEFAULT NULL,
  `increase` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id_idx` (`person_id`),
  KEY `parentid_idx` (`parentid`),
  CONSTRAINT `zab_note_parentid_zab_note_id` FOREIGN KEY (`parentid`) REFERENCES `zab_note` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_note_person_id_zab_person_id` FOREIGN KEY (`person_id`) REFERENCES `zab_person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_note: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `zab_note` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_person
DROP TABLE IF EXISTS `zab_person`;
CREATE TABLE IF NOT EXISTS `zab_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `picture` text DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `baseline` text DEFAULT NULL,
  `rate` decimal(18,2) DEFAULT NULL,
  `extrarate` decimal(18,2) DEFAULT NULL,
  `positionid` bigint(20) DEFAULT NULL,
  `sf_guard_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `sf_guard_user_id_idx` (`sf_guard_user_id`),
  KEY `positionid_idx` (`positionid`),
  CONSTRAINT `zab_person_positionid_zi1_position_id` FOREIGN KEY (`positionid`) REFERENCES `zi1_position` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zab_person_sf_guard_user_id_sf_guard_user_id` FOREIGN KEY (`sf_guard_user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_person: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_person` DISABLE KEYS */;
INSERT INTO `zab_person` (`id`, `code`, `comment`, `picture`, `profile`, `baseline`, `rate`, `extrarate`, `positionid`, `sf_guard_user_id`) VALUES
	(1, '81092719101', '81092719101', './uploads/avatars/cutemale.png', '{"contacts":[],"positions":[],"legalrepresentant":true,"legalimportant":false}', NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `zab_person` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zab_reminder
DROP TABLE IF EXISTS `zab_reminder`;
CREATE TABLE IF NOT EXISTS `zab_reminder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  `period` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zab_reminder: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `zab_reminder` DISABLE KEYS */;
INSERT INTO `zab_reminder` (`id`, `code`, `name`, `comment`, `value`, `period`) VALUES
	(1, '756a6b48859d658ec3677872a53fc934', 'Al inicio', 'Avisar en el momento de inicio del evento', 0, 1),
	(2, '9be1b75865373d2ea6c48ce39d5041de', '5 minutos', 'Avisar cinco minutos antes del inicio del evento', 5, 1),
	(3, '0eba28b497bd9a2719838c64fa2da75a', '15 minutos', 'Avisar quince minutos antes del inicio del evento', 15, 1),
	(4, 'af50f6844262a64524344ed43e4e57ab', '30 minutos', 'Avisar media hora antes del inicio del evento', 30, 1),
	(5, '6528b3bfd5e926a2146ff8237c759a07', '1 hora', 'Avisar una hora antes del inicio del evento', 1, 2),
	(6, '28e3e9a4319d4e0ae062a0e79fba6eca', '2 horas', 'Avisar dos horas antes del inicio del evento', 2, 2),
	(7, '734856e2910d50a0ff28d267659c87c0', '12 horas', 'Avisar doce horas antes del inicio del evento', 12, 2),
	(8, '97174f95fec450fb8a789f8a3c6cfb4d', '1 dia', 'Avisar un dia antes del inicio del evento', 1, 3),
	(9, '47945f7637940feee7369351aeac3aed', '2 dias', 'Avisar dos dias antes del inicio del evento', 2, 3),
	(10, 'dab3c7d8a981b8a30f2f0ffe96584f80', '1 semana', 'Avisar una semana antes del inicio del evento', 1, 4),
	(11, 'd46ee87531f388b6a745fca5bdc86c44', '2 semanas', 'Avisar dos semanas antes del inicio del evento', 2, 4),
	(12, 'b6c87ba0a8df385e1f3831a40ea6951a', '1 mes', 'Avisar un mes antes del inicio del evento', 1, 5),
	(13, 'bede15262f936e48f8a6a5aeddddd2ce', '1 año', 'Avisar un año antes del inicio del evento', 1, 6);
/*!40000 ALTER TABLE `zab_reminder` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_activity
DROP TABLE IF EXISTS `zgctr_activity`;
CREATE TABLE IF NOT EXISTS `zgctr_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_activity: ~188 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_activity` DISABLE KEYS */;
INSERT INTO `zgctr_activity` (`id`, `code`, `name`, `comment`) VALUES
	(1, '1dbfbe975b980e79b5c31fb478e2e46f', 'Elaborador vendedor de alimentos y bebidas mediante servicio gastronomico en Restaurantes (Paladares).', NULL),
	(2, '21d50338669894d4ed1bb966875a807d', 'Elaborador vendedor de alimentos y bebidas no alcoholicas a domicilio.', NULL),
	(3, 'bf97399629e413f1a55028ab1fa5a5ef', 'Elaborador vendedor de alimentos y bebidas en punto fijo de venta (Cafeteria).', NULL),
	(4, '77a78fde9b8d1f740c3edb7c2e56a416', 'Cafeteria de alimentos ligeros.', NULL),
	(5, '1cee965df43e18ca545f8a08bf86cbfd', 'Elaborador vendedor de vinos.', NULL),
	(6, 'ba37b3f09f1f40eec536b7c68bb7822e', 'Vendedor mayorista de productos agropecuarios.', NULL),
	(7, 'f34f7c25b04c6128c9ac4f1910d3b518', 'Vendedor minorista de productos agropecuarios.', NULL),
	(8, '53c393a03b30b0853f5700f62b825810', 'Artesano.', NULL),
	(9, 'fea72b20bc4ef68a7f92eeed5bd8b3fc', 'Constructor vendedor o reparador de articulos de mimbre.', NULL),
	(10, 'c8479ad1453ab977c0b8d45e7f2e6b2f', 'Elaborador vendedor de jabon, betun, tintas y otros similares.', NULL),
	(11, '4aa9e977ebc0e53fed57ee9263476c9c', 'Productor vendedor de accesorios de goma.', NULL),
	(12, 'eb80e42ac3238de32612bf9161e1d1cb', 'Productor vendedor de articulos de alfareria.', NULL),
	(13, 'db4509e788923df4e64a4c5160eb8261', 'Productor vendedor de articulos de fundicion no ferrosa.', NULL),
	(14, '179cdde69a3af6b7a2856e90ea5009c2', 'Productor vendedor de articulos religiosos (excepto las piezas que tengan valor patrimonial segun regula el Ministerio de Cultura)', NULL),
	(15, '5f41bdaaab6778817af3b2cadffb4505', 'Productor vendedor de bisuteria de metal y recursos naturales.', NULL),
	(16, '3c4fc936dbd6470102cc2a4415bac3b6', 'Productor vendedor de calzado.', NULL),
	(17, '3f9f219b2d0219edfefe691cdcdc902f', 'Talabartero.', NULL),
	(18, 'f4a35268a49cde9d07ffa5cdf093e8de', 'Alquiler de trajes.', NULL),
	(19, '70f04a81df7eb6822ce1ae65c2904e4e', 'Aserrador.', NULL),
	(20, '20a9abd036f1056eea3f88ac1760e638', 'Barbero.', NULL),
	(21, '9205c163a93bcba3f67c775701d4b6d1', 'Bordadora - tejedora.', NULL),
	(22, '755cfb767ceb320346231ff2d920f3d8', 'Cantero.', NULL),
	(23, '0a423dbba38580e6d5ff8a549235480b', 'Chapistero.', NULL),
	(24, '99c2ccb483187a55f9aa5a2905864143', 'Chapistero de bienes muebles.', NULL),
	(25, 'dce19e9abbdeeab0eb981ff1a1a2b8a7', 'Decorador.', NULL),
	(26, '7b738f8800cfae86d2540c340c917d16', 'Elaborador vendedor de articulos de marmol.', NULL),
	(27, '94b3e8de601a25f0153460d9dae18856', 'Electricista automotriz.', NULL),
	(28, '3f0f0215c5adf9267df298d111e5b0fa', 'Enrollador de motores, bobinas, y otros equipos.', NULL),
	(29, '47331e6f387a56d2cc77a5b956fdd253', 'Fotografo.', NULL),
	(30, '00243569f0795d9c038ca065d70bf634', 'Fundidor.', NULL),
	(31, '1979a3893cf62a613d1e7053ac6aa226', 'Herrero.', NULL),
	(32, '1e61ea3409656618cadd3f7e97836f94', 'Manicura.', NULL),
	(33, '3063a463ef16161f6bb9004c2a9feaeb', 'Maquillista.', NULL),
	(34, '521d092a2221e7806ba3baf648399318', 'Mecanico de equipos de refrigeracion.', NULL),
	(35, 'fc3bd2ca78539733edb1829492fe988b', 'Oxicortador.', NULL),
	(36, '082d226c4680b7ca80ed302bce651266', 'Organizador de servicios integrales para fiestas de quince, bodas y otras actividades.', NULL),
	(37, 'e7d0bd72eee035f5a1bc460a7eb8fa69', 'Peluquera.', NULL),
	(38, '2858cc707e4100ad1ee042dac5a512a3', 'Peluquero de animales domesticos.', NULL),
	(39, '663e959351b5d74234a80cafa4564efd', 'Pintor automotriz.', NULL),
	(40, '49838b2d1543c8e953ef1e1224d0e6c6', 'Pintor de bienes muebles o barnizador.', NULL),
	(41, '42a3bfbacd571555d4ff749b329ce17c', 'Pintor rotulista.', NULL),
	(42, '8f7237e582801c8dafd214571ffc6e9c', 'Productor vendedor o recolector vendedor de articulos de alfareria u otros materiales con fines constructivos.', NULL),
	(43, 'a77516d51ad6b01d169fb0895d6cc97b', 'Pulidor de metales.', NULL),
	(44, 'a8942af1301a7149b9f3ec1ec627e435', 'Reparador de articulos de joyeria.', NULL),
	(45, 'c27e418366294ccb5548e1b3365268f5', 'Reparador de colchones.', NULL),
	(46, 'c35f2396db37e5153be8382f68cb1beb', 'Reparador de enseres menores.', NULL),
	(47, '8c3e68fe4867d50a889e680f0e9f61fc', 'Reparador de equipos electricos y electronicos.', NULL),
	(48, '86f517a25774fbf1537f125d077c2797', 'Reparador de equipos mecanicos y de combustion.', NULL),
	(49, '108871d8bc6e2f4eb93f1a741d159bcc', 'Soldador.', NULL),
	(50, '08dbbd52dd473ed0f5462a1e3589ad88', 'Tapicero.', NULL),
	(51, '0d409ce679ba858d4a35534b645d83bb', 'Tornero.', NULL),
	(52, '7a20c4c7cf1fc10943242a0cf8c562d1', 'Restaurador de obras de arte.', NULL),
	(53, 'f792b16e6aea9c4d9f9954302e39da0e', 'Anticuario.', NULL),
	(54, '0f08b9ed5987b51eb4cfd24eb1f9f77d', 'Arrendamiento de viviendas (por habitacion). Modalidad CUC.', NULL),
	(55, 'e797fe41715d49012e7fc5a318866882', 'Arrendamiento de viviendas (por habitacion). Modalidad CUP.', NULL),
	(56, '789493237b87822cdf988c7eff0eafae', 'Arrendamiento de habitaciones (por habitacion). Modalidad CUC.', NULL),
	(57, 'bd5958e08a3def76cffd63a765909329', 'Arrendamiento de habitaciones (por habitacion). Modalidad CUP.', NULL),
	(58, '465c52811e0af1556baeb46528998189', 'Arrendamiento de espacios: Garaje (Uno). Modalidad CUC.', NULL),
	(59, '550e96e585857a8e19cee2699cbec47d', 'Arrendamiento de espacios: Garaje (Uno). Modalidad CUP.', NULL),
	(60, '37304c901d62899075328afeac77e128', 'Arrendamiento de espacios: Piscina (Por m2). Modalidad CUC.', NULL),
	(61, '80010a00f6baf93c4476f43d627ee3f4', 'Arrendamiento de espacios: Piscina (Por m2). Modalidad CUP.', NULL),
	(62, '4f692c9dcf068e65b5ba569f6eaf6b76', 'Arrendamiento de espacios: Otros espacios. Modalidad CUC.', NULL),
	(63, '5cee0049de738de95e7f8706e1f5d3c7', 'Alquiler de animales.', NULL),
	(64, '7bbbfddd220406e77ea4a6daa5ed9dd0', 'Animador de fiestas, payasos o magos.', NULL),
	(65, '11440993ed25fb5cd3efcdc65aa123aa', 'Servicio de coche de uso infantil tirado por animales.', NULL),
	(66, '5f486bede6f305db241f4a8f4e17121c', 'Criador vendedor de animales afectivos.', NULL),
	(67, '381796af67c7779dd81bb13bac056274', 'Instructor de practicas deportivas.', NULL),
	(68, 'f2dc542477f809e2d2a9821a9db1262f', 'Operador de audio.', NULL),
	(69, '7227c62edafb4f59688088acbecf3bb7', 'Operador de equipos de recreacion.', NULL),
	(70, '3d8cb7790b69ff1552874cf7d12306a4', 'Productor, recolector vendedor de hierbas para alimento animal o Productor, recolector vendedor de hierbas medicinales.', NULL),
	(71, 'd3f36e32bf2b37206f2fa71bcd710cb4', 'Productor vendedor de flores y plantas ornamentales.', NULL),
	(72, '04e5238ee0d2f39a33d353a07af2cde1', 'Profesor de musica y otras artes.', NULL),
	(73, '5d6f1b871ce6b68e42da3d977c6f1b0f', 'Programador de equipos de computo.', 'Res. Org. Rector: 42/2013. Res. MFP: 353/2013.'),
	(74, '7b28df2f54c1fd390f32666412f266fc', 'Gestor de permutas y compra-venta de viviendas.', NULL),
	(75, '784f3a6ab20b7e39fdde2668decc6d9b', 'Albañil.', NULL),
	(76, 'f32654ee87b882fa1190ce436547b9fb', 'Carpintero.', NULL),
	(77, 'b0c5f48b668708ade697b7f8b19b8fd5', 'Cristalero.', NULL),
	(78, '4b2a84a2d7cec0e904ea4d3d60001bcb', 'Electricista.', NULL),
	(79, '4be4df393a020a83f022103f400aa031', 'Plomero.', NULL),
	(80, '5f1a9cb7b645654218cd8e0f9134d47f', 'Pulidor de Pisos.', NULL),
	(81, '20cfbf8164394b98e8e9181d34c9f38e', 'Granitero.', NULL),
	(82, '685cbb8250996a6a6a577a6d8d8cbf8d', 'Transporte de carga con medios de traccion de motor con capacidad de: Hasta una tonelada.', NULL),
	(83, '10b4c26d2e01304561424ac75e58f654', 'Transporte de carga con medios de traccion de motor con capacidad de: Mas de una y hasta tres toneladas.', NULL),
	(84, '930d249fd71d64338005c0625616dbfd', 'Transporte de carga con medios de traccion de motor con capacidad de: Mas de tres y hasta diez toneladas.', NULL),
	(85, 'd3920b7327887d1cceb0c77f1649e8e4', 'Transporte de carga con medios de traccion de motor con capacidad de: Mas de diez y hasta veinte toneladas.', NULL),
	(86, '83585280e7b183ebc5ff78fa6cfa1724', 'Transporte de carga con medios de traccion de motor con capacidad de: Mas de veinte toneladas.', NULL),
	(87, '2c4eaadfa4e1ffb2e6a3d0b8f2caa2be', 'Transporte de carga en lanchas o botes.', NULL),
	(88, '9404e0fe794b9475ab8053cf90f25ab4', 'Transporte de pasajeros con medios de traccion de motor con capacidad de: Hasta seis pasajeros.', NULL),
	(89, '659687cffb6565a5d3ffc35b12808637', 'Transporte de pasajeros con medios de traccion de motor con capacidad de: Mas de seis y hasta quince pasajeros.', NULL),
	(90, 'c3f85d785efca112e30e9e4e3cc3208b', 'Transporte de pasajeros con medios de traccion de motor con capacidad de: Mas de quince pasajeros.', NULL),
	(91, '7cd1278b12b4df6ce6b5d50823ec332e', 'Transporte de pasajeros en lanchas o botes.', NULL),
	(92, '2edda1fa4c50e814cdc0fc34f6af3b7b', 'Transporte de pasajeros con medios de traccion animal.', NULL),
	(93, '12a16813cc5d9cdd7f2ecd10106946fb', 'Transporte de pasajeros en motos.', NULL),
	(94, '42840e5504a992644ef23fe945d3e481', 'Afinador y reparador de instrumentos musicales.', NULL),
	(95, '0535a618f77fa638532c1ed2cbc8b2e9', 'Agente de Seguros.', NULL),
	(96, '0447cce2a68451741fb8c194e6ab1524', 'Aguador.', NULL),
	(97, '52560270d54e2b264d202b6ad178cfa5', 'Amolador.', NULL),
	(98, '56a18c265022a755bbd38e53be8704fa', 'Arriero.', NULL),
	(99, '49fecc1ed58edb6f5c2d248368a2de0c', 'Boyero o carretero.', NULL),
	(100, '8dd0f679e4ef0f59297e1799f5ec8ba8', 'Carretillero o vendedor de productos agricolas en forma ambulatoria.', NULL),
	(101, '3c58d32b47390318dcb29ef4d9fdcf21', 'Cerrajero.', NULL),
	(102, 'cc090f0ec8b4da215431cc15dffdb653', 'Cobrador pagador.', NULL),
	(103, '9d5f1bb1ae77f77743629541b9ff8b71', 'Comprador vendedor de libros de uso.', NULL),
	(104, '73327846eb912f8f2deefd4597d33bbb', 'Constructor vendedor o montador de antenas de radio y television.', NULL),
	(105, 'fcbeff0e74bdd4e27bc9a5c301cc3793', 'Cuidador de animales.', NULL),
	(106, 'f1a8d1eb79dd9d20082849869c18ab4c', 'Cuidador de baños publicos y taquillas.', NULL),
	(107, '9c7417512960ac89ffed377e627055b4', 'Cuidador de enfermos, personas con discapacidad y ancianos.', NULL),
	(108, 'ad3ce4ced2c2404f3943fc1a10ee8511', 'Asistente para el cuidado de niños.', NULL),
	(109, '029298abb82917027d5129edf02c9636', 'Cuidador de parques.', NULL),
	(110, '4cf81f42df0c69b65604e0efee6d43d0', 'Curtidor de pieles.', NULL),
	(111, '7fd7901d6ab52d2333ac6b491a28e3a5', 'Desmochador de palmas.', NULL),
	(112, 'ca9ced61eaa6674f0e5e7a40ec503643', 'Elaborador vendedor de alimentos y bebidas no alcoholicas de forma ambulatoria.', NULL),
	(113, 'eb41d9d84121f9623079fa97b2f61f35', 'Elaborador vendedor de carbon.', NULL),
	(114, 'e015fc305033d58ec3f5879373dcee79', 'Elaborador vendedor de yugos, frontiles y sogas.', NULL),
	(115, 'a1571d8eeaec951e84dc90b96435d757', 'Encargado, limpiador y turbinero de inmuebles.', NULL),
	(116, '8aca4af9e03f6f742043076f6cde0cc2', 'Entrenador de animales.', NULL),
	(117, 'bf16cb806ecc3d4343733e944b2f4655', 'Fabricante vendedor de coronas y flores.', NULL),
	(118, '26652e38908f12190efde4be525ee4b4', 'Forrador de botones.', NULL),
	(119, '315cdb8e86f7f60819aa6311538982fe', 'Fregador engrasador de equipos automotores.', NULL),
	(120, 'd16bb066c183299158a0fa8f87210d5b', 'Grabador cifrador de objetos.', NULL),
	(121, '4424f4b3493f2ca03b1066ef66dd10ed', 'Gestor de pasaje en piquera.', NULL),
	(122, '86af7fb7b7102d0182c7e73bb0c6f8b1', 'Herrador de animales o productor vendedor de herraduras y clavos.', NULL),
	(123, '699ddf7333a05f12b84e4c237de7a645', 'Hojalatero.', NULL),
	(124, '217c83373e9365d9d355b7341bc37426', 'Instructor de automovilismo.', NULL),
	(125, 'f7d57acc425614985fe169746ca6397b', 'Jardinero.', NULL),
	(126, '91a5f5dd98663f51b4cab97d40e82749', 'Lavandero o planchador.', NULL),
	(127, '0d4758e1159e62bc3a46fbd72836c6a9', 'Leñador.', NULL),
	(128, '18ea1fec4ea9676441c84beaddf9a68f', 'Limpiabotas.', NULL),
	(129, '92ac4c3512036ccdb0fca18a1f7855b1', 'Limpiador y comprobador de bujias.', NULL),
	(130, 'e3919af82669dc37f2caff676a319dea', 'Limpiador y reparador de fosas.', NULL),
	(131, '462188e154188a5f50e88627759f84da', 'Masajista.', NULL),
	(132, '854dce8912a89ce1ba8a486a2dd13c10', 'Masillero.', NULL),
	(133, '352b179fd3c71aef661b280c85c064f0', 'Mecanografo.', NULL),
	(134, '304e62fa97849b4a7a98da04334e402a', 'Mensajero.', NULL),
	(135, '1c18efaf4e60d7b086302f5b05ef0a77', 'Modista o sastre.', NULL),
	(136, '8c231256752e14a6fb449e91346a747c', 'Molinero.', NULL),
	(137, '82c04072a69094cda66880aca1437053', 'Operador de compresor de aire, ponchero o reparador de neumaticos.', NULL),
	(138, '81e4c25af9291ea46f66ceb8f91c09f3', 'Parqueador cuidador de equipos automotores, ciclos y triciclos.', NULL),
	(139, '575d0348bd2a091b837b156c334dea3b', 'Trabajador domestico.', NULL),
	(140, '6f30b3013b40de2dc8813634ca82244e', 'Pintor de inmuebles.', NULL),
	(141, '484dbb96ba9e31fed022b3803c7241e0', 'Piscicultor.', NULL),
	(142, 'fceb8321a52d98a9f03a0609cc5fd252', 'Plasticador.', NULL),
	(143, '5feadf1cfb44dfbca6aa337e75fe13bf', 'Pocero.', NULL),
	(144, '419d6524e68d62901e8805d2e179a315', 'Productor vendedor de articulos varios de uso en el hogar.', NULL),
	(145, '245cf4adfc4e91eda91ed834f959e5d7', 'Productor vendedor de articulos de aluminio.', NULL),
	(146, '37933c5f63497000598c675f045c7eb5', 'Productor vendedor de bastos, paños y monturas.', NULL),
	(147, '04e737f02347dfb5dbf99c5712582a90', 'Productor vendedor de figuras de yeso.', NULL),
	(148, 'a95ddd6f4a65f8a6dc4064862e5dd1d4', 'Productor vendedor de piñatas y otros articulos similares para cumpleaños.', NULL),
	(149, 'af086fd53e836aab214235cc7437441f', 'Productor vendedor de escobas, cepillos y similares.', NULL),
	(150, '0962d8048dd5f97d64aeda44677927cc', 'Recolector vendedor de recursos naturales.', NULL),
	(151, '72b5643cec64d218681b016c26c7e252', 'Profesor de taquigrafia, mecanografia e idiomas.', NULL),
	(152, '541f4c0870723b49fa57ac25e537fd9a', 'Recolector vendedor de materias primas.', NULL),
	(153, '17824a9802556b6af5eff424f8a8390c', 'Relojero.', NULL),
	(154, '7e7b9c03919829c3c16e5945191f8772', 'Reparador de articulos de cuero y similares.', NULL),
	(155, '92d6db5eccd024c6f9b8d9df11be1374', 'Reparador de bastidores de cama.', NULL),
	(156, '76f563b26a7b273204765b21e9cfc229', 'Reparador de baterias automotrices.', NULL),
	(157, '20d65ff23d66e745d933b0bf7314ebdf', 'Reparador de bicicletas.', NULL),
	(158, '4afd338187a0b4c0487676ebcea70766', 'Reparador de bisuteria.', NULL),
	(159, '262e635348c066fd2320820036d695f4', 'Reparador de cercas y caminos.', NULL),
	(160, '068c9c467dbb4a429e47c896eab600a7', 'Reparador de cocinas.', NULL),
	(161, 'd1ef3958d893f09d492c29fbda7c6800', 'Reparador de equipos de oficina.', NULL),
	(162, '4aabebdc14c09adf0cedd6a8437d874d', 'Reparador de espejuelos.', NULL),
	(163, '930ea7fa1e5ff58ef523469d1e3f766e', 'Reparador de maquinas de coser.', NULL),
	(164, 'd14f4ff0149f0be9aa5ad061c1a0e0d8', 'Reparador de monturas y arreos.', NULL),
	(165, 'a79e636dabb2dd11c7f0802b45e71acb', 'Reparador de paraguas y sombrillas.', NULL),
	(166, '884629fad8b801ecc403626d35d95495', 'Reparador y llenador de fosforeras.', NULL),
	(167, 'a0b4dbdff28fc9e20328005fe2539833', 'Repasador (excepto a los maestros en activo).', NULL),
	(168, 'c145585ef4f04dc0fd32b47eab1f997f', 'Restaurador de muñecos y otros juguetes.', NULL),
	(169, '17b05cb457592fd6cfd4c8f996f86caf', 'Sereno o portero de edificio de viviendas.', NULL),
	(170, '0f0ef164affc178a2609337bb96af702', 'Techador.', NULL),
	(171, 'cbdfe68d799df243cfc07d43b17189ef', 'Tenedor de libros.', NULL),
	(172, 'f86312b915b4df088b0577119826bdbf', 'Teñidor de textiles.', NULL),
	(173, 'c72e2886f69a9d86fc2608eb9f8520a9', 'Tostador.', NULL),
	(174, 'a1f3787df0809275fb6b27beeed4ea3b', 'Trabajador agropecuario eventual.', NULL),
	(175, '9b305e723c2f85ff9d2070349e7a62aa', 'Trabajador contratado.', NULL),
	(176, '1afd876904e3df63357cf11b2c30bf81', 'Traductor de documentos.', NULL),
	(177, '195272053377ab7d9a08f16e3cbbf32d', 'Transporte de carga con medios de traccion humana.', NULL),
	(178, 'b6e868ed1e8995255c74f58b38b5a46b', 'Transporte de carga con medios de traccion animal.', NULL),
	(179, '38771db7c71ceb7a499d553eda7cc565', 'Transporte de pasajeros con medios de traccion humana.', NULL),
	(180, '46ca5a5259674f834d482505ad3b5d9f', 'Trasquilador.', NULL),
	(181, '503e4e168ea0e3af6dff294450b0b315', 'Trillador.', NULL),
	(182, '07e96b58e19e01ae5cbd16e930cdfd5f', 'Vendedor de produccion agricola en puntos de ventas y quioscos.', NULL),
	(183, '28b69da91f5110a2894d496fe94d140d', 'Zapatero remendon.', NULL),
	(184, 'bd9559ae059e2818b78f11353f183ad0', 'Reparador de instrumentos de medicion.', NULL),
	(185, 'cc46e5ae6343b08ce1c010650cde0f2f', 'Gestor de Alojamiento para viviendas o habitaciones que se arriendan.', NULL),
	(186, '8b1deaf53364e0fa525b305625168079', 'Agente postal.', NULL),
	(187, 'b2b79eace99f5c6a8939d86dae1ebe17', 'Agente de telecomunicaciones.', NULL),
	(188, 'fdd9a9ce4e9a5ac1311ac13e36b6df1c', 'Reparador montador de equipos para el bombeo de agua.', NULL);
/*!40000 ALTER TABLE `zgctr_activity` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_contract
DROP TABLE IF EXISTS `zgctr_contract`;
CREATE TABLE IF NOT EXISTS `zgctr_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duration` decimal(18,2) DEFAULT NULL,
  `manuallyprogrammed` tinyint(1) DEFAULT 0,
  `percentage` decimal(18,2) DEFAULT NULL,
  `contracttypeid` bigint(20) DEFAULT NULL,
  `contractstatusid` bigint(20) DEFAULT NULL,
  `areaid` bigint(20) DEFAULT NULL,
  `providerid` bigint(20) DEFAULT NULL,
  `provideruserid` bigint(20) DEFAULT NULL,
  `clientid` bigint(20) DEFAULT NULL,
  `clientuserid` bigint(20) DEFAULT NULL,
  `paymentwayid` bigint(20) DEFAULT NULL,
  `paymentplaceid` bigint(20) DEFAULT NULL,
  `eventid` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `finished` datetime DEFAULT NULL,
  `paymentinstruments` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid_idx` (`eventid`),
  KEY `contracttypeid_idx` (`contracttypeid`),
  KEY `contractstatusid_idx` (`contractstatusid`),
  KEY `areaid_idx` (`areaid`),
  KEY `created_by_idx` (`created_by`),
  KEY `providerid_idx` (`providerid`),
  KEY `provideruserid_idx` (`provideruserid`),
  KEY `clientid_idx` (`clientid`),
  KEY `clientuserid_idx` (`clientuserid`),
  CONSTRAINT `zgctr_contract_areaid_zmc_costcenter_id` FOREIGN KEY (`areaid`) REFERENCES `zmc_costcenter` (`id`) ON DELETE SET NULL,
  CONSTRAINT `zgctr_contract_clientid_zab_entity_id` FOREIGN KEY (`clientid`) REFERENCES `zab_entity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgctr_contract_clientuserid_sf_guard_user_id` FOREIGN KEY (`clientuserid`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgctr_contract_contractstatusid_zgctr_contractstatus_id` FOREIGN KEY (`contractstatusid`) REFERENCES `zgctr_contractstatus` (`id`) ON DELETE SET NULL,
  CONSTRAINT `zgctr_contract_contracttypeid_zgctr_contracttype_id` FOREIGN KEY (`contracttypeid`) REFERENCES `zgctr_contracttype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgctr_contract_created_by_zab_person_id` FOREIGN KEY (`created_by`) REFERENCES `zab_person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgctr_contract_eventid_zab_event_id` FOREIGN KEY (`eventid`) REFERENCES `zab_event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgctr_contract_providerid_zab_entity_id` FOREIGN KEY (`providerid`) REFERENCES `zab_entity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgctr_contract_provideruserid_sf_guard_user_id` FOREIGN KEY (`provideruserid`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_contract: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgctr_contract` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_contractstatus
DROP TABLE IF EXISTS `zgctr_contractstatus`;
CREATE TABLE IF NOT EXISTS `zgctr_contractstatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customcolor` text DEFAULT NULL,
  `calendarid` bigint(20) DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  `iscomplete` tinyint(1) DEFAULT 0,
  `issuspended` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarid_idx` (`calendarid`),
  CONSTRAINT `zgctr_contractstatus_calendarid_zab_calendar_id` FOREIGN KEY (`calendarid`) REFERENCES `zab_calendar` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_contractstatus: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_contractstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgctr_contractstatus` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_contractstatusrelation
DROP TABLE IF EXISTS `zgctr_contractstatusrelation`;
CREATE TABLE IF NOT EXISTS `zgctr_contractstatusrelation` (
  `fromstatus_id` bigint(20) NOT NULL,
  `tostatus_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fromstatus_id`,`tostatus_id`),
  KEY `zgctr_contractstatusrelation_tostatus_id_zgctr_contractstatus_id` (`tostatus_id`),
  CONSTRAINT `zfzi` FOREIGN KEY (`fromstatus_id`) REFERENCES `zgctr_contractstatus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgctr_contractstatusrelation_tostatus_id_zgctr_contractstatus_id` FOREIGN KEY (`tostatus_id`) REFERENCES `zgctr_contractstatus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_contractstatusrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_contractstatusrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgctr_contractstatusrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_contracttype
DROP TABLE IF EXISTS `zgctr_contracttype`;
CREATE TABLE IF NOT EXISTS `zgctr_contracttype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_contracttype: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_contracttype` DISABLE KEYS */;
INSERT INTO `zgctr_contracttype` (`id`, `code`, `name`, `comment`) VALUES
	(1, '83411c68eeab9269d21cf9e913e826f9', 'Compraventa', NULL),
	(2, '86bd976d41e5495947a43f93360836bf', 'Suministro', NULL),
	(3, '6a705e09a2298faf4be3dc4ab5b57fe3', 'Arrendamiento', NULL),
	(4, '17696c1f0cfc3332786727979366cce2', 'Comisión', NULL),
	(5, '23695ff58e234d3d7f4c4c8bfc81b860', 'Consignación', NULL),
	(6, 'b4106835f7225936abf72909ee4ed0d4', 'Depósito', NULL),
	(7, 'eed6d6c7248fc0ef3bd7e9ec64f97683', 'Comodato', NULL),
	(8, '0d297ce25ece359c1a4884d0b1b691ec', 'Donación', NULL),
	(9, '979ddf7689f806419cd348eeee6bd9e6', 'Agencia', NULL),
	(10, '6a7634ddaf16ad1e91d1dadbcb3f084a', 'Ejecución de Obra', NULL),
	(11, 'e229a7a7591331e0590efec95f472fd2', 'Permuta', NULL),
	(12, 'd1cd0a605cfa6b16c5b94b4eb5650fd5', 'Servicios', NULL),
	(13, '99e4f20e35c53671a45db3d5097ac4a6', 'Transporte', NULL),
	(14, 'ce14e136f8a138342a1827234c8ef1ca', 'Cooperacion', NULL),
	(15, '185478f24cca553c7ba8961f582c2b2c', 'Alquiler', NULL),
	(16, '120350025a553d8b9b692d6f27257297', 'Otros', NULL);
/*!40000 ALTER TABLE `zgctr_contracttype` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_documenttype
DROP TABLE IF EXISTS `zgctr_documenttype`;
CREATE TABLE IF NOT EXISTS `zgctr_documenttype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_documenttype: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_documenttype` DISABLE KEYS */;
INSERT INTO `zgctr_documenttype` (`id`, `code`, `name`, `comment`) VALUES
	(1, 'e1d01575eb264281e0e80f067b199de6', 'Resolución', NULL),
	(2, '2ab0d121c026c5d29f737266195bf2f5', 'Documento de creación', NULL);
/*!40000 ALTER TABLE `zgctr_documenttype` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_entitytype
DROP TABLE IF EXISTS `zgctr_entitytype`;
CREATE TABLE IF NOT EXISTS `zgctr_entitytype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `specialcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_entitytype: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_entitytype` DISABLE KEYS */;
INSERT INTO `zgctr_entitytype` (`id`, `code`, `name`, `comment`, `specialcode`) VALUES
	(1, '43d697b158946b77c28d0936999546c8', 'Banco', NULL, 'BANC'),
	(2, 'da75009821d937ddf3421e555cdb29f3', 'Empresa Estatal Socialista', NULL, 'EMP'),
	(3, 'cc5ca3a3c30b231be55af44259bd8b5a', 'Organización Política y de Masas', NULL, 'OPM'),
	(4, '95f7c437f1821d148c516091e271b1e5', 'Unión', NULL, 'U'),
	(5, '5b952f80ce9108cc8410d1a2ec2810a9', 'Unidad Presupuestada', NULL, 'UP'),
	(6, 'ae52d61537f92073b09c3188cb25e0e0', 'Grupo Empresarial', NULL, 'GRUP'),
	(7, 'd6f515f645395eccfd62483925c4bc8b', 'Asociación', NULL, 'AS'),
	(8, 'b4c267b1ce3ad8387b528f1de00539e7', 'Otro', NULL, 'OTRO'),
	(9, '4ecd7c4526d11281be4b7fdcb3c0d637', 'Sociedad Mercantil', NULL, 'MERC'),
	(10, 'e5d7ec9b36bbc8dd2fb05dcd959ecb05', 'Sociedad', NULL, 'SOCC'),
	(11, '9af81c5c56ae7a12a1ce6fbfad85acb5', 'Cooperativa No Agropecuaria', NULL, 'CNoA'),
	(12, '1de0e54b22e9cbf3126433cb3f6c8201', 'Cooperativa de Producción Agropecuaria', NULL, 'CPA'),
	(13, 'b0395ee71e6b387398fdc136a9004672', 'Trabajador por Cuenta Propia', NULL, 'TCP'),
	(14, '8fb8a3caebf5907c44452488150362f2', 'Cooperativa de Créditos y Servicios', NULL, 'CCS'),
	(15, '72ba77239b8d1904255a58f969d6ee5f', 'Unidad de Base de Producción Cooperativa', NULL, 'UBPC'),
	(16, 'a3215649fbc7cc4182cc548c10d434f5', 'Unidad Empresarial de Base', NULL, 'UEB'),
	(17, '483842c585f19aad5bb77e2e87f6e384', 'Empresa Mixta', NULL, 'EM'),
	(18, '547544f3de6a7037fad8ff24cf654cbd', 'Persona Natural', NULL, 'PN');
/*!40000 ALTER TABLE `zgctr_entitytype` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_format
DROP TABLE IF EXISTS `zgctr_format`;
CREATE TABLE IF NOT EXISTS `zgctr_format` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `variables` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_format: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgctr_format` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_location
DROP TABLE IF EXISTS `zgctr_location`;
CREATE TABLE IF NOT EXISTS `zgctr_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `specialcode` varchar(50) DEFAULT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parentid_idx` (`parentid`),
  CONSTRAINT `zgctr_location_parentid_zgctr_location_id` FOREIGN KEY (`parentid`) REFERENCES `zgctr_location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_location: ~183 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_location` DISABLE KEYS */;
INSERT INTO `zgctr_location` (`id`, `code`, `name`, `comment`, `specialcode`, `parentid`, `path`, `icon`) VALUES
	(1, '7a5fd0fdddaea178117270bc573a733a', 'PINAR DEL RIO', NULL, '21', NULL, '/NULL/1', NULL),
	(2, '4621847505642ea1218a882e2ffc3a52', 'SANDINO', NULL, '2101', 1, '/NULL/1/2', NULL),
	(3, 'ac311f56d902084b28d53183c61035b2', 'MANTUA', NULL, '2102', 1, '/NULL/1/3', NULL),
	(4, 'd73ff529dc0af5a29b2469147968c273', 'MINAS DE MATAHAMBRE', NULL, '2103', 1, '/NULL/1/4', NULL),
	(5, '4e53ccf47a3bb405c06196cdaa3147e3', 'VINALES', NULL, '2104', 1, '/NULL/1/5', NULL),
	(6, 'ef1c8d721ad23eafd80e05b7a58ec0e0', 'LA PALMA', NULL, '2105', 1, '/NULL/1/6', NULL),
	(7, '89d3095dccf5dc5f07f21c8fde95d738', 'LOS PALACIOS', NULL, '2106', 1, '/NULL/1/7', NULL),
	(8, 'f06366e98246a4984aefc57e07af3cbe', 'CONSOLACION DEL SUR', NULL, '2107', 1, '/NULL/1/8', NULL),
	(9, '7b78e2fbea8fda16db0c6279e8ac7cc6', 'PINAR DEL RIO', NULL, '2108', 1, '/NULL/1/9', NULL),
	(10, 'd77b45e3ec1a4fd9f49006dc557d88a9', 'SAN LUIS', NULL, '2109', 1, '/NULL/1/10', NULL),
	(11, '32b9833aa042b53c87bc21eebc4faf7b', 'SAN JUAN Y MARTINEZ', NULL, '2110', 1, '/NULL/1/11', NULL),
	(12, 'ed83af02052555eb236300f21795fc00', 'GUANE', NULL, '2111', 1, '/NULL/1/12', NULL),
	(13, 'a2597e81c60af20702f51575c785eb11', 'ARTEMISA', NULL, '22', NULL, '/NULL/13', NULL),
	(14, '579e2ce36be261992f56767184a7c74b', 'BAHIA HONDA', NULL, '2201', 13, '/NULL/13/14', NULL),
	(15, 'fe71a03b076968b1bd71461b2c89cce2', 'MARIEL', NULL, '2202', 13, '/NULL/13/15', NULL),
	(16, '8692cead777fa03aca7dc7dc376685a6', 'GUANAJAY', NULL, '2203', 13, '/NULL/13/16', NULL),
	(17, '48b924a3e78c135ec0ab99ed38e5f968', 'CAIMITO', NULL, '2204', 13, '/NULL/13/17', NULL),
	(18, 'e99e4cf1837f35c08c0299501291f4d5', 'BAUTA', NULL, '2205', 13, '/NULL/13/18', NULL),
	(19, '868de11dc48ce7d1666f0ae2281e8d06', 'SAN ANTONIO DE LOS BANOS', NULL, '2206', 13, '/NULL/13/19', NULL),
	(20, 'd28621f4904b67c634a15b3815012df3', 'GUIRA DE MELENA', NULL, '2207', 13, '/NULL/13/20', NULL),
	(21, '18aaa276ef46f1a6635e1209fca3ab5e', 'ALQUIZAR', NULL, '2208', 13, '/NULL/13/21', NULL),
	(22, 'a18c183a90d0c749fb815f8ea06f8471', 'ARTEMISA', NULL, '2209', 13, '/NULL/13/22', NULL),
	(23, 'd97685fe098c5c6d90b6107f25af6164', 'CANDELARIA', NULL, '2210', 13, '/NULL/13/23', NULL),
	(24, 'e85686497247789b1126ba9396a62ea7', 'SAN CRISTOBAL', NULL, '2211', 13, '/NULL/13/24', NULL),
	(25, 'f67a78619a6227ee3b0f00e4f51a5e6c', 'LA HABANA', NULL, '23', NULL, '/NULL/25', NULL),
	(26, '4c9c3e0abc9bbb9d506aa811ef72aeed', 'PLAYA', NULL, '2301', 25, '/NULL/25/26', NULL),
	(27, '6d8b4806c2db262ce60d980a78ad9668', 'PLAZA DE LA REVOLUCION', NULL, '2302', 25, '/NULL/25/27', NULL),
	(28, '278a72627e593090a49c164ca5a973c1', 'CENTRO HABANA', NULL, '2303', 25, '/NULL/25/28', NULL),
	(29, '8fbb25db79b5d6147dccfb5cdf1e9309', 'LA HABANA VIEJA', NULL, '2304', 25, '/NULL/25/29', NULL),
	(30, 'f00f56c6cef080b2c9d96a16eedae4e9', 'REGLA', NULL, '2305', 25, '/NULL/25/30', NULL),
	(31, '729ee949ee7b6c4b410381720db4733a', 'LA HABANA DEL ESTE', NULL, '2306', 25, '/NULL/25/31', NULL),
	(32, 'd65fbb342b9b2747aaa468363a12b9b9', 'GUANABACOA', NULL, '2307', 25, '/NULL/25/32', NULL),
	(33, '665c9cb82ff256c60bb8e7e515804e8c', 'SAN MIGUEL DEL PADRON', NULL, '2308', 25, '/NULL/25/33', NULL),
	(34, '0c4ae6cd80c5bdc4cb8ff31f87765698', 'DIEZ DE OCTUBRE', NULL, '2309', 25, '/NULL/25/34', NULL),
	(35, 'f1614008f309995e7060e0b0855fcf83', 'CERRO', NULL, '2310', 25, '/NULL/25/35', NULL),
	(36, 'c89ebe96c2d97342d15910c5f0dca894', 'MARIANAO', NULL, '2311', 25, '/NULL/25/36', NULL),
	(37, 'b94867a7a0ae6d1036e64c6577a296b4', 'LA LISA', NULL, '2312', 25, '/NULL/25/37', NULL),
	(38, 'bd00a71db695bf75aeb31fa936e7f37f', 'BOYEROS', NULL, '2313', 25, '/NULL/25/38', NULL),
	(39, '152a133cb27a3ac09f319e36779cca18', 'ARROYO NARANJO', NULL, '2314', 25, '/NULL/25/39', NULL),
	(40, 'df96498f8eb9a975ca4bc5b87656d91d', 'COTORRO', NULL, '2315', 25, '/NULL/25/40', NULL),
	(41, 'eae0c75af0a905a2fab63a70642562ff', 'MAYABEQUE', NULL, '24', NULL, '/NULL/41', NULL),
	(42, '3bb0bad3e7cabf5c191be4782e0b1df8', 'BEJUCAL', NULL, '2401', 41, '/NULL/41/42', NULL),
	(43, 'ae5c1086b6d8fffdcf57c47b4a2dedda', 'SAN JOSE DE LAS LAJAS', NULL, '2402', 41, '/NULL/41/43', NULL),
	(44, 'bc1cff7f2549f26895eeb574bf62ee98', 'JARUCO', NULL, '2403', 41, '/NULL/41/44', NULL),
	(45, 'c4454d995a8af0e9aa2bd813ab62f4f1', 'SANTA CRUZ DEL NORTE', NULL, '2404', 41, '/NULL/41/45', NULL),
	(46, 'af124eb2e4207dcf7abe4517802e3e83', 'MADRUGA', NULL, '2405', 41, '/NULL/41/46', NULL),
	(47, 'db8b048a5949e873837b8ace559884db', 'NUEVA PAZ', NULL, '2406', 41, '/NULL/41/47', NULL),
	(48, '7a96d81cab140a500320f3aaf772351f', 'SAN NICOLAS', NULL, '2407', 41, '/NULL/41/48', NULL),
	(49, '50fa6fc65fa2c0e5f349be737617d383', 'GUINES', NULL, '2408', 41, '/NULL/41/49', NULL),
	(50, '34544544c5532860bc7942c5f09a0ee2', 'MELENA DEL SUR', NULL, '2409', 41, '/NULL/41/50', NULL),
	(51, 'cd836420a510e17464bdb6024a64a1a1', 'BATABANO', NULL, '2410', 41, '/NULL/41/51', NULL),
	(52, '18aca027dc1c4d4e6b74509b4ad61db3', 'QUIVICAN', NULL, '2411', 41, '/NULL/41/52', NULL),
	(53, 'ac8b7a5ff3db2f04587b6c3ba70c1616', 'MATANZAS', NULL, '25', NULL, '/NULL/53', NULL),
	(54, '9c714d244e4107ae135cbffa49f4775f', 'MATANZAS', NULL, '2501', 53, '/NULL/53/54', NULL),
	(55, 'e4dedd5a0fb26575f176c3cb85909880', 'CARDENAS ', NULL, '2502', 53, '/NULL/53/55', NULL),
	(56, 'a2efd819d7e88b86c3ed49e5aca3512c', 'MARTI', NULL, '2503', 53, '/NULL/53/56', NULL),
	(57, '2be1a80a0a9e46d1f07f986b5bb28bb4', 'COLON', NULL, '2504', 53, '/NULL/53/57', NULL),
	(58, '60612efc3d7a9f80ffc6192e9f470734', 'PERICO', NULL, '2505', 53, '/NULL/53/58', NULL),
	(59, '027d23fcccb865cc90eac2a52ca9c265', 'JOVELLANOS', NULL, '2506', 53, '/NULL/53/59', NULL),
	(60, 'df0df8ccb29b6e326d6b713eb4b1f27f', 'PEDRO BETANCOURT', NULL, '2507', 53, '/NULL/53/60', NULL),
	(61, '29e74e356d41011b434f3dd2a00e25e2', 'LIMONAR', NULL, '2508', 53, '/NULL/53/61', NULL),
	(62, '6b3724529379685a52bf8f7e8f64eace', 'UNION DE REYES', NULL, '2509', 53, '/NULL/53/62', NULL),
	(63, 'da89d9dc5e79f5516574ad147076fc24', 'CIENAGA DE ZAPATA', NULL, '2510', 53, '/NULL/53/63', NULL),
	(64, '4c1a6e2236df2af733957220953a8629', 'JAGUEY GRANDE', NULL, '2511', 53, '/NULL/53/64', NULL),
	(65, '9113eb4afabd85a45c97d0b16950760a', 'CALIMETE', NULL, '2512', 53, '/NULL/53/65', NULL),
	(66, 'ea96dbf62c838b798436eb5e065d2de4', 'LOS ARABOS', NULL, '2513', 53, '/NULL/53/66', NULL),
	(67, '41bb363525292a3eb146534afd7ccd9b', 'VILLA CLARA', NULL, '26', NULL, '/NULL/67', NULL),
	(68, 'dc71561e654e33bb609b7ff7c66a2071', 'CORRALILLO', NULL, '2601', 67, '/NULL/67/68', NULL),
	(69, 'f19197bf3584f2f2e5401baa1d337070', 'QUEMADO DE GUINES', NULL, '2602', 67, '/NULL/67/69', NULL),
	(70, '55e079caf37f708d5d2ccf5c5ba93d43', 'SAGUA LA GRANDE', NULL, '2603', 67, '/NULL/67/70', NULL),
	(71, '1117ac87fa18ead79166da26ad68ddd4', 'ENCRUCIJADA', NULL, '2604', 67, '/NULL/67/71', NULL),
	(72, 'bc47690696010c1b2a5b8512622d4d7a', 'CAMAJUANI', NULL, '2605', 67, '/NULL/67/72', NULL),
	(73, '7244c3cab33f51e229ef7e6ce3482b33', 'CAIBARIEN', NULL, '2606', 67, '/NULL/67/73', NULL),
	(74, 'ab5460e750d6ac724c658e412f77c11b', 'REMEDIOS', NULL, '2607', 67, '/NULL/67/74', NULL),
	(75, 'e4813d505ecee234ae2b84cccc4ab41a', 'PLACETAS', NULL, '2608', 67, '/NULL/67/75', NULL),
	(76, '2d0f37f55f739101794852208805eedf', 'SANTA CLARA', NULL, '2609', 67, '/NULL/67/76', NULL),
	(77, '325b41a10f994701c1fdc7532ba47906', 'CIFUENTES', NULL, '2610', 67, '/NULL/67/77', NULL),
	(78, '455912285296313ed0f97743b8acc341', 'SANTO DOMINGO', NULL, '2611', 67, '/NULL/67/78', NULL),
	(79, 'dbe0a076b915fe3bdd6e92bc34ecdea7', 'RANCHUELO', NULL, '2612', 67, '/NULL/67/79', NULL),
	(80, '192df134ea9698b76439760d00465df3', 'MANICARAGUA', NULL, '2613', 67, '/NULL/67/80', NULL),
	(81, 'f492d3d004c141e6837872c8cd9fc0f9', 'CIENFUEGOS', NULL, '27', NULL, '/NULL/81', NULL),
	(82, '7b2a9890a3056c6d9924acfd5836a808', 'AGUADA DE PASAJEROS', NULL, '2701', 81, '/NULL/81/82', NULL),
	(83, '27682e573a05e3a3b782c4cbe9374e60', 'RODAS', NULL, '2702', 81, '/NULL/81/83', NULL),
	(84, '8a8fdb4c081bb4ed7d158687cd1d3aa5', 'PALMIRA', NULL, '2703', 81, '/NULL/81/84', NULL),
	(85, 'd182a0db897fb65b51997891094c9f37', 'LAJAS', NULL, '2704', 81, '/NULL/81/85', NULL),
	(86, '3c04518417cb5413f88f0563dec90313', 'CRUCES', NULL, '2705', 81, '/NULL/81/86', NULL),
	(87, 'a34ecb5c661d0c1e81b548bc6a282d83', 'CUMANAYAGUA', NULL, '2706', 81, '/NULL/81/87', NULL),
	(88, '96cf82828858bcf755a518fad4760210', 'CIENFUEGOS', NULL, '2707', 81, '/NULL/81/88', NULL),
	(89, '4ab0eb84fab5a6fd7e229ba8c2107e9d', 'ABREUS', NULL, '2708', 81, '/NULL/81/89', NULL),
	(90, '6fc34dba0a1e8b0c24dfa14d236eabd5', 'SANCTI SPIRITUS', NULL, '28', NULL, '/NULL/90', NULL),
	(91, 'd9a498c53f4fa64cd34b463a38f4b6c8', 'YAGUAJAY', NULL, '2801', 90, '/NULL/90/91', NULL),
	(92, '66d00b9d9bcc5e505c3927db4e92b02e', 'JATIBONICO', NULL, '2802', 90, '/NULL/90/92', NULL),
	(93, '13498e5f15d0234df30914e57e7b8d4f', 'TAGUASCO', NULL, '2803', 90, '/NULL/90/93', NULL),
	(94, '392930d8bcbeb5792f02e5579a122ad3', 'CABAIGUAN', NULL, '2804', 90, '/NULL/90/94', NULL),
	(95, 'a3472e1303394b79188840b560f7d97e', 'FOMENTO', NULL, '2805', 90, '/NULL/90/95', NULL),
	(96, '5109e3ee2b40ea89491b14b3a4825262', 'TRINIDAD', NULL, '2806', 90, '/NULL/90/96', NULL),
	(97, '52d8b4d27bae13b8a17e34fbba1f70a0', 'SANCTI SPIRITUS', NULL, '2807', 90, '/NULL/90/97', NULL),
	(98, 'aa79628dee2209129ec027425cba270b', 'LA SIERPE', NULL, '2808', 90, '/NULL/90/98', NULL),
	(99, 'b544936571efc3cdafb8e2be5b9011cd', 'CIEGO DE AVILA', NULL, '29', NULL, '/NULL/99', NULL),
	(100, '642c1db796cfecf68ceb8efb29577a46', 'CHAMBAS', NULL, '2901', 99, '/NULL/99/100', NULL),
	(101, '1462bd2bb18f3b44efb3c4a58060c92e', 'MORON', NULL, '2902', 99, '/NULL/99/101', NULL),
	(102, '99d2e7963295fc7b488e25e01f1d3c0d', 'BOLIVIA', NULL, '2903', 99, '/NULL/99/102', NULL),
	(103, 'f8dc1e84ce2797d9956e406353b126b1', 'PRIMERO DE ENERO', NULL, '2904', 99, '/NULL/99/103', NULL),
	(104, '4cc825b8dbcd75af84b97643ef562c29', 'CIRO REDONDO', NULL, '2905', 99, '/NULL/99/104', NULL),
	(105, '1b83e3c9433c855dd33adc0ff2310170', 'FLORENCIA', NULL, '2906', 99, '/NULL/99/105', NULL),
	(106, '7ebe6f04521a56a5fc00b07ab0ab07ee', 'MAJAGUA', NULL, '2907', 99, '/NULL/99/106', NULL),
	(107, '20fd6d519bde47bf2dbd953ade3050a4', 'CIEGO DE AVILA', NULL, '2908', 99, '/NULL/99/107', NULL),
	(108, 'ed4833818782b936ee621b892e42748b', 'VENEZUELA', NULL, '2909', 99, '/NULL/99/108', NULL),
	(109, '0cc14e89baad2817ba612cb6a0c796e5', 'BARAGUA', NULL, '2910', 99, '/NULL/99/109', NULL),
	(110, '8032f93d74e5e35dbb26de0ca639be87', 'CAMAGUEY', NULL, '30', NULL, '/NULL/110', NULL),
	(111, '23cb2be60bb0b1ee9ee5d0cbfddad79b', 'CARLOS MANUEL DE CESPEDES', NULL, '3001', 110, '/NULL/110/111', NULL),
	(112, '1e408beb0c764970db2e909cd8d5bf98', 'ESMERALDA', NULL, '3002', 110, '/NULL/110/112', NULL),
	(113, 'd3d5b0ccf4d17908607c15183f02c8ea', 'SIERRA DE CUBITAS', NULL, '3003', 110, '/NULL/110/113', NULL),
	(114, '0973fe4edf108c047e741a830194d7b7', 'MINAS', NULL, '3004', 110, '/NULL/110/114', NULL),
	(115, '0353cee9cf30ea339c62499be3eb735a', 'NUEVITAS', NULL, '3005', 110, '/NULL/110/115', NULL),
	(116, 'ae67ea198c99b7ed945cac1dc4ce6c06', 'GUAIMARO', NULL, '3006', 110, '/NULL/110/116', NULL),
	(117, 'b6a41af76a72f19c5e6638bb2ae6bafe', 'SIBANICU', NULL, '3007', 110, '/NULL/110/117', NULL),
	(118, '04f09c904c11ef1be02e6e2c2bb8f554', 'CAMAGUEY', NULL, '3008', 110, '/NULL/110/118', NULL),
	(119, '8fb71be136c4760301458019a0c8184f', 'FLORIDA', NULL, '3009', 110, '/NULL/110/119', NULL),
	(120, '04885ecdabbcd7d3cdcf45293ddbd19e', 'VERTIENTES', NULL, '3010', 110, '/NULL/110/120', NULL),
	(121, '19c509799a2698211acc82f3adc96507', 'JIMAGUAYU', NULL, '3011', 110, '/NULL/110/121', NULL),
	(122, '087ccfe4d84bb3963db31cbc8cfbcd98', 'NAJASA', NULL, '3012', 110, '/NULL/110/122', NULL),
	(123, 'e8e6613151c30a68d03b331356967e50', 'SANTA CRUZ DEL SUR', NULL, '3013', 110, '/NULL/110/123', NULL),
	(124, 'dfbda41214abed3471288cc703545d06', 'LAS TUNAS', NULL, '31', NULL, '/NULL/124', NULL),
	(125, 'a5e712a3825ee37ec2154684fca24ec7', 'MANATI', NULL, '3101', 124, '/NULL/124/125', NULL),
	(126, '5b34d3b3db2543af11d0dff70eccfd1c', 'PUERTO PADRE', NULL, '3102', 124, '/NULL/124/126', NULL),
	(127, '6696934f8fc2a593739e56594456fce3', 'JESUS MENENDEZ', NULL, '3103', 124, '/NULL/124/127', NULL),
	(128, '47b8ab5e6176fbf0ca3eb2b584a1203b', 'MAJIBACOA', NULL, '3104', 124, '/NULL/124/128', NULL),
	(129, '8b9240f8428a99ef9fb657822f1d19f4', 'LAS TUNAS', NULL, '3105', 124, '/NULL/124/129', NULL),
	(130, '5c6384a46169290f802ee1551326dc67', 'JOBABO', NULL, '3106', 124, '/NULL/124/130', NULL),
	(131, 'a4a7c9a376a18025defb9bbebe531f7f', 'COLOMBIA', NULL, '3107', 124, '/NULL/124/131', NULL),
	(132, 'c2c791eb05cb80c6af4779aac74b63c3', 'AMANCIO', NULL, '3108', 124, '/NULL/124/132', NULL),
	(133, '0c605700fe9c9c8610a38d63f3edc2fb', 'HOLGUIN', NULL, '32', NULL, '/NULL/133', NULL),
	(134, '85c4337535dde2f11c15329e7a1ff841', 'GIBARA', NULL, '3201', 133, '/NULL/133/134', NULL),
	(135, 'a58fc612e686eff9d6eff687c4e1e736', 'RAFAEL FREYRE', NULL, '3202', 133, '/NULL/133/135', NULL),
	(136, 'e39d1bf1d9267bb2aedf29ec17f8d918', 'BANES', NULL, '3203', 133, '/NULL/133/136', NULL),
	(137, '0f34eb19f69081e9e0801e085dfb2b2a', 'ANTILLA', NULL, '3204', 133, '/NULL/133/137', NULL),
	(138, '4d2d6b1476dd6c9ca90719f237e3f7e2', 'BAGUANOS', NULL, '3205', 133, '/NULL/133/138', NULL),
	(139, '6a4bf1c836f3674b435f24f2732ae517', 'HOLGUIN', NULL, '3206', 133, '/NULL/133/139', NULL),
	(140, '75b93bbf3e6ea1dabbc1610e251116d2', 'CALIXTO GARCIA', NULL, '3207', 133, '/NULL/133/140', NULL),
	(141, '6706986db0de6a7e7e3d7a444d7c5d99', 'CACOCUM', NULL, '3208', 133, '/NULL/133/141', NULL),
	(142, '1be3ac7f0f09341d2c8942906bc98b95', 'URBANO NORIS', NULL, '3209', 133, '/NULL/133/142', NULL),
	(143, 'faa3e3ed3e286b53f6584263c0349f3d', 'CUETO', NULL, '3210', 133, '/NULL/133/143', NULL),
	(144, 'f6add092ca875069ce3ecc9757071025', 'MAYARI', NULL, '3211', 133, '/NULL/133/144', NULL),
	(145, '857f1970db7c52f3000e964800ae3bf1', 'FRANK PAIS', NULL, '3212', 133, '/NULL/133/145', NULL),
	(146, '980a6aba59bde01f6b98d060d32a871c', 'SAGUA DE TANAMO', NULL, '3213', 133, '/NULL/133/146', NULL),
	(147, '981d4c3d21fd52db2d443adca945d909', 'MOA', NULL, '3214', 133, '/NULL/133/147', NULL),
	(148, 'fc9bc8aede994cea4835461c60b4e650', 'GRANMA', NULL, '33', NULL, '/NULL/148', NULL),
	(149, '19d94b6b4355ba9ceba99092ab738343', 'RIO CAUTO', NULL, '3301', 148, '/NULL/148/149', NULL),
	(150, 'f65ba38389354f23a6105ae0828cc279', 'CAUTO CRISTO', NULL, '3302', 148, '/NULL/148/150', NULL),
	(151, '003604880427f4ae203e5f464d74990d', 'JIGUANI', NULL, '3303', 148, '/NULL/148/151', NULL),
	(152, '6cdd9a0641697225aab39b09c883b45d', 'BAYAMO', NULL, '3304', 148, '/NULL/148/152', NULL),
	(153, '1b4be8fceb211027d546aa8ef6254876', 'YARA', NULL, '3305', 148, '/NULL/148/153', NULL),
	(154, '75ce7067ac9874c62d9ca6bb6046ea40', 'MANZANILLO', NULL, '3306', 148, '/NULL/148/154', NULL),
	(155, '2efbc3202279f48d76365f66a429ec5a', 'CAMPECHUELA', NULL, '3307', 148, '/NULL/148/155', NULL),
	(156, 'e5c84ccca3af49d099724a236630e469', 'MEDIA LUNA', NULL, '3308', 148, '/NULL/148/156', NULL),
	(157, '308895af89300a1c18d7a46cf587b268', 'NIQUERO', NULL, '3309', 148, '/NULL/148/157', NULL),
	(158, 'd0390f6bf728009b78e5672b6d7d3040', 'PILON', NULL, '3310', 148, '/NULL/148/158', NULL),
	(159, '25aa49aa0d1c6005669663b52758da78', 'BARTOLOME MASO', NULL, '3311', 148, '/NULL/148/159', NULL),
	(160, '9d8739f6ad0c74c1366324ada931bd13', 'BUEY ARRIBA', NULL, '3312', 148, '/NULL/148/160', NULL),
	(161, 'fd6c7016f3f28029c2bb22de023f24a2', 'GUISA', NULL, '3313', 148, '/NULL/148/161', NULL),
	(162, '1a3253d113e2afb46323f51e60e2adb4', 'SANTIAGO DE CUBA', NULL, '34', NULL, '/NULL/162', NULL),
	(163, 'b4fc57220b4f584b2bd5a9b08c8514d6', 'CONTRAMAESTRE', NULL, '3401', 162, '/NULL/162/163', NULL),
	(164, '30c88dbd48b1cc121626c6b7b300e28a', 'MELLA', NULL, '3402', 162, '/NULL/162/164', NULL),
	(165, 'affe4e3e5de007e7cd8597ccdce20df5', 'SAN LUIS', NULL, '3403', 162, '/NULL/162/165', NULL),
	(166, 'f3998d1470333d1f94e74abf5d9e7a8a', 'SEGUNDO FRENTE', NULL, '3404', 162, '/NULL/162/166', NULL),
	(167, 'e4c493c55b83b58cf4b282de661a60f9', 'SONGO - LA MAYA', NULL, '3405', 162, '/NULL/162/167', NULL),
	(168, '7344b1dba1388bebffe5965f2fa0e858', 'SANTIAGO DE CUBA', NULL, '3406', 162, '/NULL/162/168', NULL),
	(169, '99b66b71931c6d7b386ff8c9a2818a27', 'PALMA SORIANO', NULL, '3407', 162, '/NULL/162/169', NULL),
	(170, 'b63321a933b60f879dffe30b15f15107', 'TERCER FRENTE', NULL, '3408', 162, '/NULL/162/170', NULL),
	(171, '32f2fc2b3fb9321e60ac4d67884bdd96', 'GUAMA', NULL, '3409', 162, '/NULL/162/171', NULL),
	(172, 'b82f3643b80f27a7785322ef4c99a1d8', 'GUANTANAMO', NULL, '35', NULL, '/NULL/172', NULL),
	(173, '69441299283deb3079af7d5979bc985d', 'EL SALVADOR', NULL, '3501', 172, '/NULL/172/173', NULL),
	(174, '66d91d501533ef0140ff790871d9dd85', 'MANUEL TAMES', NULL, '3502', 172, '/NULL/172/174', NULL),
	(175, '5517e7861046af2e91cbe67232cb1f80', 'YATERAS', NULL, '3503', 172, '/NULL/172/175', NULL),
	(176, '95a31bfbf4dfd098474a3cabcecf6af9', 'BARACOA', NULL, '3504', 172, '/NULL/172/176', NULL),
	(177, '78d2d1efd66a06ed9b4406fa7d4f8f6e', 'MAISI', NULL, '3505', 172, '/NULL/172/177', NULL),
	(178, '78fff53cb2eafe9adc3f7895a8d40bbe', 'IMIAS', NULL, '3506', 172, '/NULL/172/178', NULL),
	(179, 'fb027a9aaca8700707176452b4b7df1e', 'SAN ANTONIO DEL SUR', NULL, '3507', 172, '/NULL/172/179', NULL),
	(180, '385149c8d23a80779803898c4fbb19aa', 'CAIMANERA', NULL, '3508', 172, '/NULL/172/180', NULL),
	(181, 'a2fbec6a306c677dd7a5c7e41b64c605', 'GUANTANAMO', NULL, '3509', 172, '/NULL/172/181', NULL),
	(182, '7083d3c9ee2c9dfbeb4f16666fe9331e', 'NICETO PEREZ', NULL, '3510', 172, '/NULL/172/182', NULL),
	(183, '89b24fdaa050624d7f2a7dce70aa3b47', 'ISLA DE LA JUVENTUD', NULL, '4001', NULL, '/NULL/183', NULL);
/*!40000 ALTER TABLE `zgctr_location` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_nationality
DROP TABLE IF EXISTS `zgctr_nationality`;
CREATE TABLE IF NOT EXISTS `zgctr_nationality` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_nationality: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_nationality` DISABLE KEYS */;
INSERT INTO `zgctr_nationality` (`id`, `code`, `name`, `comment`) VALUES
	(1, 'b0b17aa4514ed38e669aa9729ce25cd9', 'Cubana', NULL),
	(2, 'bd271a0e8ce83444ae0ed2877f622d35', 'Española', NULL);
/*!40000 ALTER TABLE `zgctr_nationality` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_paymentinstrument
DROP TABLE IF EXISTS `zgctr_paymentinstrument`;
CREATE TABLE IF NOT EXISTS `zgctr_paymentinstrument` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_paymentinstrument: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_paymentinstrument` DISABLE KEYS */;
INSERT INTO `zgctr_paymentinstrument` (`id`, `code`, `name`, `comment`) VALUES
	(1, '847849d339873099ea49c35bcecb4825', 'Dinero efectivo', NULL),
	(2, '1e506642240f52ed5be14118abc749ca', 'Transferencia bancaria', NULL),
	(3, '2a42b425b5fac0ff0927464f593558fe', 'Cheque certificado', NULL),
	(4, 'b376322e0498bd6d075b5fb183815a2b', 'Cheque voucher', NULL),
	(5, 'cf47820e6d7772181422403f534b2f64', 'Cheque de gerencia', NULL),
	(6, '7028b582c2edada8456cd3b98482f198', 'Orden de cobro', NULL),
	(7, '0193f03289f5f2613c5dfa4c50cf9eb4', 'Tarjeta débito o crédito', NULL),
	(8, '430535e6c01f14fde6e59925cfaa79c2', 'Carta de crédito local', NULL),
	(9, '33edfccf539e8c1d64f49f113fbfdae7', 'Letra de cambio', NULL),
	(10, 'c3475caeecb77c2b7e48dac7f890cf08', 'Pagaré', NULL);
/*!40000 ALTER TABLE `zgctr_paymentinstrument` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_reclamationstatus
DROP TABLE IF EXISTS `zgctr_reclamationstatus`;
CREATE TABLE IF NOT EXISTS `zgctr_reclamationstatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customcolor` text DEFAULT NULL,
  `calendarid` bigint(20) DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  `iscomplete` tinyint(1) DEFAULT 0,
  `issuspended` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarid_idx` (`calendarid`),
  CONSTRAINT `zgctr_reclamationstatus_calendarid_zab_calendar_id` FOREIGN KEY (`calendarid`) REFERENCES `zab_calendar` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_reclamationstatus: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_reclamationstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgctr_reclamationstatus` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_reclamationstatusrelation
DROP TABLE IF EXISTS `zgctr_reclamationstatusrelation`;
CREATE TABLE IF NOT EXISTS `zgctr_reclamationstatusrelation` (
  `fromstatus_id` bigint(20) NOT NULL,
  `tostatus_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fromstatus_id`,`tostatus_id`),
  KEY `ztzi` (`tostatus_id`),
  CONSTRAINT `zfzi_1` FOREIGN KEY (`fromstatus_id`) REFERENCES `zgctr_reclamationstatus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ztzi` FOREIGN KEY (`tostatus_id`) REFERENCES `zgctr_reclamationstatus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_reclamationstatusrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_reclamationstatusrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgctr_reclamationstatusrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgctr_reclamationtype
DROP TABLE IF EXISTS `zgctr_reclamationtype`;
CREATE TABLE IF NOT EXISTS `zgctr_reclamationtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgctr_reclamationtype: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `zgctr_reclamationtype` DISABLE KEYS */;
INSERT INTO `zgctr_reclamationtype` (`id`, `code`, `name`, `comment`) VALUES
	(1, 'e6ffcf1e8391ffc9b743fd26b8ee03e9', 'Impagos', NULL),
	(2, '88cb9ed348e98565054d069c42940449', 'Calidad', NULL),
	(3, 'bb45de6198d75a82b683db2bd232c233', 'Faltante', NULL),
	(4, '770f4f806a7f700a3fd4e2954d43c929', 'Sobrante', NULL),
	(5, 'd447e1f1efb884b3e5349ea1c79b36d6', 'Diferencia en peso', NULL),
	(6, '27e191070864275e976f6dd1d2dfa8fb', 'Producto diferente al contratado', NULL);
/*!40000 ALTER TABLE `zgctr_reclamationtype` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgfact_contractproductrelation
DROP TABLE IF EXISTS `zgfact_contractproductrelation`;
CREATE TABLE IF NOT EXISTS `zgfact_contractproductrelation` (
  `productid` bigint(20) NOT NULL,
  `contractid` bigint(20) NOT NULL,
  PRIMARY KEY (`productid`,`contractid`),
  KEY `zgfact_contractproductrelation_contractid_zgctr_contract_id` (`contractid`),
  CONSTRAINT `zgfact_contractproductrelation_contractid_zgctr_contract_id` FOREIGN KEY (`contractid`) REFERENCES `zgctr_contract` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgfact_contractproductrelation_productid_zginv_product_id` FOREIGN KEY (`productid`) REFERENCES `zginv_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgfact_contractproductrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgfact_contractproductrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgfact_contractproductrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgfact_invoice
DROP TABLE IF EXISTS `zgfact_invoice`;
CREATE TABLE IF NOT EXISTS `zgfact_invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `products` text DEFAULT NULL,
  `contractid` bigint(20) DEFAULT NULL,
  `comprobantid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contractid_idx` (`contractid`),
  KEY `comprobantid_idx` (`comprobantid`),
  CONSTRAINT `zgfact_invoice_comprobantid_zmc_comprobant_id` FOREIGN KEY (`comprobantid`) REFERENCES `zmc_comprobant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgfact_invoice_contractid_zgctr_contract_id` FOREIGN KEY (`contractid`) REFERENCES `zgctr_contract` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgfact_invoice: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgfact_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgfact_invoice` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgfact_invoiceitem
DROP TABLE IF EXISTS `zgfact_invoiceitem`;
CREATE TABLE IF NOT EXISTS `zgfact_invoiceitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoiceid` bigint(20) DEFAULT NULL,
  `transactionid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceid_idx` (`invoiceid`),
  KEY `transactionid_idx` (`transactionid`),
  CONSTRAINT `zgfact_invoiceitem_invoiceid_zgfact_invoice_id` FOREIGN KEY (`invoiceid`) REFERENCES `zgfact_invoice` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgfact_invoiceitem_transactionid_zmc_transaction_id` FOREIGN KEY (`transactionid`) REFERENCES `zmc_transaction` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgfact_invoiceitem: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgfact_invoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgfact_invoiceitem` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgfact_invoicetaxrelation
DROP TABLE IF EXISTS `zgfact_invoicetaxrelation`;
CREATE TABLE IF NOT EXISTS `zgfact_invoicetaxrelation` (
  `invoiceid` bigint(20) NOT NULL,
  `taxid` bigint(20) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `fixed` tinyint(1) DEFAULT NULL,
  `currencyid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`invoiceid`,`taxid`),
  KEY `currencyid_idx` (`currencyid`),
  KEY `zgfact_invoicetaxrelation_taxid_zgfact_tax_id` (`taxid`),
  CONSTRAINT `zgfact_invoicetaxrelation_currencyid_zmc_currency_id` FOREIGN KEY (`currencyid`) REFERENCES `zmc_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgfact_invoicetaxrelation_invoiceid_zgfact_invoice_id` FOREIGN KEY (`invoiceid`) REFERENCES `zgfact_invoice` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zgfact_invoicetaxrelation_taxid_zgfact_tax_id` FOREIGN KEY (`taxid`) REFERENCES `zgfact_tax` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgfact_invoicetaxrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zgfact_invoicetaxrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zgfact_invoicetaxrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zgfact_tax
DROP TABLE IF EXISTS `zgfact_tax`;
CREATE TABLE IF NOT EXISTS `zgfact_tax` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zgfact_tax: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `zgfact_tax` DISABLE KEYS */;
INSERT INTO `zgfact_tax` (`id`, `code`, `name`, `comment`, `entityid`) VALUES
	(1, '482cc7a0aa3a38d9b65db974eb27bb5d', 'IVA', NULL, NULL),
	(2, 'ef6402f51649af378439fd5c2999b4b0', 'Descuento', NULL, NULL);
/*!40000 ALTER TABLE `zgfact_tax` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zginv_product
DROP TABLE IF EXISTS `zginv_product`;
CREATE TABLE IF NOT EXISTS `zginv_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(18,2) NOT NULL,
  `currencyid` bigint(20) DEFAULT NULL,
  `elementid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencyid_idx` (`currencyid`),
  KEY `elementid_idx` (`elementid`),
  CONSTRAINT `zginv_product_currencyid_zmc_currency_id` FOREIGN KEY (`currencyid`) REFERENCES `zmc_currency` (`id`) ON DELETE SET NULL,
  CONSTRAINT `zginv_product_elementid_zmc_element_id` FOREIGN KEY (`elementid`) REFERENCES `zmc_element` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zginv_product: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zginv_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `zginv_product` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zginv_producttaxrelation
DROP TABLE IF EXISTS `zginv_producttaxrelation`;
CREATE TABLE IF NOT EXISTS `zginv_producttaxrelation` (
  `productid` bigint(20) NOT NULL,
  `taxid` bigint(20) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `fixed` tinyint(1) DEFAULT NULL,
  `currencyid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`productid`,`taxid`),
  KEY `currencyid_idx` (`currencyid`),
  KEY `zginv_producttaxrelation_taxid_zgfact_tax_id` (`taxid`),
  CONSTRAINT `zginv_producttaxrelation_currencyid_zmc_currency_id` FOREIGN KEY (`currencyid`) REFERENCES `zmc_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zginv_producttaxrelation_productid_zginv_product_id` FOREIGN KEY (`productid`) REFERENCES `zginv_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zginv_producttaxrelation_taxid_zgfact_tax_id` FOREIGN KEY (`taxid`) REFERENCES `zgfact_tax` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zginv_producttaxrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zginv_producttaxrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zginv_producttaxrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zi1_position
DROP TABLE IF EXISTS `zi1_position`;
CREATE TABLE IF NOT EXISTS `zi1_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zi1_position: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zi1_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `zi1_position` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_account
DROP TABLE IF EXISTS `zmc_account`;
CREATE TABLE IF NOT EXISTS `zmc_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `costcenterid` bigint(20) DEFAULT NULL,
  `elementid` bigint(20) DEFAULT NULL,
  `nature` tinyint(1) DEFAULT 1,
  `manualcode` tinyint(1) DEFAULT 0,
  `icon` text DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parentid_idx` (`parentid`),
  KEY `costcenterid_idx` (`costcenterid`),
  KEY `elementid_idx` (`elementid`),
  CONSTRAINT `zmc_account_costcenterid_zmc_costcenter_id` FOREIGN KEY (`costcenterid`) REFERENCES `zmc_costcenter` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_account_elementid_zmc_element_id` FOREIGN KEY (`elementid`) REFERENCES `zmc_element` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_account_parentid_zmc_account_id` FOREIGN KEY (`parentid`) REFERENCES `zmc_account` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_account: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_account` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_closeup
DROP TABLE IF EXISTS `zmc_closeup`;
CREATE TABLE IF NOT EXISTS `zmc_closeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_closeup: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_closeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_closeup` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_comprobant
DROP TABLE IF EXISTS `zmc_comprobant`;
CREATE TABLE IF NOT EXISTS `zmc_comprobant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `is_modificable` tinyint(1) DEFAULT 1,
  `entityid` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_comprobant: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_comprobant` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_comprobant` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_costcenter
DROP TABLE IF EXISTS `zmc_costcenter`;
CREATE TABLE IF NOT EXISTS `zmc_costcenter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parentid_idx` (`parentid`),
  CONSTRAINT `zmc_costcenter_parentid_zmc_costcenter_id` FOREIGN KEY (`parentid`) REFERENCES `zmc_costcenter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_costcenter: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_costcenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_costcenter` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_costcenterelementrelation
DROP TABLE IF EXISTS `zmc_costcenterelementrelation`;
CREATE TABLE IF NOT EXISTS `zmc_costcenterelementrelation` (
  `costcenter_id` bigint(20) NOT NULL,
  `element_id` bigint(20) NOT NULL,
  PRIMARY KEY (`costcenter_id`,`element_id`),
  KEY `zmc_costcenterelementrelation_element_id_zmc_element_id` (`element_id`),
  CONSTRAINT `zmc_costcenterelementrelation_costcenter_id_zmc_costcenter_id` FOREIGN KEY (`costcenter_id`) REFERENCES `zmc_costcenter` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_costcenterelementrelation_element_id_zmc_element_id` FOREIGN KEY (`element_id`) REFERENCES `zmc_element` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_costcenterelementrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_costcenterelementrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_costcenterelementrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_currency
DROP TABLE IF EXISTS `zmc_currency`;
CREATE TABLE IF NOT EXISTS `zmc_currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  `rate` decimal(6,5) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_currency: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_currency` DISABLE KEYS */;
INSERT INTO `zmc_currency` (`id`, `code`, `name`, `comment`, `rate`, `isactive`) VALUES
	(1, 'CUP', 'Peso cubano', NULL, 1.00000, 1),
	(2, 'CUC', 'Peso cubano libremente convertible', NULL, 0.04000, 1);
/*!40000 ALTER TABLE `zmc_currency` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_element
DROP TABLE IF EXISTS `zmc_element`;
CREATE TABLE IF NOT EXISTS `zmc_element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` text DEFAULT NULL,
  `name` varchar(130) NOT NULL,
  `code` varchar(50) NOT NULL,
  `umid` bigint(20) DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `umid_idx` (`umid`),
  CONSTRAINT `zmc_element_umid_zmc_um_id` FOREIGN KEY (`umid`) REFERENCES `zmc_um` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_element: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_element` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_elementelementrelation
DROP TABLE IF EXISTS `zmc_elementelementrelation`;
CREATE TABLE IF NOT EXISTS `zmc_elementelementrelation` (
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `rate` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`from_id`,`to_id`),
  KEY `zmc_elementelementrelation_to_id_zmc_element_id` (`to_id`),
  CONSTRAINT `zmc_elementelementrelation_from_id_zmc_element_id` FOREIGN KEY (`from_id`) REFERENCES `zmc_element` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_elementelementrelation_to_id_zmc_element_id` FOREIGN KEY (`to_id`) REFERENCES `zmc_element` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_elementelementrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_elementelementrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_elementelementrelation` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_transaction
DROP TABLE IF EXISTS `zmc_transaction`;
CREATE TABLE IF NOT EXISTS `zmc_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` text DEFAULT NULL,
  `debit` decimal(18,2) DEFAULT NULL,
  `credit` decimal(18,2) DEFAULT NULL,
  `rate` decimal(6,5) DEFAULT NULL,
  `currencyid` bigint(20) DEFAULT NULL,
  `comprobantid` bigint(20) DEFAULT NULL,
  `accountid` bigint(20) DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `umid` bigint(20) DEFAULT NULL,
  `creditave` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencyid_idx` (`currencyid`),
  KEY `comprobantid_idx` (`comprobantid`),
  KEY `accountid_idx` (`accountid`),
  KEY `umid_idx` (`umid`),
  CONSTRAINT `zmc_transaction_accountid_zmc_account_id` FOREIGN KEY (`accountid`) REFERENCES `zmc_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_transaction_comprobantid_zmc_comprobant_id` FOREIGN KEY (`comprobantid`) REFERENCES `zmc_comprobant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_transaction_currencyid_zmc_currency_id` FOREIGN KEY (`currencyid`) REFERENCES `zmc_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_transaction_umid_zmc_um_id` FOREIGN KEY (`umid`) REFERENCES `zmc_um` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_transaction: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_transaction` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_um
DROP TABLE IF EXISTS `zmc_um`;
CREATE TABLE IF NOT EXISTS `zmc_um` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(130) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_um: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_um` DISABLE KEYS */;
INSERT INTO `zmc_um` (`id`, `code`, `name`, `comment`) VALUES
	(1, '8752a00d9c3c72e1c09a2e85e6cb82dd', 'Unidad', NULL);
/*!40000 ALTER TABLE `zmc_um` ENABLE KEYS */;


-- Volcando estructura para tabla zgintegral.zmc_umumrelation
DROP TABLE IF EXISTS `zmc_umumrelation`;
CREATE TABLE IF NOT EXISTS `zmc_umumrelation` (
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `rate` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`from_id`,`to_id`),
  KEY `zmc_umumrelation_to_id_zmc_um_id` (`to_id`),
  CONSTRAINT `zmc_umumrelation_from_id_zmc_um_id` FOREIGN KEY (`from_id`) REFERENCES `zmc_um` (`id`) ON DELETE CASCADE,
  CONSTRAINT `zmc_umumrelation_to_id_zmc_um_id` FOREIGN KEY (`to_id`) REFERENCES `zmc_um` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla zgintegral.zmc_umumrelation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zmc_umumrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zmc_umumrelation` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
