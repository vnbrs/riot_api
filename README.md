# riotgames_api
The RiotAPI gem allows Ruby developers to programatically access the Riot Games API with a cool DSL.

![Blitzcrank approves!](https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/40b52aba-ebad-4342-96c5-d8c23437ad5b/d5xuhop-d5f510a7-391e-4a7e-9307-c8cab2e7d72e.png/v1/fill/w_1024,h_485,q_80,strp/iblitz_crank_by_figgycus_d5xuhop-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDg1IiwicGF0aCI6IlwvZlwvNDBiNTJhYmEtZWJhZC00MzQyLTk2YzUtZDhjMjM0MzdhZDViXC9kNXh1aG9wLWQ1ZjUxMGE3LTM5MWUtNGE3ZS05MzA3LWM4Y2FiMmU3ZDcyZS5wbmciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.6d3xFdnUaZljN0mKWR9AQk2W8QLOKp2VCNdm_Nc1MV4)


## Installation

Add this line to your application's Gemfile:

```ruby 
gem 'riotgames_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install riotgames_api

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

Bug reports and pull requests are welcome on GitHub at https://github.com/vnbrs/riotgames_api.
