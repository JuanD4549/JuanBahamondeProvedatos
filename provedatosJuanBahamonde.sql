-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2026 a las 14:56:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `provedatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `persona_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `cargo` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `provincia_id` bigint(20) UNSIGNED NOT NULL,
  `sueldo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `jornada_parcial` tinyint(1) NOT NULL DEFAULT 0,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `persona_id`, `fecha_ingreso`, `cargo`, `departamento`, `provincia_id`, `sueldo`, `jornada_parcial`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-03-24', 'FullStack', 'Desarrollo', 12, 750.00, 1, NULL, NULL, '2026-03-25 12:33:00'),
(2, 2, NULL, 'QA', 'Desarrollo', 3, 100.00, 1, NULL, '2026-03-25 02:17:22', '2026-03-25 09:22:04'),
(3, 12, '2026-03-03', 'qa', 'qa', 36, 500.00, 0, NULL, '2026-03-25 12:45:06', '2026-03-25 13:27:40'),
(4, 13, '2026-03-25', 'free', 'free', 14, 5000.00, 1, NULL, '2026-03-25 12:54:57', '2026-03-25 12:54:57'),
(5, 14, '2026-03-13', 'Test56', 'Test56', 10, 55.00, 1, 'con', '2026-03-25 12:59:59', '2026-03-25 12:59:59'),
(6, 15, NULL, 'Test562', 'Test562', 2, 789.00, 0, NULL, '2026-03-25 13:02:36', '2026-03-25 13:02:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2026_03_24_194930_create_personas_table', 1),
(10, '2026_03_24_195149_create_empleados_table', 1),
(12, '2026_03_24_200524_create_provincias_table', 2),
(13, '2026_03_24_203153_create_personal_access_tokens_table', 3),
(14, '2026_03_24_213435_create_sessions_table', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `provincia_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `fotografia` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombres`, `apellidos`, `cedula`, `provincia_id`, `fecha_nacimiento`, `email`, `observaciones`, `fotografia`, `created_at`, `updated_at`) VALUES
(1, 'Juan Diego', 'Bahamonde', '1726766452', 1, '1999-06-23', 'juandiego402@gmail.com', NULL, NULL, NULL, NULL),
(2, 'Test2', 'Test Test', '1726766453', 3, NULL, 'test@email.com', NULL, NULL, '2026-03-25 02:07:53', '2026-03-25 09:22:04'),
(12, 'Test50', 'Test5', '1234567865', 40, '2023-06-25', 'Test5@Test5.com', 'ninguna', '/img/fotos_empleados/test5.jpeg', '2026-03-25 12:45:06', '2026-03-25 13:17:53'),
(13, 'Test7290', 'Test7', '1111111112', 16, '2026-03-10', 'Test27@Test7.com', NULL, '/img/fotos_empleados/test7.png', '2026-03-25 12:54:57', '2026-03-25 13:03:23'),
(14, 'Test56', 'Test56', '1111111122', 1, '2026-02-23', 'Test56@Test56.com', 'ni', '/img/fotos_empleados/test56.jpeg', '2026-03-25 12:59:59', '2026-03-25 12:59:59'),
(15, 'Test562', 'Test562', '2222222222', 4, NULL, 'Test562@Test562.com', NULL, '/img/fotos_empleados/test562.png', '2026-03-25 13:02:36', '2026-03-25 13:02:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_provincia` varchar(255) NOT NULL,
  `capital_provincia` varchar(255) NOT NULL,
  `descripcion_provincia` text NOT NULL,
  `poblacion_provincia` decimal(12,2) DEFAULT NULL,
  `superficie_provincia` decimal(12,2) DEFAULT NULL,
  `latitud_provincia` decimal(10,6) DEFAULT NULL,
  `longitud_provincia` decimal(10,6) DEFAULT NULL,
  `id_region` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `nombre_provincia`, `capital_provincia`, `descripcion_provincia`, `poblacion_provincia`, `superficie_provincia`, `latitud_provincia`, `longitud_provincia`, `id_region`, `created_at`, `updated_at`) VALUES
