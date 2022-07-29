<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'tarchimb_database' );

/** Database username */
define( 'DB_USER', 'tarchimb' );

/** Database password */
define( 'DB_PASSWORD', 'tarchimb_password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          ')EgDi7h$=#ZF$eC/j;Re+.9CHj:W{!gj`)lp+0HsT|jLu/e3zks8-NGA.TAngGYX' );
define( 'SECURE_AUTH_KEY',   'GgO2r?2S`NxrjJDr4@f}VEq{qTt|X<u`3~nx`2F$1~3Dj*G5W(nUG6:1`1ikmY~1' );
define( 'LOGGED_IN_KEY',     'xpsD!tQWeKNuozMDDis_]adG ?0]_6c{?2xX<18XNBaUlr{aM1(,yAq4v8=_LyCD' );
define( 'NONCE_KEY',         'K;y(6?8iOf^HnrV)x9fQnqrSHm22(M_l9cx12S%^GyH?)hgl&?aT/xh5G8|7Ra}3' );
define( 'AUTH_SALT',         'Q+^A/Zq,b!PL`-Lqp`N~V4E80l!0T/PyGg3h!eI;j*ZmiX-fGCT{3zC5WGr9zSnS' );
define( 'SECURE_AUTH_SALT',  'xG+.LN^2&`Tj##CyarvmM#v2yKXlNY]ecW+Gs4wQ}1h*2jKg1qvJ0x3n?)MT8 6)' );
define( 'LOGGED_IN_SALT',    'G^A`BihpDl&Xun.-t!AdbwPg`1?~4TVn:n|OSyt0{zBZHgE}Mq3)P4NzI_d}PG2N' );
define( 'NONCE_SALT',        'O:Km)T7q0BdaTV /JB3.kG7YXS-5:Ywog8}@]{;b3O?ln3UwmLmzhQ~g,@wPgvWI' );
define( 'WP_CACHE_KEY_SALT', ' MTn8d;{5?V3hb{=]7Mn%j_r,MQb==McV(Pi`<v%j$eKRc3lO<D?t[xLnq3e#8)W' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );


/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
