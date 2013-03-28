#! /usr/bin/ruby

require 'mechanize'
require './uname.rb'
require './lib.rb'

course_list = []

File.open('courses.txt').each(sep="\r") do |line|
    course_list << /: (\d+)/.match(line)[1]
end

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

course_list.each do |id|
    course = Course.new(id, mechanize)
    course.sidebar_links
end
