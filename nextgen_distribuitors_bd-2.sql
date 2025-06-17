-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2025 a las 04:50:26
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
(11, 'dfaskjdfhkjsdfbjasdkfbnas'),
(10, 'dsfgdfgdzfgdfg'),
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
(6, 6, 6, 'HOLAAAAAAAAAAAA', 20.00, 251, '2025-06-15'),
(7, 7, 7, 'TEST', 234.00, 23, '2025-06-14'),
(8, 13, 5, 'dsadasdadada', 15.00, 1000000020, '2025-06-11'),
(9, 14, 1, 'HOLA', 20.00, 70, '2025-06-12');

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

--
-- Volcado de datos para la tabla `limites_stock`
--

INSERT INTO `limites_stock` (`id`, `producto_id`, `categoria_id`, `stock_minimo`, `stock_maximo`, `creado_en`) VALUES
(9, 13, NULL, 25, 400, '2025-06-15 06:07:58'),
(23, 5, NULL, 50, 85, '2025-06-15 07:21:16'),
(24, 14, NULL, 10, 25, '2025-06-15 07:24:41'),
(25, 6, 6, 10, 200, '2025-06-16 05:14:41'),
(27, 4, NULL, 100, 1000, '2025-06-16 19:05:08');

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
(1, 6, 2, 23, 'entrada', '2025-06-14 09:35:17', 'fernando@gmail.com', NULL, '2025-06-16 12:47:19', 'salida', 0),
(2, 14, 12, 15, 'entrada', '2025-06-15 07:01:26', 'fernando@gmail.com', NULL, '2025-06-16 12:47:19', 'salida', 0),
(3, 4, 4, 20, 'salida', '2025-06-16 12:56:50', NULL, 'dfgdfgdfgdgfd', '2025-06-16 12:56:50', 'salida', 1),
(4, 13, 5, 20, 'entrada', '2025-06-16 20:57:23', 'fernando@gmail.com', NULL, '2025-06-16 12:57:23', 'salida', 0),
(5, 14, 1, 100, 'entrada', '2025-06-16 20:58:14', 'fernando@gmail.com', NULL, '2025-06-16 12:58:14', 'salida', 0),
(6, 14, 1, 15, 'salida', '2025-06-16 12:59:23', NULL, 'FDSFSDFSDFSD', '2025-06-16 12:59:23', 'salida', 1),
(7, 6, 6, 200, 'entrada', '2025-06-17 00:11:09', 'fernando@gmail.com', NULL, '2025-06-16 16:11:09', 'salida', 0),
(8, 14, 1, 30, 'salida', '2025-06-16 16:59:25', NULL, 'jhguighui', '2025-06-16 16:59:25', 'salida', 1),
(9, 2, 2, 25, 'salida', '2025-06-16 18:13:39', NULL, 'gdfgfdgdgdgdf', '2025-06-16 18:13:39', 'salida', 1);

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
(7, 'TEST', 'PROD-0007', 7),
(8, 'dfefwe', 'PROD-5831', 1),
(9, 'werwerwer', 'PROD-0969', 2),
(10, 'qweqwreq', 'PROD-2869', 11),
(11, 'dfserwer', 'PROD-3656', 3),
(12, 'werwerwe', 'PROD-8899', 11),
(13, 'dfgdfg', 'PROD-6047', 6),
(14, 'joel', 'PROD-4257', 2);

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
(9, 'asdjgshdgasud'),
(12, 'dfgdfgdfgdfg'),
(6, 'DisplayTech Ltd'),
(11, 'eerwer'),
(5, 'GadgetHub Import'),
(2, 'HardParts Co.'),
(10, 'jzdfjsdghfjdkbfh'),
(3, 'LaptopWorld Inc.'),
(4, 'NetPro Solutions'),
(1, 'TechSource S.A.'),
(7, 'TEST');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `limites_stock`
--
ALTER TABLE `limites_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
