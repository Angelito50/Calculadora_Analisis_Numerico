-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 06:39:15
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
-- Base de datos: `db_micalcu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tbl_usuarios', 7, 'add_tbl_usuarios'),
(26, 'Can change tbl_usuarios', 7, 'change_tbl_usuarios'),
(27, 'Can delete tbl_usuarios', 7, 'delete_tbl_usuarios'),
(28, 'Can view tbl_usuarios', 7, 'view_tbl_usuarios'),
(29, 'Can add tbl_ ecuaciones', 8, 'add_tbl_ecuaciones'),
(30, 'Can change tbl_ ecuaciones', 8, 'change_tbl_ecuaciones'),
(31, 'Can delete tbl_ ecuaciones', 8, 'delete_tbl_ecuaciones'),
(32, 'Can view tbl_ ecuaciones', 8, 'view_tbl_ecuaciones'),
(33, 'Can add tbl_ euler', 9, 'add_tbl_euler'),
(34, 'Can change tbl_ euler', 9, 'change_tbl_euler'),
(35, 'Can delete tbl_ euler', 9, 'delete_tbl_euler'),
(36, 'Can view tbl_ euler', 9, 'view_tbl_euler');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(9, 'pbkdf2_sha256$720000$EkxvCG90W0feAloE0CdOqJ$ViXffFcrZnSDNBLeYRyyLekN/21RELQnUr+h6MdbogQ=', '2024-06-24 04:23:24.571128', 0, 'paiz', '', '', 'paizramos@gmail.com', 0, 1, '2024-06-24 04:23:22.625706'),
(10, 'pbkdf2_sha256$720000$whwgTl9krkwHzhdKW5IT91$of0UaCJ1aQ7dVNuAwoFQix9fpk4l3DQ7/dvqiZh7NJc=', '2024-06-24 04:23:46.338390', 0, 'angel', '', '', 'angelmedrano@gmail.com', 0, 1, '2024-06-24 04:23:44.337593');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'mi_calculadora_app', 'tbl_ecuaciones'),
(9, 'mi_calculadora_app', 'tbl_euler'),
(7, 'mi_calculadora_app', 'tbl_usuarios'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-20 04:39:12.716044'),
(2, 'auth', '0001_initial', '2024-06-20 04:39:14.045025'),
(3, 'admin', '0001_initial', '2024-06-20 04:39:14.638077'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-20 04:39:14.672080'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-20 04:39:14.719092'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-20 04:39:14.915998'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-20 04:39:15.067998'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-20 04:39:15.342472'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-20 04:39:15.367475'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-20 04:39:15.536517'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-20 04:39:15.545520'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-20 04:39:15.607540'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-20 04:39:15.709150'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-20 04:39:15.748864'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-20 04:39:15.965885'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-20 04:39:15.988882'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-20 04:39:16.053883'),
(18, 'mi_calculadora_app', '0001_initial', '2024-06-20 04:39:16.714999'),
(19, 'sessions', '0001_initial', '2024-06-20 04:39:16.853184'),
(20, 'mi_calculadora_app', '0002_alter_tbl_ecuaciones_user_alter_tbl_euler_user', '2024-06-20 05:11:11.334677'),
(21, 'mi_calculadora_app', '0003_tbl_euler_resultado', '2024-06-23 18:46:14.217040');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c7u23o2el89zl6xwe53c8n11yes7e5ot', '.eJxVjEEOwiAQRe_C2hCY0lJcuvcMZJgZpWogKe3KeHfbpAvdvvf-f6uI65Lj2mSOE6uz8ur0yxLSU8ou-IHlXjXVssxT0nuiD9v0tbK8Lkf7d5Cx5W09dCHcYByS9MkAkEVxiMEyoqdEvCF2lpyVQJQEeHSA3gH0YqizRn2-_-84cQ:1sKTTN:iZCrvqF5ITy1vtDYhQT-3DdD2LUHRGDeHAnXN5iZFXk', '2024-07-05 01:53:53.873368'),
('foew4sijdcbmkx8mucpmgms9v88hkrfu', '.eJxVjDsKwzAQRO-iOgiBvk6ZPmcQu9pV5CRIYNmVyd0jg4ukGpj3ZnYRYVtL3DovcSZxFU5cfjuE9OJ6AHpCfTSZWl2XGeWhyJN2eW_E79vp_h0U6GWsA7HOxoNja5UyqCaT0GswZMJIDp55GpkCZjYZFVjySORQ2axIi88X94g4zw:1sKjH5:IEsVeK_Xol-AqIMIPbAIKJCr4XOOsyGTX19xbfFicK0', '2024-07-05 18:46:15.341704');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mi_calculadora_app_tbl_ecuaciones`
--

