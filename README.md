# Savagery

Ruthlessly sprite SVGs in your Rails app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "savagery"
```

## Usage

Given the following directory structure:

```
app/assets/svgs/
└── dogs
    ├── chihuahua.svg
    ├── golden.svg
    └── lab.svg
```

Rails: Use the `svg_sprite_use` helper in your view:

```ruby
# app/views/dogs/show.html.erb
<%= svg_sprite_use "dogs/chihuahua" %>
```

And Savagery will do all the hard work of spriting and embedding. A new .svg
sprite file will appear in the `app/assets/svgs` directory, named after the directory
containing the sprites:

```
app/assets/svgs/
├── dogs
│   ├── chihuahua.svg
│   ├── golden.svg
│   └── lab.svg
└── dogs.svg
```

Make sure you check this file into version control.

## Contributing

1. Fork it ( https://github.com/botandrose/savagery/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

