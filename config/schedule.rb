# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :etsy_scraping, "/lib/etsy.rb"

every 1.day, :at => '8am' do
  runner "store_data_from_etsy"
end

# set :email_matches, "/path/to_email_file"

# every 1.day, :at => '10am' do
#   runner "send_match_email"
# end
