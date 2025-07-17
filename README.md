# `Jekyll_todo` [![Gem Version](https://badge.fury.io/rb/jekyll_todo.svg)](https://badge.fury.io/rb/jekyll_todo)

Generate a TODO block
Options:
  `id`

Example:

```html
  {% todo %}
    blah blah blah
  {% endtodo %}
```

Example:

```html
{% todo id='todo1' %}
  blah blah blah
{% endtodo %}
```


## Installation

Add the following to your Jekyll website's `Gemfile`:

```ruby
group :jekyll_plugins do
  gem 'jekyll_todo'
end
```

And then execute:

```shell
$ bundle
```


## Usage

Describe how to use this gem


## Development

After checking out this git repository, install dependencies by typing:

```shell
$ bin/setup
```

You should do the above before running Visual Studio Code.


### Run the Tests

```shell
$ bundle exec rake test
```


### Interactive Session

The following will allow you to experiment:

```shell
$ bin/console
```


### Local Installation

To install this gem onto your local machine, type:

```shell
$ bundle exec rake install
```


### To Release A New Version

To create a git tag for the new version, push git commits and tags,
and push the new version of the gem to https://rubygems.org, type:

```shell
$ bundle exec rake release
```


## Contributing

Bug reports and pull requests are welcome at https://github.com/mslinn/jekyll_todo.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