CREATE TABLE `mi_calculadora_app_tbl_ecuaciones` (
  `id_ecuacion` int(11) NOT NULL,
  `ecuacion` varchar(200) NOT NULL,
  `ecuacion_simplificada` varchar(200) DEFAULT NULL,
  `xi_ecuacion` varchar(200) DEFAULT NULL,
  `fi_ecuacion` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mi_calculadora_app_tbl_ecuaciones`
--

INSERT INTO `mi_calculadora_app_tbl_ecuaciones` (`id_ecuacion`, `ecuacion`, `ecuacion_simplificada`, `xi_ecuacion`, `fi_ecuacion`, `user_id`) VALUES
(19, '15.0*x - 3.42261904761904*(x - 2.5)*(x - 2.0)*(x - 1.6) - 3.33333333333334*(x - 2.0)*(x - 1.6) - 22.0', '-3.42261904761904*x**3 + 17.5446428571428*x**2 - 14.7559523809523*x - 5.28571428571433', '[1.6, 2.0, 2.5, 3.2]', '[2.0, 8.0, 14.0, 15.0]', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mi_calculadora_app_tbl_euler`
--

CREATE TABLE `mi_calculadora_app_tbl_euler` (
  `id_ecu` int(11) NOT NULL,
  `ecuacion` varchar(200) NOT NULL,
  `h` varchar(200) NOT NULL,
  `s` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `resultado` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mi_calculadora_app_tbl_euler`
--

INSERT INTO `mi_calculadora_app_tbl_euler` (`id_ecu`, `ecuacion`, `h`, `s`, `user_id`, `resultado`) VALUES
(48, '2*x**2+4*y', '0.25', '2.0', 10, '21.4041'),
(50, '4*x+5', '0.25', '1.0', NULL, '6.5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mi_calculadora_app_tbl_usuarios`
--

CREATE TABLE `mi_calculadora_app_tbl_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `correo` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `mi_calculadora_app_tbl_ecuaciones`
--
ALTER TABLE `mi_calculadora_app_tbl_ecuaciones`
  ADD PRIMARY KEY (`id_ecuacion`),
  ADD KEY `mi_calculadora_app_t_user_id_fb06e47b_fk_auth_user` (`user_id`);

--
-- Indices de la tabla `mi_calculadora_app_tbl_euler`
--
ALTER TABLE `mi_calculadora_app_tbl_euler`
  ADD PRIMARY KEY (`id_ecu`),
  ADD KEY `mi_calculadora_app_tbl_euler_user_id_835137db_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `mi_calculadora_app_tbl_usuarios`
--
ALTER TABLE `mi_calculadora_app_tbl_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `mi_calculadora_app_tbl_ecuaciones`
--
ALTER TABLE `mi_calculadora_app_tbl_ecuaciones`
  MODIFY `id_ecuacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `mi_calculadora_app_tbl_euler`
--
ALTER TABLE `mi_calculadora_app_tbl_euler`
  MODIFY `id_ecu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `mi_calculadora_app_tbl_usuarios`
--
ALTER TABLE `mi_calculadora_app_tbl_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `mi_calculadora_app_tbl_ecuaciones`
--
ALTER TABLE `mi_calculadora_app_tbl_ecuaciones`
  ADD CONSTRAINT `mi_calculadora_app_t_user_id_fb06e47b_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `mi_calculadora_app_tbl_euler`
--
ALTER TABLE `mi_calculadora_app_tbl_euler`
  ADD CONSTRAINT `mi_calculadora_app_tbl_euler_user_id_835137db_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
