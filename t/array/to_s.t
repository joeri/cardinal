require 'Test'
include Test
plan 4

a = [ 1, 2 ]
is a.to_s, a.inspect

# In the ruby specs it is tested that the following three situations do not throw errors
b = [1, 2]
b << b
is b.to_s, b.inspect

x = [1, 2]
y = [3, 4]
x << y
y << x
is x.to_s, x.inspect
is y.to_s, y.inspect
