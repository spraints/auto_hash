I saw this post about [recursively setting deep hash values](ilovemetaprogramming.tumblr.com/post/4608928018/recursively-setting-deep-hash-value)
and thought it would be more awesome if it didn't create a big
empty hash tree when you check to see if a key is there.

So, with AutoHash, you can do this:

````ruby
thing = AutoHash.new
thing['fingers']['count'] = 5
````

But you can also do this:

````ruby
thing = AutoHash.new
if thing['fingers']
  puts "Thing has #{thing['fingers']['count']} fingers."
else
  puts "Thing's fingers are not yet defined."
end
````
