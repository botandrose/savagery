# Savagery

Ruthlessly sprite SVGs in your Rails app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "savagery"
```

## Usage

Give savagery the name of a directory in app/assets/images to sprite:

```ruby
# app/views/layouts/application.html.erb
<%= svg_sprite_include "svgs" %>
```

And then any images within that directory will be available later on in the view:

```ruby
# app/views/dogs/show.html.erb
<%= svg_sprite_use "svgs/chihuahua" %>
```

## TODO

* remove necessity of `svg_sprite_include`
* add handlebars helpers for ember apps

## Contributing

1. Fork it ( https://github.com/[my-github-username]/savagery/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

