# OverAttired
OverAttired Vintage Fashion - Modern Technology for a Vintage Fit

A customer product matching database for the Overattired, a Oakland vintage fashion shop, [OverAttired](https://www.etsy.com/shop/OverAttiredVintage?ref=l2-shopheader-name&show_panel=true)

# Overview

# Technical Overview

Technologies used: Ruby on Rails, JQuery/JS, PostgresSQL, Redis, Sidekiq, SideTiq, ActionMailer, Boostrap

Product database is populated by a background process that makes a daily Etsy API call at 9am PST. Right after the API call is made, if there are new products imported that match a user, the user will be emailed, and the match will be stored for future reference (so the user doesn't get the same match twice).



# Documentation

# Installation
Environment variables
You will need for ENV:
- an Etsy API KEY
- 

Once you clone the project, make sure you have the bundler gem and then run bundle install and your rake commands.  A test customer, admin, and several products provided in the seed files, but are not recommended for production.

# Running

# Testing


# Authors
Lindsey Stevenson @lindsey-s
Ovi Calvo @0viwan
Regina Wong @iregina
Hanah Yendler @hyendler






* how to set up/read our code on background processes: [How-To Guide](https://medium.com/@iregina/overattired-2-setting-up-background-processes-to-automate-etsy-scraping-email-sending-48f990d86ea7)