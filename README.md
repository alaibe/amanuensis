# Amanuensis

Amanuensis is a changelog generator which integrate with all the major code managers and trackers

Your changelog will contains closed issues and pull requests based on the
tracker you are using.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amanuensis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amanuensis

## Usage via command line

Type ```amanuensis help generate``` for detailed usage.
```
Usage:
  amanuensis generate

Options:
  p, [--push=one two three]
                                    # Default: [:file]
  t, [--tracker=TRACKER]
                                    # Default: github
  c, [--code-manager=CODE_MANAGER]
                                    # Default: github
  u, [--version=VERSION]
                                    # Default: patch
  v, [--verbose], [--no-verbose]
  g, [--github=key:value]
  b, [--bitbucket=key:value]
  c, [--trello=key:value]
  i, [--pivotal=key:value]
  m, [--mail=key:value]
  f, [--file=key:value]

Generate a changelog
```

Type ``` amanuensis generate [options]``` to generate the changelog


## Usage via ruby program

Just call the method ```#generate```
```ruby
Amanuensis.generate
```

Before calling the generator you need to configure it:
```ruby
Amanuensis.configure do |config|
  config.push = [:github]
end

Amanuens.configure :github |config|
  config.oauth_token = 'token'
end
```

For each integrations system available, a configuration is also available

## Integrations

### Code managers

If you don't specify any code managers, ```github``` will be used by default

#### Github

If you use github as a code manager, a github release will be created at the end of the process

Via command line:
```
amanuensis generator --github=oauth_token:my_token repo:alaibe/amanuensis
```

Via Ruby:
```ruby
Amanuensis.configure :github do |config|
  config.oauth_token = 'my_token'
  config.repo        = 'my_token'
end
```

#### Bitbucket

Coming soon

### Trackers

If you don't specify any traker, ```github``` will be used by default

#### Github

If github is used, the changelog will contains the closed issues since the last release and the pull request since the last release

Via command line:
```
amanuensis generator --github=oauth_token:my_token repo:alaibe/amanuensis
```

Via Ruby:
```ruby
Amanuensis.configure :github do |config|
  config.oauth_token = 'my_token'
  config.repo        = 'my_token'
end
```

#### Trello

Coming soon

#### Pivotal tracker

Coming soon

### Push

If you don't specify any traker, ```file``` will be used by default

Push is different from others integrations as you can chain them:
```ruby
Amanuensis.configure do |config|
  config.push = [:github, :mail, :file]
end
```

This configuration will publish the changelog to your github repository, send an
e-mail with the changelog as a body and finaly produce a changelog file

##### Github

If you use github to push your changelog, it will be append to the file named Changelog.md by default

Via command line:
```
amanuensis generator --github=oauth_token:my_token repo:alaibe/amanuensis
file_name:new_changelog.md
```

Via Ruby:
```ruby
Amanuensis.configure :github do |config|
  config.oauth_token = 'my_token'
  config.repo        = 'my_token'
  config.file_name   = 'new_changelog.md'
end
```

The option ```file_name``` is not required

##### Mail
##### File

If you export push your changelog with the file option, it will create a file named ```Changelog.md``` by default

```
amanuensis generator --file=file_name:new_changelog.md
```

Via Ruby:
```ruby
Amanuensis.configure :file do |config|
  config.file_name   = 'new_changelog.md'
end
```

The option ```file_name``` is not required

## Ask for new integration

If you want new integration you can create an issue via the github and issues and add the label integration on it

## Contributing

1. Fork it ( https://github.com/[my-github-username]/amanuensis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
