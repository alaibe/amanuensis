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
  c, [--trello=key:value]
  i, [--pivotal=key:value]
  m, [--mail=key:value]
  f, [--file=key:value]

Generate a changelog
```

Type ``` amanuensis generate [options]``` to generate the changelog


## Usage via ruby

Just call the method ```#generate```
```ruby
Amanuensis.generate
```

Before calling the generator you need to configure it:
```ruby
Amanuensis.push = [:github]
  
Amanuensis::Github.oauth_token = ENV.fetch('GITHUB_OAUTH_TOKEN')
Amanuensis::Github.repo        = ENV.fetch('GITHUB_REPO')
```

Each integrations are configurable, just like ```Amanuensis```

For ```Amanuensis```, it is possible to set:
* push
* code_manager
* tracker
* version
* verbose

```ruby
Amanuensis.push = [:github, :file, :mail]
Amanuensis.tracker = :github
Amanuensis.code_manager = :github
Amanuensis.version = :major
Amanuensis.verbose = true
```

See below for all integrations available and their respective configuration

## Version

The allowed values for version are:
* major
* minor
* patch

And it works like that:
```
major.minor.patch
```

If there is not release the first version will be:
```
0.0.1
```

## Integrations

### Code managers

If you don't specify any code managers, ```github``` will be used by default

#### Github

If you use github as a code manager, a github release will be created at the end of the process
The changelog will also contains all pull requests closed since the latest release

Via command line:
```
amanuensis generate --github=oauth_token:my_token repo:alaibe/amanuensis
```

Via Ruby:
```ruby
Amanuensis::Github.oauth_token = ENV.fetch('GITHUB_OAUTH_TOKEN')
Amanuensis::Github.repo        = ENV.fetch('GITHUB_REPO')
```

### Trackers

If you don't specify any traker, ```github``` will be used by default

#### Github

If github is used, the changelog will contains the closed issues since the last release

Via command line:
```
amanuensis generate --github=oauth_token:my_token repo:alaibe/amanuensis
```

Via Ruby:
```ruby
Amanuensis::Github.oauth_token = ENV.fetch('GITHUB_OAUTH_TOKEN')
Amanuensis::Github.repo        = ENV.fetch('GITHUB_REPO')
```

#### Trello

If trello is used, the changelog will contains the closed cards since the last release

Via command line:
```
amanuensis generate --trello=key:my_key token:my_token board:amanuensis list:done
```

Via Ruby:
```ruby
Amanuensis::Trello.key   = ENV.fetch('TRELLO_KEY')
Amanuensis::Trello.token = ENV.fetch('TRELLO_TOKEN')
Amanuensis::Trello.board = ENV.fetch('TRELLO_BOARD')
Amanuensis::Trello.list  = ENV.fetch('TRELLO_LIST')
```

#### Pivotal tracker

If pivotal is used, the changelog will contains the accepted cards since the last release

Via command line:
```
amanuensis generate --pivotal=token:my_token project:amanuensis
```

Via Ruby:
```ruby
Amanuensis::Pivotal.token   = ENV.fetch('PIVOTAL_TOKEN')
Amanuensis::Pivotal.project = ENV.fetch('PIVOTAL_PROJECT')
```

### Push

If you don't specify any push, ```file``` will be used by default

Push is different from others integrations as you can chain them:
```ruby
Amanuensis.push = [:github, :mail, :file]
```

This configuration will publish the changelog to your github repository, send an
e-mail with the changelog as a body and finaly produce a changelog file

##### Github

If you use github to push your changelog, it will be append to the file named Changelog.md by default

Via command line:
```
amanuensis generate --github=oauth_token:my_token repo:alaibe/amanuensis
file_name:new_changelog.md
```

Via Ruby:
```ruby
Amanuensis::Github.oauth_token = ENV.fetch('GITHUB_OAUTH_TOKEN')
Amanuensis::Github.repo        = ENV.fetch('GITHUB_REPO')
Amanuensis::Github.file_name   = ENV.fetch('GITHUB_FILE_NAME')
```

The option ```file_name``` is not required and is set to ```Changelog.md``` by default

##### Mail

We use the gem pony in order to send mail
See the gem readme for all the options available: https://github.com/benprew/pony

All nested hash params are flatten for the command line

Via command line:
```
amanuensis generate --mail=to:anthony@amanuensis.com via_options_port:25
```

Via Ruby:
```ruby
Amanuensis::Mail.pony = { to: 'anthony@amanuensis.com', via_options: { port: 25 }}
```

##### File

If you export push your changelog with the file option, it will create a file named ```Changelog.md``` by default

```
amanuensis generate --file=file_name:new_changelog.md
```

Via Ruby:
```ruby
Amanuensis::File.file_name   = 'new_changelog.md'
```

The option ```file_name``` is not required and is set to ```Changelog.md``` by default

## Ask for new integration

If you want new integration you can create an issue via github and add the label integration on it.

## Contributing

1. Fork it ( https://github.com/alaibe/amanuensis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
