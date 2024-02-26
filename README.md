# Founder Digest
A give-and-get newsletter swap for founders seeking to learn from other founders.

## Installation
1. clone the repo
2. `cd founder_digest && bin/setup'
3. 'cp config/application-sample.yml config/application.yml'
4. get 'config.application.yml' realvalues from repo admin

## Development
```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```

To keep your project up-to-date with the latest Founder Digest changes over time:

```sh
# one time only
git remote add speedrail https://github.com/ryanckulp/speedrail.git

# when you notice FounderDigest updates on GitHub
git pull
git fetch speedrail
git merge speedrail/master --allow-unrelated-histories
git checkout -b speedrail_updates
git add .
git push speedrail_updates
# use GitHub UI to handle conflicts
```

**troubleshooting**

ActionCable - to support WebSockets, run `rails g channel channel_name --assets` then add `mount ActionCable.server => '/cable'` to `config/routes.rb`. update `cable.yml` -> `production:` to include the following for Heroku to connect w/ Redis for `ActionCable.broadcast`:

```rb
ssl_params:
    verify_mode: <%= OpenSSL::SSL::VERIFY_NONE %>
```

`Turbo Drive` lazy-loads pages following form submission, causing script tags at the bottom of following views to not always load.

```html
<!-- add data-turbo=false to form submission buttons if the following view needs a full render -->
<button data-turbo="false" type="submit" ...>Submit</button>
```

## Testing
```sh
# headless
bundle exec rspec # run all tests inside spec/
bundle exec rspec spec/dir_name # run all tests inside given directory

# headed (in a real browser)
HEADED=TRUE bundle exec rspec
```

