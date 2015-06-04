<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'ClassCatWordpress');

/** MySQL hostname */
define('DB_HOST', 'mysql');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'l&90c@r<vY(YXk(?|rMo_<~qyR*q.F5bbu2=a`Pz]}Kj AVn~zHV+;!Ux3|-=huR');
define('SECURE_AUTH_KEY',  '{gQ9:?u.|?33U|_a1wP>zcIAub*%T]rsgsGL9_L-@_m{iXTygG/%R(PnZUy4>+[)');
define('LOGGED_IN_KEY',    'zX~eFV4B>1_HhuBpPl,53(jFblm-$-`BJ1)0^RS+@wh{n<3CGUc>e5z|qzC.E8-O');
define('NONCE_KEY',        '$DZ6rk:y&YnkTW3?$62:I^#O@TS[A6[zF&LPsRZ-.ktx(VKlS>8n1{}Ac #yEq(q');
define('AUTH_SALT',        'x+jOrCVo/L{Sn`D~ZhARkev/;W2[Oyp[}w4n0vE%ti,5C&h ^=G)`-7rO6tji=)Q');
define('SECURE_AUTH_SALT', '$l&gN9f,1tq+fzfISW$:g/FDfbmWh8//,Zd|;Qbj4Y-/7@#Q!FZ+.l+6RV=V ~R}');
define('LOGGED_IN_SALT',   'M34?=-{-E{4&s.4m*2/:+5-whtkDCr_P+u< xt3OQ/]VsAy|8B5}73}CXdT9jP Y');
define('NONCE_SALT',       'df@&lKmq1v26beCF/4O:HWRG ,gQ]|7$20$HiAb2xaKM@<1+3O5I#0Lr/:oZB`iz');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

