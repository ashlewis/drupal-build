<?php


/**  
 * Implement of drush_hook_sql_sync_validate().   
 * Disallow overwriting remote databases.
 */
function drush_policy_sql_sync_validate($source = NULL, $destination = NULL) {
    if (strpos($destination, 'prod') !== false || strpos($destination, 'staging') !== false) {   
        return drush_set_error(dt('Per /path/to/policy.drush.inc, you may never overwrite any remote database.'));
    }
}