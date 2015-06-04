<?php
/**
 * WordPress の基本設定
 *
 * このファイルは、MySQL、テーブル接頭辞、秘密鍵、ABSPATH の設定を含みます。
 * より詳しい情報は {@link http://wpdocs.sourceforge.jp/wp-config.php_%E3%81%AE%E7%B7%A8%E9%9B%86 
 * wp-config.php の編集} を参照してください。MySQL の設定情報はホスティング先より入手できます。
 *
 * このファイルはインストール時に wp-config.php 作成ウィザードが利用します。
 * ウィザードを介さず、このファイルを "wp-config.php" という名前でコピーして直接編集し値を
 * 入力してもかまいません。
 *
 * @package WordPress
 */

// 注意: 
// Windows の "メモ帳" でこのファイルを編集しないでください !
// 問題なく使えるテキストエディタ
// (http://wpdocs.sourceforge.jp/Codex:%E8%AB%87%E8%A9%B1%E5%AE%A4 参照)
// を使用し、必ず UTF-8 の BOM なし (UTF-8N) で保存してください。

// ** MySQL 設定 - この情報はホスティング先から入手してください。 ** //
/** WordPress のためのデータベース名 */
define('DB_NAME', 'wordpress');

/** MySQL データベースのユーザー名 */
define('DB_USER', 'wordpress');

/** MySQL データベースのパスワード */
define('DB_PASSWORD', 'ClassCatWordpress');

/** MySQL のホスト名 */
define('DB_HOST', 'mysql');

/** データベースのテーブルを作成する際のデータベースの文字セット */
define('DB_CHARSET', 'utf8mb4');

/** データベースの照合順序 (ほとんどの場合変更する必要はありません) */
define('DB_COLLATE', '');

/**#@+
 * 認証用ユニークキー
 *
 * それぞれを異なるユニーク (一意) な文字列に変更してください。
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org の秘密鍵サービス} で自動生成することもできます。
 * 後でいつでも変更して、既存のすべての cookie を無効にできます。これにより、すべてのユーザーを強制的に再ログインさせることになります。
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         's/i^qEM ;]{YBliod0vhW 5$k~5nig^2zJt?eUzmGq.|3$ERl#j+mTmeGV-K5_ux');
define('SECURE_AUTH_KEY',  '^[#$YS.h+bv]J}K}d=#0Q#[.kf4><1XGx`A8$<,4ex}j{Q]l-/z47zIod4BWVJ !');
define('LOGGED_IN_KEY',    '%a*?{c,f1$dgoc{RfqG=w?-#rFU^pQZT/Yy8u:y>|Q|1/GIZTH_Kzy_tzm9#NO8*');
define('NONCE_KEY',        'E1-XH1Db68@Mug:k JGk7`L--j{{`%$|KN0e]$u&7Ast;B[:!k0DVPMPcQ*-h1|z');
define('AUTH_SALT',        '-@;w!N9V+]}g->Otcj64+FE!gHWu!s@U~<B-}Y|dN&j0: vo_|`n7zYP3QP#j}*D');
define('SECURE_AUTH_SALT', 'p;ldSe.W@z}#pOf^3S~09V|P}OM#1<|cOML}2nv9FsEo% x?qM%X8A>V2+&h{Zww');
define('LOGGED_IN_SALT',   ';!?D3HFSdT7sB77s#(pLzl$pRL%jTKQxdRqd!=y+$(tu,CD,FHFo!w3qOGGSm1L&');
define('NONCE_SALT',       'BW (x6W+q>ZjOU^/]!`#7b.GX{?X?%~#co}tGvS8Jqo0++erHy$ppp*Vfn?3zKM7');

/**#@-*/

/**
 * WordPress データベーステーブルの接頭辞
 *
 * それぞれにユニーク (一意) な接頭辞を与えることで一つのデータベースに複数の WordPress を
 * インストールすることができます。半角英数字と下線のみを使用してください。
 */
$table_prefix  = 'wp_';

/**
 * 開発者へ: WordPress デバッグモード
 *
 * この値を true にすると、開発中に注意 (notice) を表示します。
 * テーマおよびプラグインの開発者には、その開発環境においてこの WP_DEBUG を使用することを強く推奨します。
 */
define('WP_DEBUG', false);

/* 編集が必要なのはここまでです ! WordPress でブログをお楽しみください。 */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
