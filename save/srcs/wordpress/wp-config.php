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
define( 'AUTH_KEY',          '$Hc/Hj;p4^@-J;W(C.;r%np{))J*^anqr:[?_[g;Ab$$%_B?PD5*fU*r,XlGLxG;' );
define( 'SECURE_AUTH_KEY',   '`2OM$N82C5PLfLM<l6_!O4665qa5]yH~Cl.|F:%rNT~yNP[YsdFzwnJb!kfTl1v!' );
define( 'LOGGED_IN_KEY',     'wLzNZhu`r.mnY0aO-=fUL[Zl-z/M&[r$Im|!>tE#NJ2nVj]}-bU@;r3unl!kR>O%' );
define( 'NONCE_KEY',         '^7<E^,:kM{Ygtp+d3LorBT`0sS|&en#B%UaUhAJ_Qq}>%FBG/ED %VFAcvI$+K$}' );
define( 'AUTH_SALT',         'WDfr*0j;6g5DrCun{^U,E-(xY=_0>k0A6&fs_Z&$26YQVJ^~@%vFl<-{6X1JH}2-' );
define( 'SECURE_AUTH_SALT',  'ujTl>RuyCYyDkdzMW`q.v>uTV4A$safJHU(mK5G}f/X 5,a8]M6.Ph}qu`M~|J/R' );
define( 'LOGGED_IN_SALT',    'pF ?ah;q{a0EYzX* -]Wz_&:oOC6zf}LjQP.75pRHOeQt(CZCHXkO-W`YpA|,=yp' );
define( 'NONCE_SALT',        '$,=f[3j2j*=Cls0cNGc=0=w*Wt7W&S`7FzKoD?^^N]5ng=m[gP^~mZx8aMG|A~{{' );
define( 'WP_CACHE_KEY_SALT', '|&*f3*?.L-Fg9J3qQ19@sZI{j3IW9A^;MkiB5~^W!6#ehxJ3c`17/H!}+#zoc7qo' );


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
