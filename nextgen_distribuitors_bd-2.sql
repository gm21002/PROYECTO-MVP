-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2025 a las 02:26:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nextgen_distribuitors_bd-2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(5, 'Accesorios'),
(2, 'Componentes'),
(1, 'Laptops'),
(6, 'Monitores'),
(3, 'Periféricos'),
(4, 'Redes'),
(7, 'TEST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cantidad_stock` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `producto_id`, `proveedor_id`, `descripcion`, `precio`, `cantidad_stock`, `fecha_ingreso`) VALUES
(1, 1, 3, 'Laptop ultradelgada 13\" Intel i7 · 16 GB RAM · 512 GB SSD', 899.00, 25, '2025-06-14'),
(2, 2, 2, 'Unidad SSD NVMe PCIe 4.0 de 1 terabyte', 129.90, 15, '2025-06-14'),
(3, 3, 1, 'Teclado mecánico switches red, iluminación RGB', 59.99, 60, '2025-06-14'),
(4, 4, 4, 'Router inalámbrico doble banda, WiFi 6 AX3000', 104.50, 10, '2025-06-14'),
(5, 5, 5, 'Ratón óptico 16 000 DPI con 8 botones programables', 44.75, 80, '2025-06-14'),
(10, 14, 12, 'Lote de memorias RAM de 32 GB marca Kingston', 40.00, 50, '2025-06-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `limites_stock`
--

CREATE TABLE `limites_stock` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `stock_minimo` int(11) NOT NULL,
  `stock_maximo` int(11) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_correo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp(),
  `tipo_movimiento` varchar(50) NOT NULL DEFAULT 'salida',
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `producto_id`, `proveedor_id`, `cantidad`, `tipo`, `fecha`, `usuario_correo`, `descripcion`, `fecha_hora`, `tipo_movimiento`, `usuario_id`) VALUES
(1, 6, 2, 23, 'entrada', '2025-06-14 09:35:17', 'fernando@gmail.com', 'Ingreso por nueva compra', '2025-06-16 12:47:19', 'salida', 0),
(2, 14, 12, 15, 'entrada', '2025-06-15 07:01:26', 'fernando@gmail.com', 'Reposición tras alta demanda', '2025-06-16 12:47:19', 'salida', 0),
(3, 4, 4, 20, 'salida', '2025-06-16 12:56:50', 'fernando@gmail.co', 'Entrega para cliente externo', '2025-06-16 12:56:50', 'salida', 1),
(4, 13, 5, 20, 'entrada', '2025-06-16 20:57:23', 'fernando@gmail.com', 'Ingreso por nueva compra', '2025-06-16 12:57:23', 'salida', 0),
(5, 14, 1, 100, 'entrada', '2025-06-16 20:58:14', 'fernando@gmail.com', 'Ingreso por nueva compra', '2025-06-16 12:58:14', 'salida', 0),
(6, 14, 1, 15, 'salida', '2025-06-16 12:59:23', 'fernando@gmail.co', 'Salida por venta directa', '2025-06-16 12:59:23', 'salida', 1),
(7, 6, 6, 200, 'entrada', '2025-06-17 00:11:09', 'fernando@gmail.com', 'Ajuste por revisión de stock', '2025-06-16 16:11:09', 'salida', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `codigo`, `categoria_id`) VALUES
(1, 'Ultrabook X13', 'PROD-0001', 1),
(2, 'SSD NVMe 1 TB', 'PROD-0002', 2),
(3, 'Teclado Mecánico RGB', 'PROD-0003', 3),
(4, 'Router WiFi 6 AX3000', 'PROD-0004', 4),
(5, 'Mouse Gamer Pro', 'PROD-0005', 5),
(6, 'Monitor 27\" 4K IPS', 'PROD-0006', 6),
(13, 'Monitor Samsung 32\" 2k IPS', 'PROD-6047', 6),
(14, 'Memoria RAM 32 GB', 'PROD-4257', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`) VALUES
(6, 'DisplayTech Ltd'),
(5, 'GadgetHub Import'),
(12, 'GigaNet'),
(2, 'HardParts Co.'),
(3, 'LaptopWorld Inc.'),
(4, 'NetPro Solutions'),
(1, 'TechSource S.A.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('administrador','tecnico') NOT NULL DEFAULT 'tecnico',
  `ultimo_acceso` datetime DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `contrasena`, `rol`, `ultimo_acceso`, `creado_en`) VALUES
(1, 'fernando@gmail.com', 'Admin123#', 'administrador', '2025-06-16 04:17:15', '2025-06-12 06:28:42');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inv_prod` (`producto_id`),
  ADD KEY `fk_inv_prov` (`proveedor_id`);

--
-- Indices de la tabla `limites_stock`
--
ALTER TABLE `limites_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `producto_id` (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_codigo` (`codigo`),
  ADD KEY `fk_prod_cat` (`categoria_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `limites_stock`
--
ALTER TABLE `limites_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_inv_prod` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inv_prov` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `limites_stock`
--
ALTER TABLE `limites_stock`
  ADD CONSTRAINT `limites_stock_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `limites_stock_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_prod_cat` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
