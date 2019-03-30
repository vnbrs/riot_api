# RiotAPI

The RiotAPI gem allows Ruby developers to programatically access the Riot Games API with a cool DSL. P.S.: Blitzcrank approves!

![Blitzcrank approves!](https://vignette.wikia.nocookie.net/p__/images/4/41/Blitzcrank_Render_old_%281%29.png/revision/latest?cb=20170128010045&path-prefix=protagonist)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'riot_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install riot_api

## Usage

```ruby
# Do this once in your application startup
RiotAPI.configure "your api key"

# And use it =)
RiotAPI::Summoner.find(name: "Mid or Feed", region: :na)
# => #<RiotAPI::Summoner:0x00007fffd0a3b9c0 @id="pLIQUh9AUMSSwLMKdlNscoDEkoIYs2fYGAytTIKHkwy5YWg", @account_id=nil, @profile_icon_id=nil, @puuid="7qiWDJqhrCjc2xLDvfEsm2UiZOvo6l7UjBjUuRq7cwtWXRgSh8fGR59YC1Ls3mBZao6nDW_JiQ05gw", @summoner_level=nil, @revision_date=nil>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vnbrs/riot_api.
