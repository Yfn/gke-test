<?php
use Pecee\SimpleRouter\SimpleRouter;
SimpleRouter::get('/', function() {
    return phpinfo();
});
SimpleRouter::get('/health/check', function() {
    return "I'm running on " . getenv('KUBE_NODE_NAME') . " - " . getenv('KUBE_NODE_IP');
});
?>
