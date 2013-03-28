#! /usr/bin/ruby

require 'mechanize'
require './lib.rb'
require 'io/console'

puts "Username:"
uname = gets.chomp

puts "Password (hidden):"
pword = STDIN.noecho(&:gets).chomp

course_list = []

file = ARGV[1]

File.open('courses.txt').each(sep="\r") do |line|
    course_list << /: (\d+)/.match(line)[1]
end

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
    course.sidebar_links
end
