# Amanuensis

Amanuensis is a changelog generator which integrate with all the major code managers and trackers

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amanuensis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amanuensis

## Usage

### Command line

### Ruby program

### Integrations

#### Code managers

##### Github
##### Bitbucket

#### Trackers

##### Github
##### Trello
##### Pivotal tracker

#### Push

Push is different from others integrations as you can chain them:
```ruby
Amanuensis.configure do |config|
  config.push = [:github, :mail, :file]
end
```

This configuration will publish the changelog to your github repository, send an
e-mail with the changelog as a body and finaly produce a changelog file

##### Github
##### Mail
##### File

## Ask for new integration

## Contributing

1. Fork it ( https://github.com/[my-github-username]/amanuensis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
