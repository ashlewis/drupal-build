<?php
// see http://drush.ws/examples/example.drushrc.php
/**
 * List of tables whose *data* is skipped by the 'sql-dump' and 'sql-sync'
 * commands when the "--structure-tables-key=common" option is provided.
 * You may add specific tables to the existing array or add a new element.
 */
$options['structure-tables']['common'] = array('cache', 'cache_filter', 'cache_menu', 'cache_page', 'history', 'sessions', 'watchdog');

/**
 * Specify options to pass to ssh in backend invoke.  The default is to prohibit
 * password authentication, and is included here, so you may add additional
 * parameters without losing the default configuration.
 */
$options['ssh-options'] = '-o PasswordAuthentication=no';

/**
 * List of paths to exclude, seperated by : (Unix-based systems) or ; (Windows).
 *
 * exclude .htaccess and robots.txt as there are env specific versions of these e.g. .htacess.staging and robots.staging.txt
 * NOTE: symlinks should be created on each environment e.g. .htaccess -> .htacess.staging and robots.txt -> robots.staging.txt
 */
$command_specific['rsync'] = array(
    'exclude-paths' => '.htaccess:robots.txt:*/config.rb',
    'mode' => 'rlptzO',
    'verbose' => TRUE,
    'no-perms' => TRUE
);