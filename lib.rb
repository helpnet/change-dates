$TERM_DATES = { 1 => "2013-4-02 23:59:00", 2 => "2013-4-10 23:59:00", 3 => "2013-4-17 23:59:00", 4 => "2013-4-24 23:59:00", 5 => "2013-5-01 23:59:00", 6 => "2013-5-08 23:59:00", 7 => "2013-5-15 23:59:00", 8 => "2013-5-08 23:59:00", 9 => "2013-5-15 23:59:00", 10 => "2013-5-22 23:59:00", 10 => "2013-6-05 23:59:00", 11 => "2013-5-11 23:59:00" }

class Course

    def initialize(course_id, mechanize)
        @course_id = course_id
        @mechanize = mechanize

        entry_point
    end

    def entry_point
        @entry_point = "https://learn.dcollege.net/webapps/blackboard/execute/announcement?method=search&context=course&course_id=_#{@course_id}_1&handle=cp_announcements&mode=cpview"
    end


    def get_name
        @mechanize.get(@entry_point) do |page|
            @name = page.link_with(:id => 'courseMenu_link')
            puts @name
        end
    end

    def sidebar_links
        @mechanize.get(@entry_point) do |page|
            @links = page.links_with(:text => /[week|unit] \d+$/i)
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
            puts "#{@course_id} - changed date for week #{week_number} to #{$TERM_DATES[week_number.to_i]}"
        end

    end


end