(1, 'Azuay', 'Cuenca', 'Es llamada la Atenas del Ecuador por su arquitectura, su diversidad cultural, su aporte a las artes, ciencias y letras ecuatorianas y por ser el lugar de nacimiento de muchos personajes ilustres de la sociedad ecuatoriana', 569.42, 122.00, -2.902222, -79.005261, 1, NULL, NULL),
(2, 'Bolivar', 'Guaranda', 'Bolívar es una provincia del centro de Ecuador, en la cordillera noccidental de los Andes. Su capital es la ciudad de Guaranda. La Provincia de Bolívar se nllama así en honor al Libertador Simón Bolívar.', 183.00, 3254.00, -1.600000, 0.000000, 1, NULL, NULL),
(3, 'Cañar', 'Azoguez', 'La provincia destaca como uno de los sitios turísticos más importantes del país, destacándose entre otros la Fortaleza de Ingapirca, la Laguna de Culebrillas y la ciudad de Azogues.', 33848.00, 3908.00, -2.733333, -78.833333, 1, NULL, NULL),
(4, 'Carchi', 'Tulcán', 'Carchi es una provincia ecuatoriana situada al norte del Ecuador en la frontera con Colombia. Su capital es la ciudad de Tulcán. Forma parte de la región 1', 82734.00, 3783.00, 0.811667, -77.718611, 1, NULL, NULL),
(5, 'Chimborazo', 'Riobamba', 'En esta provincia se encuentran varias de las cumbres más elevadas del país, como el Carihuairazo, el Altar, Igualata, Sangay, entre otros, que en algunos casos comparte con otras provincias.', 223586.00, 6487.00, -1.666667, -78.650000, 1, NULL, NULL),
(6, 'Cotopaxi', 'Latacunga', 'La provincia toma el nombre del volcán más grande e importante de su territorio, el volcán Cotopaxi. Cotopaxi se encuentra dividida políticamente en 7 cantones. Según el último ordenamiento territorial, la provincia de Cotopaxi pertenece a la región centro 3', 409.00, 6569.00, -0.933333, -78.616667, 1, NULL, NULL),
(7, 'El Oro', 'Machala', 'La capital de la provincia de El Oro es la ciudad de Machala, quinta ciudad del país, considerada como la capital bananera del mundo.', 260528.00, 6188.00, -3.266669, -79.966700, 2, NULL, NULL),
(8, 'Esmeraldas', 'Esmeraldas', 'Provincia del Ecuador situada en su costa noroccidental, conocida popularmente como la provincia verde. Sucapital homónima es uno de los puertos principales del Ecuador y terminal del oleoducto transandino. Posee un aeropuerto para vuelos nacionales e internacionales', 189504.00, 15.00, -0.966667, -79.650000, 2, NULL, NULL),
(9, 'Galápagos', 'P. Baquerizo Moreno', 'Es el mayor centro turístico del Ecuador, así como también una de las reservas ecológicas más grandes e importantes del planeta. Con sus 26.640 habitantes, Galápagos es la provincia menos poblada del país, debido principalmente al afán de conservar al máximo la flora y fauna de la región.', 5600.00, 8010.00, -0.666667, -90.550000, 3, NULL, NULL),
(10, 'Guayas', 'Guayaquil', 'Es el mayor centro comercial e industrial del Ecuador. Con sus 3,8 millones de habitantes, Guayas es la provincia más poblada del país, constituyéndose con el 24,5% de la población de la República.', 2526927.00, 17139.00, -2.200000, -79.966700, 2, NULL, NULL),
(11, 'Imbabura', 'Ibarra', 'La provincia también es conocida por sus contrastes poblacionales es así que la población está marcada por diferentes factores demográficos, además desde siempre ha sido núcleo de artesanías y cultura.', 181722.00, 4599.00, 0.350000, -78.133333, 1, NULL, NULL),
(12, 'Loja', 'Loja', 'Loja es una ciudad del Ecuador, capital de la provincia y cantón Loja, tiene una rica tradición en las artes, y por esta razón es conocida como la capital musical y cultural del Ecuador.', 206.83, 57.00, -3.833000, -80.067000, 1, NULL, NULL),
(13, 'Los Rios', 'Babahoyo', 'Los Ríos, oficialmente Provincia de Los Ríos, es una de las 24 provincias de la República del Ecuador, localizada en la Región Costa del país. Su capital es la ciudad de Babahoyo y su localidad más poblada es la ciudad de Quevedo. Es uno de los más importantes centros agrícolas del Ecuador. Su territorio está ubicado en la parte central del litoral del país y limita con las provincias de Guayas, Santo Domingo de los Tsáchilas, Manabí, Cotopaxi y Bolívar. Según el último ordenamiento territorial, la provincia de Los Ríos pertenece a la región comprendida también por las provincias de Bolívar, Guayas y Santa Elena.', 778115.00, 6254.00, -1.766669, -79.450000, 2, NULL, NULL),
(14, 'Manabí', 'Portoviejo', 'Manabí es una provincia ecuatoriana localizada en el emplazamiento centro-noroeste del Ecuador continental, cuya unidad jurídica se ubica en la región geográfica del litoral, que a su vez se encuentra dividida por el cruce de la línea equinoccial. Su capital es Portoviejo. Limita al oeste con el Océano Pacífico, al norte con la provincia de Esmeraldas, al este con la provincia deSanto Domingo de los nTsáchilas y Los Ríos, al sur con la provincia de Santa Elena y al sur y este con la provincia de Guayas. Con una población de 1,395.249 habitantes, es la tercera provincia nmás poblada de Ecuador.', 1369780.00, 18400.00, -1.052219, -80.450600, 2, NULL, NULL),
(15, 'Morona nSantiago', 'Macas', 'Morona Santiago (nombre oficial Provincia de Morona Santiago) es una de las 24 provincias que conforman la República del Ecuador. Es una provincia de la Amazonía ecuatoriana. Su capital es la ciudad de Macas, la cual además, es su urbe más poblada. Su territorio limita al norte con Pastaza, al sur con Zamora Chinchipe, al este con Perú, y al oeste con Tungurahua, Azuay, Chimborazo y Cañar. Ocupa una superficie de 25.690 km2, un área similar a la de Cerdeña.', 147940.00, 25690.00, -2.366667, -78.133333, 4, NULL, NULL),
(16, 'Napo', 'Tena', 'La provincia de Napo es una de las provincias de la Región Centro Norte (Ecuador), de la República del Ecuador, situada en la región amazónica ecuatoriana e incluyendo parte de las laderas de los Andes, hasta las llanuras amazónicas. Toma su nombre del río Napo. Su capital es la ciudad de Tena. Limita al norte con Sucumbíos, al sur con Pastaza, al oeste con Pichincha,Cotopaxi y Tungurahua y al este con la Provincia de Orellana.', 103697.00, 13271.00, 0.989000, -77.815900, 4, NULL, NULL),
(17, 'Orellana', 'Francisco de Orellana', 'Orellana, provincia de la Región Centro Norte (Ecuador), Ecuador, La capital de la provincia es El Coca más conocida como «Coca». Al norte limita con Sucumbíos, al sur con la provincia de Pastaza, al este con Perú y al oeste con Napo. Tiene una superficie de 20.733 km2, que en términos de extensión es similar a la de El Salvador. Es una de las provincias más nuevas del país, provincia 22, pues fue creada en 1998 al ser separada de Napo. Inicialmente su nombre iba a ser provincia de Amazonaspero ante un potencial reclamo de Perú se decidió denominarla Orellana. La población es de 136.396 habitantes; sus habitantes nativos pertenecen principalmente a las nacionalidades waorani, schuar y kichwa.', 136396.00, 20773.00, -0.933333, -75.666667, 4, NULL, NULL),
(18, 'Pastaza', 'Puyo', 'Pastaza, oficialmente Provincia de Pastaza, es una de las 24 provincias que conforman la República del Ecuador, situada en laRegión Amazónica del Ecuador. Recibe su nombre del río Pastaza, que la separa al sur de la provincia de Morona Santiago. Su capital es la ciudad de Puyo.', 83933.00, 29520.00, -1.066667, -78.001111, 4, NULL, NULL),
(19, 'Pichincha', 'Quito', 'La Provincia de Pichincha es una de las 24 provincias que conforman la República del Ecuador. Se encuentra ubicada al norte del país, en la zona geográfica conocida como sierra. Su capital administrativa es la ciudad de Quito, la cual además es su urbe más poblada y la capital del país. Es también el principal centro comercial del país.', 2576287.00, 9612.00, -0.250000, -78.583333, 1, NULL, NULL),
(20, 'Cañar', 'Azoguez', 'La provincia destaca como uno de los sitios turísticos más importantes del país, destacándose entre otros la Fortaleza de Ingapirca, la Laguna de Culebrillas y la ciudad de Azogues.', 33848.00, 3908.00, -2.733333, -78.833333, 1, NULL, NULL),
(21, 'Carchi', 'Tulcán', 'Carchi es una provincia ecuatoriana situada al norte del Ecuador en la frontera con Colombia. Su capital es la ciudad de Tulcán. Forma parte de la región 1', 82734.00, 3783.00, 0.811667, -77.718611, 1, NULL, NULL),
(22, 'Chimborazo', 'Riobamba', 'En esta provincia se encuentran varias de las cumbres más elevadas del país, como el Carihuairazo, el Altar, Igualata, Sangay, entre otros, que en algunos casos comparte con otras provincias.', 223586.00, 6487.00, -1.666667, -78.650000, 1, NULL, NULL),
(23, 'Cotopaxi', 'Latacunga', 'La provincia toma el nombre del volcán más grande e importante de su territorio, el volcán Cotopaxi. Cotopaxi se encuentra dividida políticamente en 7 cantones. Según el último ordenamiento territorial, la provincia de Cotopaxi pertenece a la región centro 3', 409.00, 6569.00, -0.933333, -78.616667, 1, NULL, NULL),
(24, 'El Oro', 'Machala', 'La capital de la provincia de El Oro es la ciudad de Machala, quinta ciudad del país, considerada como la capital bananera del mundo.', 260528.00, 6188.00, -3.266669, -79.966700, 2, NULL, NULL),
(25, 'Esmeraldas', 'Esmeraldas', 'Provincia del Ecuador situada en su costa noroccidental, conocida popularmente como la provincia verde. Sucapital homónima es uno de los puertos principales del Ecuador y terminal del oleoducto transandino. Posee un aeropuerto para vuelos nacionales e internacionales', 189504.00, 15.00, -0.966667, -79.650000, 2, NULL, NULL),
(26, 'Galápagos', 'P. Baquerizo Moreno', 'Es el mayor centro turístico del Ecuador, así como también una de las reservas ecológicas más grandes e importantes del planeta. Con sus 26.640 habitantes, Galápagos es la provincia menos poblada del país, debido principalmente al afán de conservar al máximo la flora y fauna de la región.', 5600.00, 8010.00, -0.666667, -90.550000, 3, NULL, NULL),
(27, 'Guayas', 'Guayaquil', 'Es el mayor centro comercial e industrial del Ecuador. Con sus 3,8 millones de habitantes, Guayas es la provincia más poblada del país, constituyéndose con el 24,5% de la población de la República.', 2526927.00, 17139.00, -2.200000, -79.966700, 2, NULL, NULL),
(28, 'Imbabura', 'Ibarra', 'La provincia también es conocida por sus contrastes poblacionales es así que la población está marcada por diferentes factores demográficos, además desde siempre ha sido núcleo de artesanías y cultura.', 181722.00, 4599.00, 0.350000, -78.133333, 1, NULL, NULL),
(29, 'Loja', 'Loja', 'Loja es una ciudad del Ecuador, capital de la provincia y cantón Loja, tiene una rica tradición en las artes, y por esta razón es conocida como la capital musical y cultural del Ecuador.', 206.83, 57.00, -3.833000, -80.067000, 1, NULL, NULL),
(30, 'Los Rios', 'Babahoyo', 'Los Ríos, oficialmente Provincia de Los Ríos, es una de las 24 provincias de la República del Ecuador, localizada en la Región Costa del país. Su capital es la ciudad de Babahoyo y su localidad más poblada es la ciudad de Quevedo. Es uno de los más importantes centros agrícolas del Ecuador. Su territorio está ubicado en la parte central del litoral del país y limita con las provincias de Guayas, Santo Domingo de los Tsáchilas, Manabí, Cotopaxi y Bolívar. Según el último ordenamiento territorial, la provincia de Los Ríos pertenece a la región comprendida también por las provincias de Bolívar, Guayas y Santa Elena.', 778115.00, 6254.00, -1.766669, -79.450000, 2, NULL, NULL),
(31, 'Manabí', 'Portoviejo', 'Manabí es una provincia ecuatoriana localizada en el emplazamiento centro-noroeste del Ecuador continental, cuya unidad jurídica se ubica en la región geográfica del litoral, que a su vez se encuentra dividida por el cruce de la línea equinoccial. Su capital es Portoviejo. Limita al oeste con el Océano Pacífico, al norte con la provincia de Esmeraldas, al este con la provincia deSanto Domingo de los nTsáchilas y Los Ríos, al sur con la provincia de Santa Elena y al sur y este con la provincia de Guayas. Con una población de 1,395.249 habitantes, es la tercera provincia nmás poblada de Ecuador.', 1369780.00, 18400.00, -1.052219, -80.450600, 2, NULL, NULL),
(32, 'Morona nSantiago', 'Macas', 'Morona Santiago (nombre oficial Provincia de Morona Santiago) es una de las 24 provincias que conforman la República del Ecuador. Es una provincia de la Amazonía ecuatoriana. Su capital es la ciudad de Macas, la cual además, es su urbe más poblada. Su territorio limita al norte con Pastaza, al sur con Zamora Chinchipe, al este con Perú, y al oeste con Tungurahua, Azuay, Chimborazo y Cañar. Ocupa una superficie de 25.690 km2, un área similar a la de Cerdeña.', 147940.00, 25690.00, -2.366667, -78.133333, 4, NULL, NULL),
(33, 'Napo', 'Tena', 'La provincia de Napo es una de las provincias de la Región Centro Norte (Ecuador), de la República del Ecuador, situada en la región amazónica ecuatoriana e incluyendo parte de las laderas de los Andes, hasta las llanuras amazónicas. Toma su nombre del río Napo. Su capital es la ciudad de Tena. Limita al norte con Sucumbíos, al sur con Pastaza, al oeste con Pichincha,Cotopaxi y Tungurahua y al este con la Provincia de Orellana.', 103697.00, 13271.00, 0.989000, -77.815900, 4, NULL, NULL),
(34, 'Orellana', 'Francisco de Orellana', 'Orellana, provincia de la Región Centro Norte (Ecuador), Ecuador, La capital de la provincia es El Coca más conocida como «Coca». Al norte limita con Sucumbíos, al sur con la provincia de Pastaza, al este con Perú y al oeste con Napo. Tiene una superficie de 20.733 km2, que en términos de extensión es similar a la de El Salvador. Es una de las provincias más nuevas del país, provincia 22, pues fue creada en 1998 al ser separada de Napo. Inicialmente su nombre iba a ser provincia de Amazonaspero ante un potencial reclamo de Perú se decidió denominarla Orellana. La población es de 136.396 habitantes; sus habitantes nativos pertenecen principalmente a las nacionalidades waorani, schuar y kichwa.', 136396.00, 20773.00, -0.933333, -75.666667, 4, NULL, NULL),
(35, 'Pastaza', 'Puyo', 'Pastaza, oficialmente Provincia de Pastaza, es una de las 24 provincias que conforman la República del Ecuador, situada en laRegión Amazónica del Ecuador. Recibe su nombre del río Pastaza, que la separa al sur de la provincia de Morona Santiago. Su capital es la ciudad de Puyo.', 83933.00, 29520.00, -1.066667, -78.001111, 4, NULL, NULL),
(36, 'Pichincha', 'Quito', 'La Provincia de Pichincha es una de las 24 provincias que conforman la República del Ecuador. Se encuentra ubicada al norte del país, en la zona geográfica conocida como sierra. Su capital administrativa es la ciudad de Quito, la cual además es su urbe más poblada y la capital del país. Es también el principal centro comercial del país.', 2576287.00, 9612.00, -0.250000, -78.583333, 1, NULL, NULL),
(37, 'Santa Elena', 'Santa nElena', 'Santa Elena es una provincia de la costa de Ecuador creada el 7 de noviembre de 2007, la más reciente de las 24 actuales, con territorios que anterior a esa fecha formaban parte de la provincia del Guayas, al oeste de ésta.', 308693.00, 3763.00, -2.226700, -80.858300, 2, NULL, NULL),
(38, 'Santo Domingo de los Tsáchilas', 'Santo Domingo', 'La Provincia de Santo Domingo de los Tsáchilas es una de las provincias de la República del Ecuador y forma parte de laRegión Costa, históricamente conocida como Provincia de Yumbos. Su territorio está en zona de trópico húmedo. La provincia toma su nombre de los Tsáchilas, etnia ancestral de la zona.', 410937.00, 4180.00, -0.333333, -79.250000, 2, NULL, NULL),
(39, 'Sucumbios', 'Nueva Loja', 'Sucumbíos es una provincia del nor-oriente del Ecuador. Su capital es Nueva Loja. Es una de las principales provincias que proveen al Estado ecuatoriano del petróleo que necesita para las exportaciones. Se caracteriza por sus bellos paisajes amazónicos, entre ellos el río Aguarico.', 176472.00, 18612.00, -0.083333, -76.883333, 4, NULL, NULL),
(40, 'Tungurahua', 'Ambato', 'Tungurahua, oficialmente Provincia de Tungurahua, es una de las 24 provincias que conforman la República del Ecuador. Se encuentra al centro del país, en la región geográfica conocida como sierra. La ciudad de Ambato es su capital administrativa; se divide en 9 cantones. Forma parte de la región comprendida también por las provincias de Cotopaxi, Chimborazo y Pastaza.', 504583.00, 3334.00, 0.000000, -78.616667, 1, NULL, NULL),
(41, 'Zamora Chimchipe', 'Zamora', 'Zamora Chinchipe es una provincia de Ecuador ubicada en el sur-oriente de la Amazonía ecuatoriana, que limita con la provincia de Morona Santiago al norte; con la provincia de Loja al oeste; y con Perú al sur y este. Según el último ordenamiento territorial del Ecuador, Zamora Chinchipe pertenece a la Región Sur comprendida también por las provincias de Loja y El Oro. Tiene una superficie de 10.556 km2, la cual comprende una orografía montañosa única que la distingue del resto de provincias amazónicas.', 91376.00, 10556.00, -2.883333, -79.000000, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('tqPjc8hN8w937YHoxmnykx1kGkpJlvQ5Ixk3LplB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'eyJfdG9rZW4iOiJEZzRSUkM0UmJYQVNESndpTVZ5VkhjNEdWekJsZWQyRkNmcUlHRFk4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1774437612),
('vzOuvH9eLNRXUtHPr5bb5sBWe6HcMMvzi3ppbLtn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'eyJfdG9rZW4iOiJEUEo4RmNQTGZjOXFhRmExUDZnQ0dZenZHam9meVZxRnJkaTZvM3JVIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1774421172);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empleados_persona_id_unique` (`persona_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_cedula_unique` (`cedula`),
  ADD UNIQUE KEY `personas_email_unique` (`email`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
