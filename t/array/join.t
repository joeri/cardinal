require 'Test'
include Test
plan 3

a = [ 1, 2, 3 ]
b = a.join("-")
is b, "1-2-3", "ok 1"
b = a.join
is b, "123", "ok 2"

$, = ','
todo 1, "join should respect the special variable $,"
b = a.join
is b, "1,2,3", "ok 3"
