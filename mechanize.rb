#! /usr/bin/ruby

require 'mechanize'
require './lib.rb'
require 'io/console'

print "Username: "
uname = STDIN.gets.chomp

print "Password (hidden): "
pword = STDIN.noecho(&:gets).chomp

puts "\nLogging you in and finding courses...."

file = ARGV[0]

course_list = ConfigFile.process(file)

mechanize = Mechanize.new do |agent|
    agent.user_agent_alias = 'Mac Safari'
    agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
end

mechanize.get('https://learn.dcollege.net/') do |page|
    homepage = page.form_with(:name => 'login') do |credentials|
        credentials.user_id = uname
        credentials.password = pword
    end.submit
end

course_list.each do |id|
    course = Course.new(id, mechanize)
    course.time_content_areas
end
