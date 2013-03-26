#! /usr/bin/ruby

require 'mechanize'
require './uname.rb'
require './lib.rb'

my_creds = Credentials.new

mechanize = Mechanize.new do |agent|
    agent.user_agent_alias = 'Mac Safari'
    agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
end

mechanize.get('https://learn.dcollege.net/') do |page|
    homepage = page.form_with(:name => 'login') do |credentials|
        credentials.user_id = my_creds.username
        credentials.password = my_creds.password
    end.submit
end

course = Course.new(54814, mechanize)
course.get_name
course.sidebar_links
