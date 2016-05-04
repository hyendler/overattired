# OverAttired
OverAttired Vintage Fashion - Modern Technology for a Vintage Fit

A customer product matching database for vintage clothing products from Overattired, a Oakland vintage fashion shop, [OverAttired Vintage Fashion](https://www.etsy.com/shop/OverAttiredVintage?ref=l2-shopheader-name&show_panel=true)

This web app is meant to serve to user stories - one would be of the admin/shopkeeper, and vintage clothing shoppers.


### Technical Overview

Technologies used: Ruby on Rails, JQuery/JS, PostgresSQL, Redis, Sidekiq, SideTiq, Boostrap, Capybara, Rspec.

Product database is populated by a background process that makes a daily Etsy API call at 9am PST. Right after the API call is made, if there are new products imported that match a user, the user will be emailed, and the match will be stored for future reference (so the user doesn't get the same match twice).

Also, when a user signs up, they receive a welcome email with initial product matches.

Production is currently set up to run on Heroku.


### Documentation

For further reading/explanation on our background processes: [How-To Guide](https://medium.com/@iregina/overattired-2-setting-up-background-processes-to-automate-etsy-scraping-email-sending-48f990d86ea7)


### Installation
Environment variables
You will need for ENV:
- an Etsy API KEY
- email account and user for Postmanworker email capabilities

Once you clone the project, make sure you have the bundler gem and then run bundle install and your rake commands.  A test customer, admin, and several products provided in the seed files, but are not recommended for production.


### Running the project

First run:
redis-server /usr/local/etc/redis.conf

Then run:
bundle exec sidekiq

Lastly:
rails s


### Testing
[Rails Testing Guide](http://guides.rubyonrails.org/testing.html)


### Authors
Lindsey Stevenson @lindsey-s
Ovi Calvo @0viwan
Regina Wong @iregina
Hanah Yendler @hyendler
