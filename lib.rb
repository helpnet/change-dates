$TERM_DATES = { 1 => "", 2 => "2013-4-10 07:00:00", 3 => "2013-4-17 07:00:00", 4 => "2013-4-24 07:00:00", 5 => "2013-5-01 07:00:00", 6 => "2013-5-08 07:00:00", 7 => "2013-5-15 07:00:00", 8 => "2013-5-08 07:00:00", 9 => "2013-5-15 07:00:00", 10 => "2013-5-22 07:00:00", 10 => "2013-6-05 07:00:00", 11 => "2013-5-11 07:00:00" }

class Course

    def initialize(course_id, mechanize)
        @course_id = course_id
        @mechanize = mechanize

        entry_point
        get_name
    end

    def entry_point
        @entry_point = "https://learn.dcollege.net/webapps/blackboard/execute/announcement?method=search&context=course&course_id=_#{@course_id}_1&handle=cp_announcements&mode=cpview"
    end


    def get_name
        @mechanize.get(@entry_point) do |page|
            @name = page.link_with(:id => 'courseMenu_link')
        end
    end

    def sidebar_links
        @mechanize.get(@entry_point) do |page|
            @links = page.links_with(:text => /[week|unit] \d+$/i)
        end

        if (@links.length == 0)
            puts "#{@name} - No timeable weeks"
        end

        @links.each do |week_link|

            content_id = /content_id=_(\d+)/.match(week_link.href)[1]
            form_url = "https://learn.dcollege.net/webapps/blackboard/content/manageFolder.jsp?content_id=_#{content_id}_1&course_id=_#{@course_id}_1"
            week_number = /[week|unit] (\d+)/.match(week_link.text)[1]

            @mechanize.get(form_url) do |form_page|

                form_page.form_with(:name => 'the_form') do |f|
                    f.checkbox_with(:name => "bbDateTimePicker_start_checkbox").value = 1
                    f.checkbox_with(:name => "bbDateTimePicker_start_checkbox").check
                    f.bbDateTimePicker_start_datetime = $TERM_DATES[week_number.to_i]
                    f.submit(f.buttons[1])
                end
            end
            puts "#{@name} - changed date for week #{week_number} to #{$TERM_DATES[week_number.to_i]}"
        end

    end


end


