$TERM_DATES = { 1 => "04/01/2013" }

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
            @links = page.links_with(:text => /[week|unit] \d$/i)
        end

        content_id = /content_id=_(\d+)/.match(@links[0].href)[1]
        form_url = "https://learn.dcollege.net/webapps/blackboard/content/manageFolder.jsp?content_id=_#{content_id}_1&course_id=_#{@course_id}_1"

        @mechanize.get(form_url) do |form_page|

            form_page.form_with(:name => 'the_form') do |f|
                f.checkbox_with(:name => "bbDateTimePicker_start_checkbox").value = 1
                f.bbDateTimePicker_start_datetime = "2013-4-01 23:59:00"
                p f.button_with(:value => "Submit")
                f.submit(f.button_with(:value => "Submit"))
            end
        end

    end


end


