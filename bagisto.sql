-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para ecommerce
CREATE DATABASE IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;

-- Volcando estructura para tabla ecommerce.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.addresses: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.admins: ~2 rows (aproximadamente)
INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'yomira@soluciones-hericraft.com', '$2y$12$4b1VB3RGynUjPTsl80YOV.Ra27UsdA08zTqzs4ETHzM2uh.sFoLhm', 'e5O8jZELVYhNtbSe2KJgcu3U4PgUX10aKbGp1IfbYSac7OVYEAbxV1H37NMioipU3xqYHZUkgffKpvOX', 1, 1, NULL, NULL, '2025-04-04 13:13:07', '2025-04-04 01:48:34'),
	(2, 'Lucy', 'analucia@soluciones-hericraft.com', '$2y$12$kcZYAs/Hgmeh.zki47lQOOHuX93lRjtURP2J/xKtgRiQVhfsvZll.', 'uD7Lxc3sCVNuwT2vrqa4St8Lxw1V52TI2rXHJCaNVrxSsldldEmMzKoP8yoXMFpBXZB7ImBpbICzevsL', 1, 1, NULL, NULL, '2025-04-04 02:09:14', '2025-04-04 02:09:14');

-- Volcando estructura para tabla ecommerce.admin_password_resets
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.admin_password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.attributes: ~28 rows (aproximadamente)
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
	(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(2, 'name', 'Nombre', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(3, 'url_key', 'Clave de URL', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(4, 'tax_category_id', 'Categoría de Impuestos', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(5, 'new', 'Nuevo', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(6, 'featured', 'Destacado', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(7, 'visible_individually', 'Visible Individualmente', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(8, 'status', 'Estado', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(9, 'short_description', 'Descripción Corta', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(10, 'description', 'Descripción', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(11, 'price', 'Precio', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(12, 'cost', 'Costo', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(13, 'special_price', 'Precio Especial', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(14, 'special_price_from', 'Precio Especial Desde', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(15, 'special_price_to', 'Precio Especial Hasta', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(16, 'meta_title', 'Meta Título', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(17, 'meta_keywords', 'Meta Palabras Clave', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(18, 'meta_description', 'Meta Descripción', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(19, 'length', 'Longitud', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(20, 'width', 'Ancho', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(21, 'height', 'Altura', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(22, 'weight', 'Peso', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(23, 'color', 'Color', 'select', NULL, NULL, NULL, 26, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(24, 'size', 'Tamaño', 'select', NULL, NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(25, 'brand', 'Marca', 'select', NULL, NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(26, 'guest_checkout', 'Compra de Invitado', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(27, 'product_number', 'Número de Producto', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(28, 'manage_stock', 'Gestionar Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2025-04-04 13:13:05', '2025-04-04 13:13:05');

-- Volcando estructura para tabla ecommerce.attribute_families
CREATE TABLE IF NOT EXISTS `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.attribute_families: ~0 rows (aproximadamente)
INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
	(1, 'default', 'Predeterminado', 0, 1);

-- Volcando estructura para tabla ecommerce.attribute_groups
CREATE TABLE IF NOT EXISTS `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.attribute_groups: ~7 rows (aproximadamente)
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
	(1, 'general', 1, 'General', 1, 1, 0),
	(2, 'description', 1, 'Descripción', 1, 2, 0),
	(3, 'meta_description', 1, 'Meta Descripción', 1, 3, 0),
	(4, 'price', 1, 'Precio', 2, 1, 0),
	(5, 'shipping', 1, 'Envío', 2, 2, 0),
	(6, 'settings', 1, 'Configuraciones', 2, 3, 0),
	(7, 'inventories', 1, 'Inventarios', 2, 4, 0);

-- Volcando estructura para tabla ecommerce.attribute_group_mappings
CREATE TABLE IF NOT EXISTS `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.attribute_group_mappings: ~28 rows (aproximadamente)
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
	(1, 1, 1),
	(2, 1, 3),
	(3, 1, 4),
	(4, 1, 5),
	(5, 6, 1),
	(6, 6, 2),
	(7, 6, 3),
	(8, 6, 4),
	(9, 2, 1),
	(10, 2, 2),
	(11, 4, 1),
	(12, 4, 2),
	(13, 4, 3),
	(14, 4, 4),
	(15, 4, 5),
	(16, 3, 1),
	(17, 3, 2),
	(18, 3, 3),
	(19, 5, 1),
	(20, 5, 2),
	(21, 5, 3),
	(22, 5, 4),
	(23, 1, 6),
	(24, 1, 7),
	(25, 1, 8),
	(26, 6, 5),
	(27, 1, 2),
	(28, 7, 1);

-- Volcando estructura para tabla ecommerce.attribute_options
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.attribute_options: ~9 rows (aproximadamente)
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES
	(1, 23, 'Rojo', 1, NULL),
	(2, 23, 'Verde', 2, NULL),
	(3, 23, 'Amarillo', 3, NULL),
	(4, 23, 'Negro', 4, NULL),
	(5, 23, 'Blanco', 5, NULL),
	(6, 24, 'S', 1, NULL),
	(7, 24, 'M', 2, NULL),
	(8, 24, 'L', 3, NULL),
	(9, 24, 'XL', 4, NULL);

-- Volcando estructura para tabla ecommerce.attribute_option_translations
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.attribute_option_translations: ~9 rows (aproximadamente)
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES
	(1, 1, 'es', 'Rojo'),
	(2, 2, 'es', 'Verde'),
	(3, 3, 'es', 'Amarillo'),
	(4, 4, 'es', 'Negro'),
	(5, 5, 'es', 'Blanco'),
	(6, 6, 'es', 'S'),
	(7, 7, 'es', 'M'),
	(8, 8, 'es', 'L'),
	(9, 9, 'es', 'XL');

-- Volcando estructura para tabla ecommerce.attribute_translations
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.attribute_translations: ~28 rows (aproximadamente)
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
	(1, 1, 'es', 'SKU'),
	(2, 2, 'es', 'Nombre'),
	(3, 3, 'es', 'Clave de URL'),
	(4, 4, 'es', 'Categoría de Impuestos'),
	(5, 5, 'es', 'Nuevo'),
	(6, 6, 'es', 'Destacado'),
	(7, 7, 'es', 'Visible Individualmente'),
	(8, 8, 'es', 'Estado'),
	(9, 9, 'es', 'Descripción Corta'),
	(10, 10, 'es', 'Descripción'),
	(11, 11, 'es', 'Precio'),
	(12, 12, 'es', 'Costo'),
	(13, 13, 'es', 'Precio Especial'),
	(14, 14, 'es', 'Precio Especial Desde'),
	(15, 15, 'es', 'Precio Especial Hasta'),
	(16, 16, 'es', 'Meta Título'),
	(17, 17, 'es', 'Meta Palabras Clave'),
	(18, 18, 'es', 'Meta Descripción'),
	(19, 19, 'es', 'Longitud'),
	(20, 20, 'es', 'Ancho'),
	(21, 21, 'es', 'Altura'),
	(22, 22, 'es', 'Peso'),
	(23, 23, 'es', 'Color'),
	(24, 24, 'es', 'Tamaño'),
	(25, 25, 'es', 'Marca'),
	(26, 26, 'es', 'Compra de Invitado'),
	(27, 27, 'es', 'Número de Producto'),
	(28, 28, 'es', 'Gestionar Stock');

-- Volcando estructura para tabla ecommerce.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `booking_product_event_ticket_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_item_id_foreign` (`order_item_id`),
  KEY `bookings_booking_product_event_ticket_id_foreign` (`booking_product_event_ticket_id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_booking_product_event_ticket_id_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.bookings: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.booking_products
CREATE TABLE IF NOT EXISTS `booking_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.booking_products: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.booking_product_appointment_slots
CREATE TABLE IF NOT EXISTS `booking_product_appointment_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.booking_product_appointment_slots: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.booking_product_default_slots
CREATE TABLE IF NOT EXISTS `booking_product_default_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `booking_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.booking_product_default_slots: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.booking_product_event_tickets
CREATE TABLE IF NOT EXISTS `booking_product_event_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.booking_product_event_tickets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.booking_product_event_ticket_translations
CREATE TABLE IF NOT EXISTS `booking_product_event_ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_event_ticket_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bpet_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `bpet_translations_fk` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.booking_product_event_ticket_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.booking_product_rental_slots
CREATE TABLE IF NOT EXISTS `booking_product_rental_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `renting_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.booking_product_rental_slots: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.booking_product_table_slots
CREATE TABLE IF NOT EXISTS `booking_product_table_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.booking_product_table_slots: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `checkout_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_item_inventories
CREATE TABLE IF NOT EXISTS `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_item_inventories: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_payment
CREATE TABLE IF NOT EXISTS `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_payment: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_rules
CREATE TABLE IF NOT EXISTS `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_rules: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_rule_channels
CREATE TABLE IF NOT EXISTS `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_rule_channels: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_rule_coupons
CREATE TABLE IF NOT EXISTS `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_rule_coupons: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_rule_coupon_usage
CREATE TABLE IF NOT EXISTS `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_rule_coupon_usage: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_rule_customers
CREATE TABLE IF NOT EXISTS `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `customer_id` int unsigned NOT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_rule_customers: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_rule_customer_groups
CREATE TABLE IF NOT EXISTS `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_rule_customer_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_rule_translations
CREATE TABLE IF NOT EXISTS `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_rule_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cart_shipping_rates
CREATE TABLE IF NOT EXISTS `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cart_shipping_rates: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.catalog_rules
CREATE TABLE IF NOT EXISTS `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.catalog_rules: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.catalog_rule_channels
CREATE TABLE IF NOT EXISTS `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.catalog_rule_channels: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.catalog_rule_customer_groups
CREATE TABLE IF NOT EXISTS `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.catalog_rule_customer_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.catalog_rule_products
CREATE TABLE IF NOT EXISTS `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.catalog_rule_products: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.catalog_rule_product_prices
CREATE TABLE IF NOT EXISTS `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.catalog_rule_product_prices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.categories: ~0 rows (aproximadamente)
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 1, 'products_and_description', 1, 6, NULL, NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05');

-- Volcando estructura para tabla ecommerce.category_filterable_attributes
CREATE TABLE IF NOT EXISTS `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.category_filterable_attributes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.category_translations
CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.category_translations: ~0 rows (aproximadamente)
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES
	(1, 1, 'Raíz', 'root', '', 'Descripción de la Categoría Raíz', '', '', '', NULL, 'es');

-- Volcando estructura para tabla ecommerce.channels
CREATE TABLE IF NOT EXISTS `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `root_category_id` int unsigned DEFAULT NULL,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.channels: ~0 rows (aproximadamente)
INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
	(1, 'default', NULL, 'default', 'http://localhost', NULL, NULL, NULL, 0, NULL, 1, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05');

-- Volcando estructura para tabla ecommerce.channel_currencies
CREATE TABLE IF NOT EXISTS `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.channel_currencies: ~0 rows (aproximadamente)
INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
	(1, 1);

-- Volcando estructura para tabla ecommerce.channel_inventory_sources
CREATE TABLE IF NOT EXISTS `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_source_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.channel_inventory_sources: ~0 rows (aproximadamente)
INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
	(1, 1);

-- Volcando estructura para tabla ecommerce.channel_locales
CREATE TABLE IF NOT EXISTS `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.channel_locales: ~0 rows (aproximadamente)
INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
	(1, 1);

-- Volcando estructura para tabla ecommerce.channel_translations
CREATE TABLE IF NOT EXISTS `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.channel_translations: ~0 rows (aproximadamente)
INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
	(1, 1, 'es', 'Predeterminado', NULL, NULL, '{"meta_title": "Tienda de Demostración", "meta_keywords": "Palabras Clave de Meta de la Tienda de Demostración", "meta_description": "Descripción de Meta de la Tienda de Demostración"}', NULL, NULL);

-- Volcando estructura para tabla ecommerce.cms_pages
CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cms_pages: ~10 rows (aproximadamente)
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
	(1, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(2, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(3, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(4, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(5, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(6, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(7, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(8, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(9, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(10, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05');

-- Volcando estructura para tabla ecommerce.cms_page_channels
CREATE TABLE IF NOT EXISTS `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cms_page_channels: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.cms_page_translations
CREATE TABLE IF NOT EXISTS `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.cms_page_translations: ~10 rows (aproximadamente)
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
	(1, 'Acerca de Nosotros', 'about-us', '<div class="static-container"><div class="mb-5">Contenido de la Página Acerca de Nosotros</div></div>', 'about us', '', 'aboutus', 'es', 1),
	(2, 'Política de Retorno', 'return-policy', '<div class="static-container"><div class="mb-5">Contenido de la Página Política de Retorno</div></div>', 'return policy', '', 'return, policy', 'es', 2),
	(3, 'Política de Devolución', 'refund-policy', '<div class="static-container"><div class="mb-5">Contenido de la Página Política de Devolución</div></div>', 'Refund policy', '', 'refund, policy', 'es', 3),
	(4, 'Términos y Condiciones', 'terms-conditions', '<div class="static-container"><div class="mb-5">Contenido de la Página Términos y Condiciones</div></div>', 'Terms & Conditions', '', 'term, conditions', 'es', 4),
	(5, 'Términos de Uso', 'terms-of-use', '<div class="static-container"><div class="mb-5">Contenido de la Página Términos de Uso</div></div>', 'Terms of use', '', 'term, use', 'es', 5),
	(6, 'Servicio al Cliente', 'customer-service', '<div class="static-container"><div class="mb-5">Contenido de la Página Servicio al Cliente</div></div>', 'Customer Service', '', 'customer, service', 'es', 6),
	(7, 'Novedades', 'whats-new', '<div class="static-container"><div class="mb-5">Contenido de la Página Novedades</div></div>', 'What\'s New', '', 'new', 'es', 7),
	(8, 'Política de Pago', 'payment-policy', '<div class="static-container"><div class="mb-5">Contenido de la Página Política de Pago</div></div>', 'Payment Policy', '', 'payment, policy', 'es', 8),
	(9, 'Política de Envío', 'shipping-policy', '<div class="static-container"><div class="mb-5">Contenido de la Página Política de Envío</div></div>', 'Shipping Policy', '', 'shipping, policy', 'es', 9),
	(10, 'Política de Privacidad', 'privacy-policy', '<div class="static-container"><div class="mb-5">Contenido de la Página Política de Privacidad</div></div>', 'Privacy Policy', '', 'privacy, policy', 'es', 10);

-- Volcando estructura para tabla ecommerce.compare_items
CREATE TABLE IF NOT EXISTS `compare_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.compare_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.core_config
CREATE TABLE IF NOT EXISTS `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.core_config: ~21 rows (aproximadamente)
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
	(1, 'sales.checkout.shopping_cart.allow_guest_checkout', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(4, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '0', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(5, 'emails.general.notifications.emails.general.notifications.customer_account_credentials', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(6, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(7, 'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(8, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(9, 'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin', '0', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(10, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(11, 'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin', '0', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(12, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(13, 'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin', '0', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(14, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(15, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(16, 'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin', '0', NULL, NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(17, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(18, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(19, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(20, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(21, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2025-04-04 13:13:05', '2025-04-04 13:13:05');

-- Volcando estructura para tabla ecommerce.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.countries: ~254 rows (aproximadamente)
INSERT INTO `countries` (`id`, `code`, `name`) VALUES
	(1, 'AF', 'Afghanistan'),
	(2, 'AX', 'Åland Islands'),
	(3, 'AL', 'Albania'),
	(4, 'DZ', 'Algeria'),
	(5, 'AS', 'American Samoa'),
	(6, 'AD', 'Andorra'),
	(7, 'AO', 'Angola'),
	(8, 'AI', 'Anguilla'),
	(9, 'AQ', 'Antarctica'),
	(10, 'AG', 'Antigua & Barbuda'),
	(11, 'AR', 'Argentina'),
	(12, 'AM', 'Armenia'),
	(13, 'AW', 'Aruba'),
	(14, 'AC', 'Ascension Island'),
	(15, 'AU', 'Australia'),
	(16, 'AT', 'Austria'),
	(17, 'AZ', 'Azerbaijan'),
	(18, 'BS', 'Bahamas'),
	(19, 'BH', 'Bahrain'),
	(20, 'BD', 'Bangladesh'),
	(21, 'BB', 'Barbados'),
	(22, 'BY', 'Belarus'),
	(23, 'BE', 'Belgium'),
	(24, 'BZ', 'Belize'),
	(25, 'BJ', 'Benin'),
	(26, 'BM', 'Bermuda'),
	(27, 'BT', 'Bhutan'),
	(28, 'BO', 'Bolivia'),
	(29, 'BA', 'Bosnia & Herzegovina'),
	(30, 'BW', 'Botswana'),
	(31, 'BR', 'Brazil'),
	(32, 'IO', 'British Indian Ocean Territory'),
	(33, 'VG', 'British Virgin Islands'),
	(34, 'BN', 'Brunei'),
	(35, 'BG', 'Bulgaria'),
	(36, 'BF', 'Burkina Faso'),
	(37, 'BI', 'Burundi'),
	(38, 'KH', 'Cambodia'),
	(39, 'CM', 'Cameroon'),
	(40, 'CA', 'Canada'),
	(41, 'IC', 'Canary Islands'),
	(42, 'CV', 'Cape Verde'),
	(43, 'BQ', 'Caribbean Netherlands'),
	(44, 'KY', 'Cayman Islands'),
	(45, 'CF', 'Central African Republic'),
	(46, 'EA', 'Ceuta & Melilla'),
	(47, 'TD', 'Chad'),
	(48, 'CL', 'Chile'),
	(49, 'CN', 'China'),
	(50, 'CX', 'Christmas Island'),
	(51, 'CC', 'Cocos (Keeling) Islands'),
	(52, 'CO', 'Colombia'),
	(53, 'KM', 'Comoros'),
	(54, 'CG', 'Congo - Brazzaville'),
	(55, 'CD', 'Congo - Kinshasa'),
	(56, 'CK', 'Cook Islands'),
	(57, 'CR', 'Costa Rica'),
	(58, 'CI', 'Côte d’Ivoire'),
	(59, 'HR', 'Croatia'),
	(60, 'CU', 'Cuba'),
	(61, 'CW', 'Curaçao'),
	(62, 'CY', 'Cyprus'),
	(63, 'CZ', 'Czechia'),
	(64, 'DK', 'Denmark'),
	(65, 'DG', 'Diego Garcia'),
	(66, 'DJ', 'Djibouti'),
	(67, 'DM', 'Dominica'),
	(68, 'DO', 'Dominican Republic'),
	(69, 'EC', 'Ecuador'),
	(70, 'EG', 'Egypt'),
	(71, 'SV', 'El Salvador'),
	(72, 'GQ', 'Equatorial Guinea'),
	(73, 'ER', 'Eritrea'),
	(74, 'EE', 'Estonia'),
	(75, 'ET', 'Ethiopia'),
	(76, 'EZ', 'Eurozone'),
	(77, 'FK', 'Falkland Islands'),
	(78, 'FO', 'Faroe Islands'),
	(79, 'FJ', 'Fiji'),
	(80, 'FI', 'Finland'),
	(81, 'FR', 'France'),
	(82, 'GF', 'French Guiana'),
	(83, 'PF', 'French Polynesia'),
	(84, 'TF', 'French Southern Territories'),
	(85, 'GA', 'Gabon'),
	(86, 'GM', 'Gambia'),
	(87, 'GE', 'Georgia'),
	(88, 'DE', 'Germany'),
	(89, 'GH', 'Ghana'),
	(90, 'GI', 'Gibraltar'),
	(91, 'GR', 'Greece'),
	(92, 'GL', 'Greenland'),
	(93, 'GD', 'Grenada'),
	(94, 'GP', 'Guadeloupe'),
	(95, 'GU', 'Guam'),
	(96, 'GT', 'Guatemala'),
	(97, 'GG', 'Guernsey'),
	(98, 'GN', 'Guinea'),
	(99, 'GW', 'Guinea-Bissau'),
	(100, 'GY', 'Guyana'),
	(101, 'HT', 'Haiti'),
	(102, 'HN', 'Honduras'),
	(103, 'HK', 'Hong Kong SAR China'),
	(104, 'HU', 'Hungary'),
	(105, 'IS', 'Iceland'),
	(106, 'IN', 'India'),
	(107, 'ID', 'Indonesia'),
	(108, 'IR', 'Iran'),
	(109, 'IQ', 'Iraq'),
	(110, 'IE', 'Ireland'),
	(111, 'IM', 'Isle of Man'),
	(112, 'IL', 'Israel'),
	(113, 'IT', 'Italy'),
	(114, 'JM', 'Jamaica'),
	(115, 'JP', 'Japan'),
	(116, 'JE', 'Jersey'),
	(117, 'JO', 'Jordan'),
	(118, 'KZ', 'Kazakhstan'),
	(119, 'KE', 'Kenya'),
	(120, 'KI', 'Kiribati'),
	(121, 'XK', 'Kosovo'),
	(122, 'KW', 'Kuwait'),
	(123, 'KG', 'Kyrgyzstan'),
	(124, 'LA', 'Laos'),
	(125, 'LV', 'Latvia'),
	(126, 'LB', 'Lebanon'),
	(127, 'LS', 'Lesotho'),
	(128, 'LR', 'Liberia'),
	(129, 'LY', 'Libya'),
	(130, 'LI', 'Liechtenstein'),
	(131, 'LT', 'Lithuania'),
	(132, 'LU', 'Luxembourg'),
	(133, 'MO', 'Macau SAR China'),
	(134, 'MK', 'Macedonia'),
	(135, 'MG', 'Madagascar'),
	(136, 'MW', 'Malawi'),
	(137, 'MY', 'Malaysia'),
	(138, 'MV', 'Maldives'),
	(139, 'ML', 'Mali'),
	(140, 'MT', 'Malta'),
	(141, 'MH', 'Marshall Islands'),
	(142, 'MQ', 'Martinique'),
	(143, 'MR', 'Mauritania'),
	(144, 'MU', 'Mauritius'),
	(145, 'YT', 'Mayotte'),
	(146, 'MX', 'Mexico'),
	(147, 'FM', 'Micronesia'),
	(148, 'MD', 'Moldova'),
	(149, 'MC', 'Monaco'),
	(150, 'MN', 'Mongolia'),
	(151, 'ME', 'Montenegro'),
	(152, 'MS', 'Montserrat'),
	(153, 'MA', 'Morocco'),
	(154, 'MZ', 'Mozambique'),
	(155, 'MM', 'Myanmar (Burma)'),
	(156, 'NA', 'Namibia'),
	(157, 'NR', 'Nauru'),
	(158, 'NP', 'Nepal'),
	(159, 'NL', 'Netherlands'),
	(160, 'NC', 'New Caledonia'),
	(161, 'NZ', 'New Zealand'),
	(162, 'NI', 'Nicaragua'),
	(163, 'NE', 'Niger'),
	(164, 'NG', 'Nigeria'),
	(165, 'NU', 'Niue'),
	(166, 'NF', 'Norfolk Island'),
	(167, 'KP', 'North Korea'),
	(168, 'MP', 'Northern Mariana Islands'),
	(169, 'NO', 'Norway'),
	(170, 'OM', 'Oman'),
	(171, 'PK', 'Pakistan'),
	(172, 'PW', 'Palau'),
	(173, 'PS', 'Palestinian Territories'),
	(174, 'PA', 'Panama'),
	(175, 'PG', 'Papua New Guinea'),
	(176, 'PY', 'Paraguay'),
	(177, 'PE', 'Peru'),
	(178, 'PH', 'Philippines'),
	(179, 'PN', 'Pitcairn Islands'),
	(180, 'PL', 'Poland'),
	(181, 'PT', 'Portugal'),
	(182, 'PR', 'Puerto Rico'),
	(183, 'QA', 'Qatar'),
	(184, 'RE', 'Réunion'),
	(185, 'RO', 'Romania'),
	(186, 'RU', 'Russia'),
	(187, 'RW', 'Rwanda'),
	(188, 'WS', 'Samoa'),
	(189, 'SM', 'San Marino'),
	(190, 'ST', 'São Tomé & Príncipe'),
	(191, 'SA', 'Saudi Arabia'),
	(192, 'SN', 'Senegal'),
	(193, 'RS', 'Serbia'),
	(194, 'SC', 'Seychelles'),
	(195, 'SL', 'Sierra Leone'),
	(196, 'SG', 'Singapore'),
	(197, 'SX', 'Sint Maarten'),
	(198, 'SK', 'Slovakia'),
	(199, 'SI', 'Slovenia'),
	(200, 'SB', 'Solomon Islands'),
	(201, 'SO', 'Somalia'),
	(202, 'ZA', 'South Africa'),
	(203, 'GS', 'South Georgia & South Sandwich Islands'),
	(204, 'KR', 'South Korea'),
	(205, 'SS', 'South Sudan'),
	(206, 'ES', 'Spain'),
	(207, 'LK', 'Sri Lanka'),
	(208, 'BL', 'St. Barthélemy'),
	(209, 'SH', 'St. Helena'),
	(210, 'KN', 'St. Kitts & Nevis'),
	(211, 'LC', 'St. Lucia'),
	(212, 'MF', 'St. Martin'),
	(213, 'PM', 'St. Pierre & Miquelon'),
	(214, 'VC', 'St. Vincent & Grenadines'),
	(215, 'SD', 'Sudan'),
	(216, 'SR', 'Suriname'),
	(217, 'SJ', 'Svalbard & Jan Mayen'),
	(218, 'SZ', 'Swaziland'),
	(219, 'SE', 'Sweden'),
	(220, 'CH', 'Switzerland'),
	(221, 'SY', 'Syria'),
	(222, 'TW', 'Taiwan'),
	(223, 'TJ', 'Tajikistan'),
	(224, 'TZ', 'Tanzania'),
	(225, 'TH', 'Thailand'),
	(226, 'TL', 'Timor-Leste'),
	(227, 'TG', 'Togo'),
	(228, 'TK', 'Tokelau'),
	(229, 'TO', 'Tonga'),
	(230, 'TT', 'Trinidad & Tobago'),
	(231, 'TA', 'Tristan da Cunha'),
	(232, 'TN', 'Tunisia'),
	(233, 'TR', 'Turkey'),
	(234, 'TM', 'Turkmenistan'),
	(235, 'TC', 'Turks & Caicos Islands'),
	(236, 'TV', 'Tuvalu'),
	(237, 'UM', 'U.S. Outlying Islands'),
	(238, 'VI', 'U.S. Virgin Islands'),
	(239, 'UG', 'Uganda'),
	(240, 'UA', 'Ukraine'),
	(241, 'AE', 'United Arab Emirates'),
	(242, 'GB', 'United Kingdom'),
	(244, 'US', 'United States'),
	(245, 'UY', 'Uruguay'),
	(246, 'UZ', 'Uzbekistan'),
	(247, 'VU', 'Vanuatu'),
	(248, 'VA', 'Vatican City'),
	(249, 'VE', 'Venezuela'),
	(250, 'VN', 'Vietnam'),
	(251, 'WF', 'Wallis & Futuna'),
	(252, 'EH', 'Western Sahara'),
	(253, 'YE', 'Yemen'),
	(254, 'ZM', 'Zambia'),
	(255, 'ZW', 'Zimbabwe');

-- Volcando estructura para tabla ecommerce.country_states
CREATE TABLE IF NOT EXISTS `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.country_states: ~586 rows (aproximadamente)
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
	(1, 244, 'US', 'AL', 'Alabama'),
	(2, 244, 'US', 'AK', 'Alaska'),
	(3, 244, 'US', 'AS', 'American Samoa'),
	(4, 244, 'US', 'AZ', 'Arizona'),
	(5, 244, 'US', 'AR', 'Arkansas'),
	(6, 244, 'US', 'AE', 'Armed Forces Africa'),
	(7, 244, 'US', 'AA', 'Armed Forces Americas'),
	(8, 244, 'US', 'AE', 'Armed Forces Canada'),
	(9, 244, 'US', 'AE', 'Armed Forces Europe'),
	(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
	(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
	(12, 244, 'US', 'CA', 'California'),
	(13, 244, 'US', 'CO', 'Colorado'),
	(14, 244, 'US', 'CT', 'Connecticut'),
	(15, 244, 'US', 'DE', 'Delaware'),
	(16, 244, 'US', 'DC', 'District of Columbia'),
	(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
	(18, 244, 'US', 'FL', 'Florida'),
	(19, 244, 'US', 'GA', 'Georgia'),
	(20, 244, 'US', 'GU', 'Guam'),
	(21, 244, 'US', 'HI', 'Hawaii'),
	(22, 244, 'US', 'ID', 'Idaho'),
	(23, 244, 'US', 'IL', 'Illinois'),
	(24, 244, 'US', 'IN', 'Indiana'),
	(25, 244, 'US', 'IA', 'Iowa'),
	(26, 244, 'US', 'KS', 'Kansas'),
	(27, 244, 'US', 'KY', 'Kentucky'),
	(28, 244, 'US', 'LA', 'Louisiana'),
	(29, 244, 'US', 'ME', 'Maine'),
	(30, 244, 'US', 'MH', 'Marshall Islands'),
	(31, 244, 'US', 'MD', 'Maryland'),
	(32, 244, 'US', 'MA', 'Massachusetts'),
	(33, 244, 'US', 'MI', 'Michigan'),
	(34, 244, 'US', 'MN', 'Minnesota'),
	(35, 244, 'US', 'MS', 'Mississippi'),
	(36, 244, 'US', 'MO', 'Missouri'),
	(37, 244, 'US', 'MT', 'Montana'),
	(38, 244, 'US', 'NE', 'Nebraska'),
	(39, 244, 'US', 'NV', 'Nevada'),
	(40, 244, 'US', 'NH', 'New Hampshire'),
	(41, 244, 'US', 'NJ', 'New Jersey'),
	(42, 244, 'US', 'NM', 'New Mexico'),
	(43, 244, 'US', 'NY', 'New York'),
	(44, 244, 'US', 'NC', 'North Carolina'),
	(45, 244, 'US', 'ND', 'North Dakota'),
	(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
	(47, 244, 'US', 'OH', 'Ohio'),
	(48, 244, 'US', 'OK', 'Oklahoma'),
	(49, 244, 'US', 'OR', 'Oregon'),
	(50, 244, 'US', 'PW', 'Palau'),
	(51, 244, 'US', 'PA', 'Pennsylvania'),
	(52, 244, 'US', 'PR', 'Puerto Rico'),
	(53, 244, 'US', 'RI', 'Rhode Island'),
	(54, 244, 'US', 'SC', 'South Carolina'),
	(55, 244, 'US', 'SD', 'South Dakota'),
	(56, 244, 'US', 'TN', 'Tennessee'),
	(57, 244, 'US', 'TX', 'Texas'),
	(58, 244, 'US', 'UT', 'Utah'),
	(59, 244, 'US', 'VT', 'Vermont'),
	(60, 244, 'US', 'VI', 'Virgin Islands'),
	(61, 244, 'US', 'VA', 'Virginia'),
	(62, 244, 'US', 'WA', 'Washington'),
	(63, 244, 'US', 'WV', 'West Virginia'),
	(64, 244, 'US', 'WI', 'Wisconsin'),
	(65, 244, 'US', 'WY', 'Wyoming'),
	(66, 40, 'CA', 'AB', 'Alberta'),
	(67, 40, 'CA', 'BC', 'British Columbia'),
	(68, 40, 'CA', 'MB', 'Manitoba'),
	(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
	(70, 40, 'CA', 'NB', 'New Brunswick'),
	(71, 40, 'CA', 'NS', 'Nova Scotia'),
	(72, 40, 'CA', 'NT', 'Northwest Territories'),
	(73, 40, 'CA', 'NU', 'Nunavut'),
	(74, 40, 'CA', 'ON', 'Ontario'),
	(75, 40, 'CA', 'PE', 'Prince Edward Island'),
	(76, 40, 'CA', 'QC', 'Quebec'),
	(77, 40, 'CA', 'SK', 'Saskatchewan'),
	(78, 40, 'CA', 'YT', 'Yukon Territory'),
	(79, 88, 'DE', 'NDS', 'Niedersachsen'),
	(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
	(81, 88, 'DE', 'BAY', 'Bayern'),
	(82, 88, 'DE', 'BER', 'Berlin'),
	(83, 88, 'DE', 'BRG', 'Brandenburg'),
	(84, 88, 'DE', 'BRE', 'Bremen'),
	(85, 88, 'DE', 'HAM', 'Hamburg'),
	(86, 88, 'DE', 'HES', 'Hessen'),
	(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
	(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
	(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
	(90, 88, 'DE', 'SAR', 'Saarland'),
	(91, 88, 'DE', 'SAS', 'Sachsen'),
	(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
	(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
	(94, 88, 'DE', 'THE', 'Thüringen'),
	(95, 16, 'AT', 'WI', 'Wien'),
	(96, 16, 'AT', 'NO', 'Niederösterreich'),
	(97, 16, 'AT', 'OO', 'Oberösterreich'),
	(98, 16, 'AT', 'SB', 'Salzburg'),
	(99, 16, 'AT', 'KN', 'Kärnten'),
	(100, 16, 'AT', 'ST', 'Steiermark'),
	(101, 16, 'AT', 'TI', 'Tirol'),
	(102, 16, 'AT', 'BL', 'Burgenland'),
	(103, 16, 'AT', 'VB', 'Vorarlberg'),
	(104, 220, 'CH', 'AG', 'Aargau'),
	(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
	(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
	(107, 220, 'CH', 'BE', 'Bern'),
	(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
	(109, 220, 'CH', 'BS', 'Basel-Stadt'),
	(110, 220, 'CH', 'FR', 'Freiburg'),
	(111, 220, 'CH', 'GE', 'Genf'),
	(112, 220, 'CH', 'GL', 'Glarus'),
	(113, 220, 'CH', 'GR', 'Graubünden'),
	(114, 220, 'CH', 'JU', 'Jura'),
	(115, 220, 'CH', 'LU', 'Luzern'),
	(116, 220, 'CH', 'NE', 'Neuenburg'),
	(117, 220, 'CH', 'NW', 'Nidwalden'),
	(118, 220, 'CH', 'OW', 'Obwalden'),
	(119, 220, 'CH', 'SG', 'St. Gallen'),
	(120, 220, 'CH', 'SH', 'Schaffhausen'),
	(121, 220, 'CH', 'SO', 'Solothurn'),
	(122, 220, 'CH', 'SZ', 'Schwyz'),
	(123, 220, 'CH', 'TG', 'Thurgau'),
	(124, 220, 'CH', 'TI', 'Tessin'),
	(125, 220, 'CH', 'UR', 'Uri'),
	(126, 220, 'CH', 'VD', 'Waadt'),
	(127, 220, 'CH', 'VS', 'Wallis'),
	(128, 220, 'CH', 'ZG', 'Zug'),
	(129, 220, 'CH', 'ZH', 'Zürich'),
	(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
	(131, 206, 'ES', 'Alava', 'Alava'),
	(132, 206, 'ES', 'Albacete', 'Albacete'),
	(133, 206, 'ES', 'Alicante', 'Alicante'),
	(134, 206, 'ES', 'Almeria', 'Almeria'),
	(135, 206, 'ES', 'Asturias', 'Asturias'),
	(136, 206, 'ES', 'Avila', 'Avila'),
	(137, 206, 'ES', 'Badajoz', 'Badajoz'),
	(138, 206, 'ES', 'Baleares', 'Baleares'),
	(139, 206, 'ES', 'Barcelona', 'Barcelona'),
	(140, 206, 'ES', 'Burgos', 'Burgos'),
	(141, 206, 'ES', 'Caceres', 'Caceres'),
	(142, 206, 'ES', 'Cadiz', 'Cadiz'),
	(143, 206, 'ES', 'Cantabria', 'Cantabria'),
	(144, 206, 'ES', 'Castellon', 'Castellon'),
	(145, 206, 'ES', 'Ceuta', 'Ceuta'),
	(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
	(147, 206, 'ES', 'Cordoba', 'Cordoba'),
	(148, 206, 'ES', 'Cuenca', 'Cuenca'),
	(149, 206, 'ES', 'Girona', 'Girona'),
	(150, 206, 'ES', 'Granada', 'Granada'),
	(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
	(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
	(153, 206, 'ES', 'Huelva', 'Huelva'),
	(154, 206, 'ES', 'Huesca', 'Huesca'),
	(155, 206, 'ES', 'Jaen', 'Jaen'),
	(156, 206, 'ES', 'La Rioja', 'La Rioja'),
	(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
	(158, 206, 'ES', 'Leon', 'Leon'),
	(159, 206, 'ES', 'Lleida', 'Lleida'),
	(160, 206, 'ES', 'Lugo', 'Lugo'),
	(161, 206, 'ES', 'Madrid', 'Madrid'),
	(162, 206, 'ES', 'Malaga', 'Malaga'),
	(163, 206, 'ES', 'Melilla', 'Melilla'),
	(164, 206, 'ES', 'Murcia', 'Murcia'),
	(165, 206, 'ES', 'Navarra', 'Navarra'),
	(166, 206, 'ES', 'Ourense', 'Ourense'),
	(167, 206, 'ES', 'Palencia', 'Palencia'),
	(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
	(169, 206, 'ES', 'Salamanca', 'Salamanca'),
	(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
	(171, 206, 'ES', 'Segovia', 'Segovia'),
	(172, 206, 'ES', 'Sevilla', 'Sevilla'),
	(173, 206, 'ES', 'Soria', 'Soria'),
	(174, 206, 'ES', 'Tarragona', 'Tarragona'),
	(175, 206, 'ES', 'Teruel', 'Teruel'),
	(176, 206, 'ES', 'Toledo', 'Toledo'),
	(177, 206, 'ES', 'Valencia', 'Valencia'),
	(178, 206, 'ES', 'Valladolid', 'Valladolid'),
	(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
	(180, 206, 'ES', 'Zamora', 'Zamora'),
	(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
	(182, 81, 'FR', '1', 'Ain'),
	(183, 81, 'FR', '2', 'Aisne'),
	(184, 81, 'FR', '3', 'Allier'),
	(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
	(186, 81, 'FR', '5', 'Hautes-Alpes'),
	(187, 81, 'FR', '6', 'Alpes-Maritimes'),
	(188, 81, 'FR', '7', 'Ardèche'),
	(189, 81, 'FR', '8', 'Ardennes'),
	(190, 81, 'FR', '9', 'Ariège'),
	(191, 81, 'FR', '10', 'Aube'),
	(192, 81, 'FR', '11', 'Aude'),
	(193, 81, 'FR', '12', 'Aveyron'),
	(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
	(195, 81, 'FR', '14', 'Calvados'),
	(196, 81, 'FR', '15', 'Cantal'),
	(197, 81, 'FR', '16', 'Charente'),
	(198, 81, 'FR', '17', 'Charente-Maritime'),
	(199, 81, 'FR', '18', 'Cher'),
	(200, 81, 'FR', '19', 'Corrèze'),
	(201, 81, 'FR', '2A', 'Corse-du-Sud'),
	(202, 81, 'FR', '2B', 'Haute-Corse'),
	(203, 81, 'FR', '21', 'Côte-d\'Or'),
	(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
	(205, 81, 'FR', '23', 'Creuse'),
	(206, 81, 'FR', '24', 'Dordogne'),
	(207, 81, 'FR', '25', 'Doubs'),
	(208, 81, 'FR', '26', 'Drôme'),
	(209, 81, 'FR', '27', 'Eure'),
	(210, 81, 'FR', '28', 'Eure-et-Loir'),
	(211, 81, 'FR', '29', 'Finistère'),
	(212, 81, 'FR', '30', 'Gard'),
	(213, 81, 'FR', '31', 'Haute-Garonne'),
	(214, 81, 'FR', '32', 'Gers'),
	(215, 81, 'FR', '33', 'Gironde'),
	(216, 81, 'FR', '34', 'Hérault'),
	(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
	(218, 81, 'FR', '36', 'Indre'),
	(219, 81, 'FR', '37', 'Indre-et-Loire'),
	(220, 81, 'FR', '38', 'Isère'),
	(221, 81, 'FR', '39', 'Jura'),
	(222, 81, 'FR', '40', 'Landes'),
	(223, 81, 'FR', '41', 'Loir-et-Cher'),
	(224, 81, 'FR', '42', 'Loire'),
	(225, 81, 'FR', '43', 'Haute-Loire'),
	(226, 81, 'FR', '44', 'Loire-Atlantique'),
	(227, 81, 'FR', '45', 'Loiret'),
	(228, 81, 'FR', '46', 'Lot'),
	(229, 81, 'FR', '47', 'Lot-et-Garonne'),
	(230, 81, 'FR', '48', 'Lozère'),
	(231, 81, 'FR', '49', 'Maine-et-Loire'),
	(232, 81, 'FR', '50', 'Manche'),
	(233, 81, 'FR', '51', 'Marne'),
	(234, 81, 'FR', '52', 'Haute-Marne'),
	(235, 81, 'FR', '53', 'Mayenne'),
	(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
	(237, 81, 'FR', '55', 'Meuse'),
	(238, 81, 'FR', '56', 'Morbihan'),
	(239, 81, 'FR', '57', 'Moselle'),
	(240, 81, 'FR', '58', 'Nièvre'),
	(241, 81, 'FR', '59', 'Nord'),
	(242, 81, 'FR', '60', 'Oise'),
	(243, 81, 'FR', '61', 'Orne'),
	(244, 81, 'FR', '62', 'Pas-de-Calais'),
	(245, 81, 'FR', '63', 'Puy-de-Dôme'),
	(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
	(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
	(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
	(249, 81, 'FR', '67', 'Bas-Rhin'),
	(250, 81, 'FR', '68', 'Haut-Rhin'),
	(251, 81, 'FR', '69', 'Rhône'),
	(252, 81, 'FR', '70', 'Haute-Saône'),
	(253, 81, 'FR', '71', 'Saône-et-Loire'),
	(254, 81, 'FR', '72', 'Sarthe'),
	(255, 81, 'FR', '73', 'Savoie'),
	(256, 81, 'FR', '74', 'Haute-Savoie'),
	(257, 81, 'FR', '75', 'Paris'),
	(258, 81, 'FR', '76', 'Seine-Maritime'),
	(259, 81, 'FR', '77', 'Seine-et-Marne'),
	(260, 81, 'FR', '78', 'Yvelines'),
	(261, 81, 'FR', '79', 'Deux-Sèvres'),
	(262, 81, 'FR', '80', 'Somme'),
	(263, 81, 'FR', '81', 'Tarn'),
	(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
	(265, 81, 'FR', '83', 'Var'),
	(266, 81, 'FR', '84', 'Vaucluse'),
	(267, 81, 'FR', '85', 'Vendée'),
	(268, 81, 'FR', '86', 'Vienne'),
	(269, 81, 'FR', '87', 'Haute-Vienne'),
	(270, 81, 'FR', '88', 'Vosges'),
	(271, 81, 'FR', '89', 'Yonne'),
	(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
	(273, 81, 'FR', '91', 'Essonne'),
	(274, 81, 'FR', '92', 'Hauts-de-Seine'),
	(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
	(276, 81, 'FR', '94', 'Val-de-Marne'),
	(277, 81, 'FR', '95', 'Val-d\'Oise'),
	(278, 185, 'RO', 'AB', 'Alba'),
	(279, 185, 'RO', 'AR', 'Arad'),
	(280, 185, 'RO', 'AG', 'Argeş'),
	(281, 185, 'RO', 'BC', 'Bacău'),
	(282, 185, 'RO', 'BH', 'Bihor'),
	(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
	(284, 185, 'RO', 'BT', 'Botoşani'),
	(285, 185, 'RO', 'BV', 'Braşov'),
	(286, 185, 'RO', 'BR', 'Brăila'),
	(287, 185, 'RO', 'B', 'Bucureşti'),
	(288, 185, 'RO', 'BZ', 'Buzău'),
	(289, 185, 'RO', 'CS', 'Caraş-Severin'),
	(290, 185, 'RO', 'CL', 'Călăraşi'),
	(291, 185, 'RO', 'CJ', 'Cluj'),
	(292, 185, 'RO', 'CT', 'Constanţa'),
	(293, 185, 'RO', 'CV', 'Covasna'),
	(294, 185, 'RO', 'DB', 'Dâmboviţa'),
	(295, 185, 'RO', 'DJ', 'Dolj'),
	(296, 185, 'RO', 'GL', 'Galaţi'),
	(297, 185, 'RO', 'GR', 'Giurgiu'),
	(298, 185, 'RO', 'GJ', 'Gorj'),
	(299, 185, 'RO', 'HR', 'Harghita'),
	(300, 185, 'RO', 'HD', 'Hunedoara'),
	(301, 185, 'RO', 'IL', 'Ialomiţa'),
	(302, 185, 'RO', 'IS', 'Iaşi'),
	(303, 185, 'RO', 'IF', 'Ilfov'),
	(304, 185, 'RO', 'MM', 'Maramureş'),
	(305, 185, 'RO', 'MH', 'Mehedinţi'),
	(306, 185, 'RO', 'MS', 'Mureş'),
	(307, 185, 'RO', 'NT', 'Neamţ'),
	(308, 185, 'RO', 'OT', 'Olt'),
	(309, 185, 'RO', 'PH', 'Prahova'),
	(310, 185, 'RO', 'SM', 'Satu-Mare'),
	(311, 185, 'RO', 'SJ', 'Sălaj'),
	(312, 185, 'RO', 'SB', 'Sibiu'),
	(313, 185, 'RO', 'SV', 'Suceava'),
	(314, 185, 'RO', 'TR', 'Teleorman'),
	(315, 185, 'RO', 'TM', 'Timiş'),
	(316, 185, 'RO', 'TL', 'Tulcea'),
	(317, 185, 'RO', 'VS', 'Vaslui'),
	(318, 185, 'RO', 'VL', 'Vâlcea'),
	(319, 185, 'RO', 'VN', 'Vrancea'),
	(320, 80, 'FI', 'Lappi', 'Lappi'),
	(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
	(322, 80, 'FI', 'Kainuu', 'Kainuu'),
	(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
	(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
	(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
	(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
	(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
	(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
	(329, 80, 'FI', 'Satakunta', 'Satakunta'),
	(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
	(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
	(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
	(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
	(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
	(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
	(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
	(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
	(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
	(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
	(340, 74, 'EE', 'EE-37', 'Harjumaa'),
	(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
	(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
	(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
	(344, 74, 'EE', 'EE-51', 'Järvamaa'),
	(345, 74, 'EE', 'EE-57', 'Läänemaa'),
	(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
	(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
	(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
	(349, 74, 'EE', 'EE-70', 'Raplamaa'),
	(350, 74, 'EE', 'EE-74', 'Saaremaa'),
	(351, 74, 'EE', 'EE-78', 'Tartumaa'),
	(352, 74, 'EE', 'EE-82', 'Valgamaa'),
	(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
	(354, 74, 'EE', 'EE-86', 'Võrumaa'),
	(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
	(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
	(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
	(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
	(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
	(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
	(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
	(362, 125, 'LV', 'LV-RIX', 'Rīga'),
	(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
	(364, 125, 'LV', 'Valmiera', 'Valmiera'),
	(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
	(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
	(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
	(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
	(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
	(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
	(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
	(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
	(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
	(374, 125, 'LV', 'Apes novads', 'Apes novads'),
	(375, 125, 'LV', 'Auces novads', 'Auces novads'),
	(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
	(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
	(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
	(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
	(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
	(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
	(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
	(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
	(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
	(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
	(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
	(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
	(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
	(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
	(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
	(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
	(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
	(393, 125, 'LV', 'Engures novads', 'Engures novads'),
	(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
	(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
	(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
	(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
	(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
	(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
	(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
	(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
	(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
	(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
	(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
	(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
	(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
	(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
	(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
	(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
	(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
	(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
	(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
	(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
	(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
	(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
	(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
	(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
	(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
	(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
	(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
	(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
	(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
	(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
	(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
	(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
	(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
	(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
	(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
	(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
	(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
	(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
	(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
	(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
	(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
	(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
	(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
	(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
	(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
	(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
	(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
	(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
	(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
	(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
	(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
	(445, 125, 'LV', 'Salas novads', 'Salas novads'),
	(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
	(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
	(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
	(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
	(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
	(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
	(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
	(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
	(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
	(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
	(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
	(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
	(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
	(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
	(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
	(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
	(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
	(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
	(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
	(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
	(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
	(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
	(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
	(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
	(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
	(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
	(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
	(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
	(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
	(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
	(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
	(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
	(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
	(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
	(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
	(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
	(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
	(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
	(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
	(485, 31, 'BR', 'AC', 'Acre'),
	(486, 31, 'BR', 'AL', 'Alagoas'),
	(487, 31, 'BR', 'AP', 'Amapá'),
	(488, 31, 'BR', 'AM', 'Amazonas'),
	(489, 31, 'BR', 'BA', 'Bahia'),
	(490, 31, 'BR', 'CE', 'Ceará'),
	(491, 31, 'BR', 'ES', 'Espírito Santo'),
	(492, 31, 'BR', 'GO', 'Goiás'),
	(493, 31, 'BR', 'MA', 'Maranhão'),
	(494, 31, 'BR', 'MT', 'Mato Grosso'),
	(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
	(496, 31, 'BR', 'MG', 'Minas Gerais'),
	(497, 31, 'BR', 'PA', 'Pará'),
	(498, 31, 'BR', 'PB', 'Paraíba'),
	(499, 31, 'BR', 'PR', 'Paraná'),
	(500, 31, 'BR', 'PE', 'Pernambuco'),
	(501, 31, 'BR', 'PI', 'Piauí'),
	(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
	(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
	(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
	(505, 31, 'BR', 'RO', 'Rondônia'),
	(506, 31, 'BR', 'RR', 'Roraima'),
	(507, 31, 'BR', 'SC', 'Santa Catarina'),
	(508, 31, 'BR', 'SP', 'São Paulo'),
	(509, 31, 'BR', 'SE', 'Sergipe'),
	(510, 31, 'BR', 'TO', 'Tocantins'),
	(511, 31, 'BR', 'DF', 'Distrito Federal'),
	(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
	(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
	(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
	(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
	(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
	(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
	(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
	(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
	(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
	(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
	(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
	(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
	(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
	(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
	(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
	(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
	(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
	(529, 59, 'HR', 'HR-18', 'Istarska županija'),
	(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
	(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
	(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
	(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
	(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
	(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
	(536, 106, 'IN', 'AS', 'Assam'),
	(537, 106, 'IN', 'BR', 'Bihar'),
	(538, 106, 'IN', 'CH', 'Chandigarh'),
	(539, 106, 'IN', 'CT', 'Chhattisgarh'),
	(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
	(541, 106, 'IN', 'DD', 'Daman and Diu'),
	(542, 106, 'IN', 'DL', 'Delhi'),
	(543, 106, 'IN', 'GA', 'Goa'),
	(544, 106, 'IN', 'GJ', 'Gujarat'),
	(545, 106, 'IN', 'HR', 'Haryana'),
	(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
	(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
	(548, 106, 'IN', 'JH', 'Jharkhand'),
	(549, 106, 'IN', 'KA', 'Karnataka'),
	(550, 106, 'IN', 'KL', 'Kerala'),
	(551, 106, 'IN', 'LD', 'Lakshadweep'),
	(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
	(553, 106, 'IN', 'MH', 'Maharashtra'),
	(554, 106, 'IN', 'MN', 'Manipur'),
	(555, 106, 'IN', 'ML', 'Meghalaya'),
	(556, 106, 'IN', 'MZ', 'Mizoram'),
	(557, 106, 'IN', 'NL', 'Nagaland'),
	(558, 106, 'IN', 'OR', 'Odisha'),
	(559, 106, 'IN', 'PY', 'Puducherry'),
	(560, 106, 'IN', 'PB', 'Punjab'),
	(561, 106, 'IN', 'RJ', 'Rajasthan'),
	(562, 106, 'IN', 'SK', 'Sikkim'),
	(563, 106, 'IN', 'TN', 'Tamil Nadu'),
	(564, 106, 'IN', 'TG', 'Telangana'),
	(565, 106, 'IN', 'TR', 'Tripura'),
	(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
	(567, 106, 'IN', 'UT', 'Uttarakhand'),
	(568, 106, 'IN', 'WB', 'West Bengal'),
	(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
	(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
	(571, 176, 'PY', 'PY-13', 'Amambay'),
	(572, 176, 'PY', 'PY-ASU', 'Asunción'),
	(573, 176, 'PY', 'PY-19', 'Boquerón'),
	(574, 176, 'PY', 'PY-5', 'Caaguazú'),
	(575, 176, 'PY', 'PY-6', 'Caazapá'),
	(576, 176, 'PY', 'PY-14', 'Canindeyú'),
	(577, 176, 'PY', 'PY-11', 'Central'),
	(578, 176, 'PY', 'PY-1', 'Concepción'),
	(579, 176, 'PY', 'PY-3', 'Cordillera'),
	(580, 176, 'PY', 'PY-4', 'Guairá'),
	(581, 176, 'PY', 'PY-7', 'Itapúa'),
	(582, 176, 'PY', 'PY-8', 'Misiones'),
	(583, 176, 'PY', 'PY-9', 'Paraguarí'),
	(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
	(585, 176, 'PY', 'PY-2', 'San Pedro'),
	(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- Volcando estructura para tabla ecommerce.country_state_translations
CREATE TABLE IF NOT EXISTS `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.country_state_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.country_translations
CREATE TABLE IF NOT EXISTS `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.country_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int unsigned NOT NULL DEFAULT '2',
  `group_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.currencies: ~0 rows (aproximadamente)
INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `group_separator`, `decimal_separator`, `currency_position`, `created_at`, `updated_at`) VALUES
	(1, 'MXN', 'Peso Mexicano', '$', 2, ',', '.', NULL, NULL, NULL);

-- Volcando estructura para tabla ecommerce.currency_exchange_rates
CREATE TABLE IF NOT EXISTS `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.currency_exchange_rates: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.customers: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.customer_groups
CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.customer_groups: ~3 rows (aproximadamente)
INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
	(1, 'guest', 'Invitado', 0, NULL, NULL),
	(2, 'general', 'General', 0, NULL, NULL),
	(3, 'wholesale', 'Mayorista', 0, NULL, NULL);

-- Volcando estructura para tabla ecommerce.customer_notes
CREATE TABLE IF NOT EXISTS `customer_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.customer_notes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.customer_password_resets
CREATE TABLE IF NOT EXISTS `customer_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.customer_password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.customer_social_accounts
CREATE TABLE IF NOT EXISTS `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.customer_social_accounts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.datagrid_saved_filters
CREATE TABLE IF NOT EXISTS `datagrid_saved_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.datagrid_saved_filters: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.downloadable_link_purchased
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.downloadable_link_purchased: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.gdpr_data_request
CREATE TABLE IF NOT EXISTS `gdpr_data_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gdpr_data_request_customer_id_foreign` (`customer_id`),
  CONSTRAINT `gdpr_data_request_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.gdpr_data_request: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.imports
CREATE TABLE IF NOT EXISTS `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.imports: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.import_batches
CREATE TABLE IF NOT EXISTS `import_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.import_batches: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.inventory_sources
CREATE TABLE IF NOT EXISTS `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.inventory_sources: ~0 rows (aproximadamente)
INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'default', 'Predeterminado', NULL, 'Predeterminado', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- Volcando estructura para tabla ecommerce.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.invoices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.invoice_items
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.invoice_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.job_batches: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.locales
CREATE TABLE IF NOT EXISTS `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.locales: ~0 rows (aproximadamente)
INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
	(1, 'es', 'Español', 'ltr', 'locales/Udr8wjeVGSgJO3ixIsuHwkWR1Bw0zTewLUSmkfMb.png', NULL, NULL);

-- Volcando estructura para tabla ecommerce.marketing_campaigns
CREATE TABLE IF NOT EXISTS `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.marketing_campaigns: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.marketing_events
CREATE TABLE IF NOT EXISTS `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.marketing_events: ~0 rows (aproximadamente)
INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
	(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- Volcando estructura para tabla ecommerce.marketing_templates
CREATE TABLE IF NOT EXISTS `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.marketing_templates: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.migrations: ~120 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2018_06_12_111907_create_admins_table', 1),
	(5, '2018_06_13_055341_create_roles_table', 1),
	(6, '2018_07_05_130148_create_attributes_table', 1),
	(7, '2018_07_05_132854_create_attribute_translations_table', 1),
	(8, '2018_07_05_135150_create_attribute_families_table', 1),
	(9, '2018_07_05_135152_create_attribute_groups_table', 1),
	(10, '2018_07_05_140832_create_attribute_options_table', 1),
	(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
	(12, '2018_07_05_142820_create_categories_table', 1),
	(13, '2018_07_10_055143_create_locales_table', 1),
	(14, '2018_07_20_054426_create_countries_table', 1),
	(15, '2018_07_20_054502_create_currencies_table', 1),
	(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
	(17, '2018_07_20_064849_create_channels_table', 1),
	(18, '2018_07_21_142836_create_category_translations_table', 1),
	(19, '2018_07_23_110040_create_inventory_sources_table', 1),
	(20, '2018_07_24_082635_create_customer_groups_table', 1),
	(21, '2018_07_24_082930_create_customers_table', 1),
	(22, '2018_07_27_065727_create_products_table', 1),
	(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
	(24, '2018_07_27_092623_create_product_reviews_table', 1),
	(25, '2018_07_27_113941_create_product_images_table', 1),
	(26, '2018_07_27_113956_create_product_inventories_table', 1),
	(27, '2018_08_30_064755_create_tax_categories_table', 1),
	(28, '2018_08_30_065042_create_tax_rates_table', 1),
	(29, '2018_08_30_065840_create_tax_mappings_table', 1),
	(30, '2018_09_05_150444_create_cart_table', 1),
	(31, '2018_09_05_150915_create_cart_items_table', 1),
	(32, '2018_09_11_064045_customer_password_resets', 1),
	(33, '2018_09_19_093453_create_cart_payment', 1),
	(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
	(35, '2018_09_20_060658_create_core_config_table', 1),
	(36, '2018_09_27_113154_create_orders_table', 1),
	(37, '2018_09_27_113207_create_order_items_table', 1),
	(38, '2018_09_27_115022_create_shipments_table', 1),
	(39, '2018_09_27_115029_create_shipment_items_table', 1),
	(40, '2018_09_27_115135_create_invoices_table', 1),
	(41, '2018_09_27_115144_create_invoice_items_table', 1),
	(42, '2018_10_01_095504_create_order_payment_table', 1),
	(43, '2018_10_03_025230_create_wishlist_table', 1),
	(44, '2018_10_12_101803_create_country_translations_table', 1),
	(45, '2018_10_12_101913_create_country_states_table', 1),
	(46, '2018_10_12_101923_create_country_state_translations_table', 1),
	(47, '2018_11_16_173504_create_subscribers_list_table', 1),
	(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
	(49, '2018_12_06_185202_create_product_flat_table', 1),
	(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
	(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
	(52, '2019_05_13_024321_create_cart_rules_table', 1),
	(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
	(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
	(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
	(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
	(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
	(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
	(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
	(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
	(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
	(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
	(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
	(64, '2019_07_02_180307_create_booking_products_table', 1),
	(65, '2019_07_05_154415_create_booking_product_default_slots_table', 1),
	(66, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1),
	(67, '2019_07_05_154440_create_booking_product_event_tickets_table', 1),
	(68, '2019_07_05_154451_create_booking_product_rental_slots_table', 1),
	(69, '2019_07_05_154502_create_booking_product_table_slots_table', 1),
	(70, '2019_07_30_153530_create_cms_pages_table', 1),
	(71, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
	(72, '2019_08_02_105320_create_product_grouped_products_table', 1),
	(73, '2019_08_20_170510_create_product_bundle_options_table', 1),
	(74, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
	(75, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
	(76, '2019_09_11_184511_create_refunds_table', 1),
	(77, '2019_09_11_184519_create_refund_items_table', 1),
	(78, '2019_12_03_184613_create_catalog_rules_table', 1),
	(79, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
	(80, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
	(81, '2019_12_06_101110_create_catalog_rule_products_table', 1),
	(82, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
	(83, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(84, '2020_01_14_191854_create_cms_page_translations_table', 1),
	(85, '2020_01_15_130209_create_cms_page_channels_table', 1),
	(86, '2020_02_18_165639_create_bookings_table', 1),
	(87, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1),
	(88, '2020_04_16_185147_add_table_addresses', 1),
	(89, '2020_05_06_171638_create_order_comments_table', 1),
	(90, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
	(91, '2020_06_25_162154_create_customer_social_accounts_table', 1),
	(92, '2020_08_07_174804_create_gdpr_data_request_table', 1),
	(93, '2020_11_19_112228_create_product_videos_table', 1),
	(94, '2020_11_26_141455_create_marketing_templates_table', 1),
	(95, '2020_11_26_150534_create_marketing_events_table', 1),
	(96, '2020_11_26_150644_create_marketing_campaigns_table', 1),
	(97, '2020_12_21_000200_create_channel_translations_table', 1),
	(98, '2020_12_27_121950_create_jobs_table', 1),
	(99, '2021_03_11_212124_create_order_transactions_table', 1),
	(100, '2021_04_07_132010_create_product_review_images_table', 1),
	(101, '2021_12_15_104544_notifications', 1),
	(102, '2022_03_15_160510_create_failed_jobs_table', 1),
	(103, '2022_04_01_094622_create_sitemaps_table', 1),
	(104, '2022_10_03_144232_create_product_price_indices_table', 1),
	(105, '2022_10_04_144444_create_job_batches_table', 1),
	(106, '2022_10_08_134150_create_product_inventory_indices_table', 1),
	(107, '2023_05_26_213105_create_wishlist_items_table', 1),
	(108, '2023_05_26_213120_create_compare_items_table', 1),
	(109, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
	(110, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
	(111, '2023_07_10_184256_create_theme_customizations_table', 1),
	(112, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
	(113, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
	(114, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
	(115, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
	(116, '2023_07_25_171058_create_customer_notes_table', 1),
	(117, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
	(118, '2023_09_15_170053_create_theme_customization_translations_table', 1),
	(119, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
	(120, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
	(121, '2023_09_26_155709_add_columns_to_currencies', 1),
	(122, '2023_10_05_163612_create_visits_table', 1),
	(123, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
	(124, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1),
	(125, '2023_11_08_140116_create_search_terms_table', 1),
	(126, '2023_11_09_162805_create_url_rewrites_table', 1),
	(127, '2023_11_17_150401_create_search_synonyms_table', 1),
	(128, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1),
	(129, '2024_01_11_154640_create_imports_table', 1),
	(130, '2024_01_11_154741_create_import_batches_table', 1),
	(131, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1),
	(132, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1),
	(133, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1),
	(134, '2024_02_26_153000_add_columns_to_addresses_table', 1),
	(135, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1),
	(136, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1),
	(137, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1),
	(138, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1),
	(139, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1),
	(140, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1),
	(141, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1),
	(142, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1),
	(143, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1),
	(144, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1),
	(145, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1),
	(146, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1),
	(147, '2024_05_10_152848_create_saved_filters_table', 1),
	(148, '2024_06_03_174128_create_product_channels_table', 1),
	(149, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1),
	(150, '2024_06_04_134403_add_channel_id_column_in_visits_table', 1),
	(151, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1),
	(152, '2024_07_17_172645_add_additional_column_to_sitemaps_table', 1),
	(153, '2024_10_11_135010_create_product_customizable_options_table', 1),
	(154, '2024_10_11_135110_create_product_customizable_option_translations_table', 1),
	(155, '2024_10_11_135228_create_product_customizable_option_prices_table', 1);

-- Volcando estructura para tabla ecommerce.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.notifications: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.orders: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.order_comments
CREATE TABLE IF NOT EXISTS `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.order_comments: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.order_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.order_payment
CREATE TABLE IF NOT EXISTS `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.order_payment: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.order_transactions
CREATE TABLE IF NOT EXISTS `order_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.order_transactions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.products: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_attribute_values
CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_attribute_values: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_bundle_options
CREATE TABLE IF NOT EXISTS `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_bundle_options: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_bundle_option_products
CREATE TABLE IF NOT EXISTS `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `product_bundle_option_id_foreign` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_bundle_option_products: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_bundle_option_translations
CREATE TABLE IF NOT EXISTS `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_bundle_option_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_categories
CREATE TABLE IF NOT EXISTS `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_categories: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_channels
CREATE TABLE IF NOT EXISTS `product_channels` (
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_channels: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_cross_sells
CREATE TABLE IF NOT EXISTS `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_cross_sells: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_customer_group_prices
CREATE TABLE IF NOT EXISTS `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_customer_group_prices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_customizable_options
CREATE TABLE IF NOT EXISTS `product_customizable_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `max_characters` text COLLATE utf8mb4_unicode_ci,
  `supported_file_extensions` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_customizable_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_customizable_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_customizable_options: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_customizable_option_prices
CREATE TABLE IF NOT EXISTS `product_customizable_option_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_customizable_option_id` int unsigned NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pcop_product_customizable_option_id_foreign` (`product_customizable_option_id`),
  CONSTRAINT `pcop_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_customizable_option_prices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_customizable_option_translations
CREATE TABLE IF NOT EXISTS `product_customizable_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_customizable_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customizable_option_id_locale_unique` (`product_customizable_option_id`,`locale`),
  CONSTRAINT `pcot_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_customizable_option_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_downloadable_links
CREATE TABLE IF NOT EXISTS `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_downloadable_links: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_downloadable_link_translations
CREATE TABLE IF NOT EXISTS `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_downloadable_link_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_downloadable_samples
CREATE TABLE IF NOT EXISTS `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_downloadable_samples: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_downloadable_sample_translations
CREATE TABLE IF NOT EXISTS `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_downloadable_sample_translations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_flat
CREATE TABLE IF NOT EXISTS `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_flat: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_grouped_products
CREATE TABLE IF NOT EXISTS `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_grouped_products: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_images: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_inventories
CREATE TABLE IF NOT EXISTS `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_inventories: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_inventory_indices
CREATE TABLE IF NOT EXISTS `product_inventory_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_inventory_indices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_ordered_inventories
CREATE TABLE IF NOT EXISTS `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_ordered_inventories: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_price_indices
CREATE TABLE IF NOT EXISTS `product_price_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_price_indices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_relations
CREATE TABLE IF NOT EXISTS `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_relations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_reviews
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_reviews: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_review_attachments
CREATE TABLE IF NOT EXISTS `product_review_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_review_attachments: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_super_attributes
CREATE TABLE IF NOT EXISTS `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_super_attributes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_up_sells
CREATE TABLE IF NOT EXISTS `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_up_sells: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.product_videos
CREATE TABLE IF NOT EXISTS `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.product_videos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.refunds
CREATE TABLE IF NOT EXISTS `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.refunds: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.refund_items
CREATE TABLE IF NOT EXISTS `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.refund_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.roles: ~1 rows (aproximadamente)
INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'Los usuarios con este rol tendrán acceso a todo', 'all', NULL, NULL, NULL);

-- Volcando estructura para tabla ecommerce.search_synonyms
CREATE TABLE IF NOT EXISTS `search_synonyms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.search_synonyms: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.search_terms
CREATE TABLE IF NOT EXISTS `search_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.search_terms: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.shipments
CREATE TABLE IF NOT EXISTS `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.shipments: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.shipment_items
CREATE TABLE IF NOT EXISTS `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.shipment_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.sitemaps
CREATE TABLE IF NOT EXISTS `sitemaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional` json DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.sitemaps: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.subscribers_list
CREATE TABLE IF NOT EXISTS `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.subscribers_list: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.tax_categories
CREATE TABLE IF NOT EXISTS `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.tax_categories: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.tax_categories_tax_rates
CREATE TABLE IF NOT EXISTS `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.tax_categories_tax_rates: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.tax_rates
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.tax_rates: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.theme_customizations
CREATE TABLE IF NOT EXISTS `theme_customizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.theme_customizations: ~12 rows (aproximadamente)
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'default', 'image_carousel', 'Carrusel de Imágenes', 1, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(2, 'default', 'static_content', 'Información de Oferta', 2, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(3, 'default', 'category_carousel', 'Colecciones de Categorías', 3, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(4, 'default', 'product_carousel', 'Nuevos Productos', 4, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(5, 'default', 'static_content', 'Mejores Colecciones', 5, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(6, 'default', 'static_content', 'Colecciones Audaces', 6, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(7, 'default', 'product_carousel', 'Colecciones Destacadas', 7, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(8, 'default', 'static_content', 'Contenedor de Juegos', 8, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(9, 'default', 'product_carousel', 'Todos los Productos', 9, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(10, 'default', 'static_content', 'Colecciones Audaces', 10, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(11, 'default', 'footer_links', 'Enlaces del Pie de Página', 11, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05'),
	(12, 'default', 'services_content', 'Contenido de Servicios', 12, 1, 1, '2025-04-04 13:13:05', '2025-04-04 13:13:05');

-- Volcando estructura para tabla ecommerce.theme_customization_translations
CREATE TABLE IF NOT EXISTS `theme_customization_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customization_id_foreign` (`theme_customization_id`),
  CONSTRAINT `theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.theme_customization_translations: ~12 rows (aproximadamente)
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES
	(1, 1, 'es', '{"images": [{"link": "", "image": "storage/theme/1/HmRq4p5L0MYLr1sOaP4rPdys74TjHlMtGWORLxyX.webp", "title": "Prepárate para la Nueva Colección"}, {"link": "", "image": "storage/theme/1/0XcuHPAPc75vSSKbqTD690RwtF8aRJpKA8YkjIDr.webp", "title": "Prepárate para la Nueva Colección"}, {"link": "", "image": "storage/theme/1/v0TyoFwROJchFyQktcdowsfdmbAIfzRQRpIJj6Gm.webp", "title": "Prepárate para la Nueva Colección"}, {"link": "", "image": "storage/theme/1/7XRepnUtv2dANi1PocdK3dqsNRYrUvbyWKFyw9TG.webp", "title": "Prepárate para la Nueva Colección"}]}'),
	(2, 2, 'es', '{"css": ".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}", "html": "<div class=\\"home-offer\\"><h1>¡Hasta un 40% DE DESCUENTO en tu primer pedido COMPRA AHORA!</h1></div>"}'),
	(3, 3, 'es', '{"filters": {"sort": "asc", "limit": 10, "parent_id": 1}}'),
	(4, 4, 'es', '{"title": "Nuevos Productos", "filters": {"new": 1, "sort": "name-asc", "limit": 12}}'),
	(5, 5, 'es', '{"css": ".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;transition: transform 300ms ease;transform: scale(1);}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 28px;font-size: 20px;line-height: 1.5;}.top-collection-grid {gap: 10px}}@media not all and (min-width: 768px) {.top-collection-header {margin-top: 30px;font-size: 28px;line-height: 3;}.top-collection-header h2 {line-height:2; margin-bottom:20px;} .top-collection-grid {gap: 14px}} @media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 768px) {.top-collection-grid { row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 0px;} .top-collection-card{width:48%} .top-collection-card img {width:100%;} .top-collection-card h3 {font-size:24px; bottom: 16px;}}@media (max-width:520px) { .top-collection-grid{padding-left: 15px;padding-right: 15px;} .top-collection-card h3 {font-size:18px; bottom: 10px;}}", "html": "<div class=\\"top-collection-container\\"><div class=\\"top-collection-header\\"><h2>¡El juego con nuestras nuevas adiciones!</h2></div><div class=\\"top-collection-grid container\\"><div class=\\"top-collection-card\\"><img src=\\"\\" data-src=\\"storage/theme/5/XCKpxkcXXgUOAKSRDKrsFqlJk8hLp24Ux6oc7ZvB.webp\\" class=\\"lazy\\" width=\\"396\\" height=\\"396\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"><h3>Nuestras Colecciones</h3></div><div class=\\"top-collection-card\\"><img src=\\"\\" data-src=\\"storage/theme/5/GvKFdj8pSY0bmsf7pkWOLzJKGkeedbkHdpt4Gs2x.webp\\" class=\\"lazy\\" width=\\"396\\" height=\\"396\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"><h3>Nuestras Colecciones</h3></div><div class=\\"top-collection-card\\"><img src=\\"\\" data-src=\\"storage/theme/5/CQe3Wwz7m8nxWTp4gJ3rYYrJwjX2kIfF31gJsTvU.webp\\" class=\\"lazy\\" width=\\"396\\" height=\\"396\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"><h3>Nuestras Colecciones</h3></div><div class=\\"top-collection-card\\"><img src=\\"\\" data-src=\\"storage/theme/5/Orpsr0GwhFubYwP34A8ucqmfQy2ui0z4nOXTccUS.webp\\" class=\\"lazy\\" width=\\"396\\" height=\\"396\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"><h3>Nuestras Colecciones</h3></div><div class=\\"top-collection-card\\"><img src=\\"\\" data-src=\\"storage/theme/5/LPYccDqlHp2w5uLwXfZX6nPJomBRVn6fPgprZmIb.webp\\" class=\\"lazy\\" width=\\"396\\" height=\\"396\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"><h3>Nuestras Colecciones</h3></div><div class=\\"top-collection-card\\"><img src=\\"\\" data-src=\\"storage/theme/5/oZVa8IzRccEgUZ6lyzLqGygL5DJJiBgu0uhxYIqr.webp\\" class=\\"lazy\\" width=\\"396\\" height=\\"396\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"><h3>Nuestras Colecciones</h3></div></div></div>"}'),
	(6, 6, 'es', '{"css": ".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}", "html": "<div class=\\"section-gap bold-collections container\\"> <div class=\\"inline-col-wrapper\\"> <div class=\\"inline-col-image-wrapper\\"> <img src=\\"\\" data-src=\\"storage/theme/6/wP26XYzvqCZCVrc18eaCDPNq9IRlsCyMCFgixmMq.webp\\" class=\\"lazy\\" width=\\"632\\" height=\\"510\\" alt=\\"¡Prepárate para nuestras nuevas Colecciones Audaces!\\"> </div> <div class=\\"inline-col-content-wrapper\\"> <h2 class=\\"inline-col-title\\"> ¡Prepárate para nuestras nuevas Colecciones Audaces! </h2> <p class=\\"inline-col-description\\">¡Presentamos Nuestras Nuevas Colecciones Audaces! Eleva tu estilo con diseños atrevidos y declaraciones vibrantes. Explora patrones llamativos y colores audaces que redefinen tu armario. ¡Prepárate para abrazar lo extraordinario!</p> <button class=\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\">Ver Colecciones</button> </div> </div> </div>"}'),
	(7, 7, 'es', '{"title": "Productos Destacados", "filters": {"sort": "name-desc", "limit": 12, "featured": 1}}'),
	(8, 8, 'es', '{"css": ".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}", "html": "<div class=\\"section-game\\"><div class=\\"section-title\\"> <h2>¡El juego con nuestras nuevas adiciones!</h2> </div> <div class=\\"section-gap container\\"> <div class=\\"collection-card-wrapper\\"> <div class=\\"single-collection-card\\"> <img src=\\"\\" data-src=\\"storage/theme/8/Zag0eP9xbnb1a1dk1lpQhgt7WpjAlOsytTcIkYTI.webp\\" class=\\"lazy\\" width=\\"615\\" height=\\"600\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"> <h3 class=\\"overlay-text\\">Nuestras Colecciones</h3> </div> <div class=\\"single-collection-card\\"> <img src=\\"\\" data-src=\\"storage/theme/8/XzpUz2xE5TycjnTfTdt6Ur3MuWVHgUGgXj3pWSio.webp\\" class=\\"lazy\\" width=\\"615\\" height=\\"600\\" alt=\\"¡El juego con nuestras nuevas adiciones!\\"> <h3 class=\\"overlay-text\\"> Nuestras Colecciones </h3> </div> </div> </div> </div>"}'),
	(9, 9, 'es', '{"title": "Todos los Productos", "filters": {"sort": "name-desc", "limit": 12}}'),
	(10, 10, 'es', '{"css": ".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}", "html": "<div class=\\"section-gap bold-collections container\\"> <div class=\\"inline-col-wrapper direction-rtl\\"> <div class=\\"inline-col-image-wrapper\\"> <img src=\\"\\" data-src=\\"storage/theme/10/LTlUi9AJsvNTJlXJUfPsikqg0Wy605la60mF9iPd.webp\\" class=\\"lazy\\" width=\\"632\\" height=\\"510\\" alt=\\"¡Prepárate para nuestras nuevas Colecciones Audaces!\\"> </div> <div class=\\"inline-col-content-wrapper direction-ltr\\"> <h2 class=\\"inline-col-title\\"> ¡Prepárate para nuestras nuevas Colecciones Audaces! </h2> <p class=\\"inline-col-description\\">¡Presentamos Nuestras Nuevas Colecciones Audaces! Eleva tu estilo con diseños atrevidos y declaraciones vibrantes. Explora patrones llamativos y colores audaces que redefinen tu armario. ¡Prepárate para abrazar lo extraordinario!</p> <button class=\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\">Ver Colecciones</button> </div> </div> </div>"}'),
	(11, 11, 'es', '{"column_1": [{"url": "http://localhost/page/about-us", "title": "Acerca de Nosotros", "sort_order": 1}, {"url": "http://localhost/contact-us", "title": "Contáctenos", "sort_order": 2}, {"url": "http://localhost/page/customer-service", "title": "Servicio al Cliente", "sort_order": 3}, {"url": "http://localhost/page/whats-new", "title": "Novedades", "sort_order": 4}, {"url": "http://localhost/page/terms-of-use", "title": "Términos de Uso", "sort_order": 5}, {"url": "http://localhost/page/terms-conditions", "title": "Términos y Condiciones", "sort_order": 6}], "column_2": [{"url": "http://localhost/page/privacy-policy", "title": "Política de Privacidad", "sort_order": 1}, {"url": "http://localhost/page/payment-policy", "title": "Política de Pago", "sort_order": 2}, {"url": "http://localhost/page/shipping-policy", "title": "Política de Envío", "sort_order": 3}, {"url": "http://localhost/page/refund-policy", "title": "Política de Devolución", "sort_order": 4}, {"url": "http://localhost/page/return-policy", "title": "Política de Retorno", "sort_order": 5}]}'),
	(12, 12, 'es', '{"services": [{"title": "Envío gratuito", "description": "Envío gratuito en todos los pedidos", "service_icon": "icon-truck"}, {"title": "Reemplazo de producto", "description": "¡Reemplazo de producto sencillo disponible!", "service_icon": "icon-product"}, {"title": "EMI disponible", "description": "EMI sin costo disponible en todas las tarjetas de crédito comunes", "service_icon": "icon-dollar-sign"}, {"title": "Soporte 24/7", "description": "Soporte dedicado 24/7 por chat y correo electrónico", "service_icon": "icon-support"}]}');

-- Volcando estructura para tabla ecommerce.url_rewrites
CREATE TABLE IF NOT EXISTS `url_rewrites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.url_rewrites: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.users: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.visits
CREATE TABLE IF NOT EXISTS `visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` mediumtext COLLATE utf8mb4_unicode_ci,
  `referer` mediumtext COLLATE utf8mb4_unicode_ci,
  `languages` text COLLATE utf8mb4_unicode_ci,
  `useragent` text COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `device` text COLLATE utf8mb4_unicode_ci,
  `platform` text COLLATE utf8mb4_unicode_ci,
  `browser` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_id` bigint unsigned DEFAULT NULL,
  `visitor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_id` bigint unsigned DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  KEY `visits_channel_id_foreign` (`channel_id`),
  CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.visits: ~0 rows (aproximadamente)
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '{"host":["127.0.0.1:8000"],"connection":["keep-alive"],"sec-ch-ua":["\\"Chromium\\";v=\\"134\\", \\"Not:A-Brand\\";v=\\"24\\", \\"Google Chrome\\";v=\\"134\\""],"sec-ch-ua-mobile":["?0"],"sec-ch-ua-platform":["\\"Windows\\""],"upgrade-insecure-requests":["1"],"user-agent":["Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/134.0.0.0 Safari\\/537.36"],"accept":["text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7"],"sec-fetch-site":["none"],"sec-fetch-mode":["navigate"],"sec-fetch-user":["?1"],"sec-fetch-dest":["document"],"accept-encoding":["gzip, deflate, br, zstd"],"accept-language":["es-MX,es-US;q=0.9,es-419;q=0.8,es;q=0.7"],"cookie":["_ga=GA1.1.1371525441.1709911184; __stripe_mid=23aecf24-8d29-47b4-9bd0-5f7d1aafed9ba59949; _ga_93XR7J39BH=GS1.1.1717609156.15.1.1717609179.0.0.0; XSRF-TOKEN=eyJpdiI6IjVWcStKbTlVU2M4SWU5QVZrV0FUekE9PSIsInZhbHVlIjoiMnZTb1pXSWRiWGtGQVk4SWZqbzZzZXlCdm1SbDI4WCs3U25OY0FFeHFudTdtN2FrU3kxLzQxSklPNXY4UG5IMVI4enZkZU9BclUwSlJpQkFkNS9ZUWFTaHlzVnBwT3J1NXFLay9TYVRXQ3VHVWNQNzlZZkJ2MURJYmZwTnpYbVQiLCJtYWMiOiI4MTZjN2YxODRhNWIwYThhOGU2MmJmMDkwYzhkNTBmOGNkMjcwNDNiNzMwNjAyNDA0NDI3ZWM0NjFjODhiNDQwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ik9GWmdCWTV2YjJ4YXRXME1OQUROOHc9PSIsInZhbHVlIjoid0lXRzN3YTV3Q1lvNkZLTExoSngwYjlPMldVOFdZN2ovbUpCQW0vZkl1OWFxNzhHVTh4RzVWdnVhVnpNWnVvclpyN28wS0lWZ1ptaUNBWnlvNmtKWHhFZlFQT005b29uR0NZUlp1aWNiejRuVGFqY2xnanRad2VzbE9iWDhJRFciLCJtYWMiOiIzYzkzZWU1Nzk1OGRiNGJjYzU4MjJkOWMxMjJiZTBhNzg0MzUyNjdhODJlNDg4NDljYWM4Y2FhODA4YmRhZTdmIiwidGFnIjoiIn0%3D"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-04 01:46:56', '2025-04-04 01:46:56');

-- Volcando estructura para tabla ecommerce.wishlist
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.wishlist: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ecommerce.wishlist_items
CREATE TABLE IF NOT EXISTS `wishlist_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ecommerce.wishlist_items: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
