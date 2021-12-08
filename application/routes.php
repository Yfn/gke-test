<?php
use Pecee\SimpleRouter\SimpleRouter;
SimpleRouter::get('/', function() {
    return phpinfo();
});
?>
