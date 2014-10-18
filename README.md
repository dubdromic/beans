# Beans

Beans is a small gem companion to your coffee addiction - it allows for easy tracking of taste, brew time, temperature, brand and brew method.

This gem is desinged to be plugged in to another front-end framework or library (like [Rails](http://github.com/rails/rails) or [Thor](http://github.com/erikhuda/thor)).

Current version: 0.0.1. It doesn't work yet. Like any good software suite this will be considered 1.0.0 when it's self-hosting...that is, my brew notes will include things like "improved clarity on Beans refactor" or "blacked out and rewrote all tests in Haskell".

## Usage

Configure your repositories (an in-memory one is provided). Repositories should align with an interface that's ill-defined in `lib/beans/repositories/in_memory/base.rb`. This could (and will) change at any time.

```
Beans.configure do |config|
  config.register_repository :bean, Beans::Repositories::InMemory::Bean.new
  config.register_repository :brew, Beans::Repositories::InMemory::Brew.new
  # ... etc ...
end
```

And then use it? Again, this doesn't really work.

`Beans.add_bean 'Awesome Beans', 'Lake Toba', 'Sumatra'`

:thumbsup:
