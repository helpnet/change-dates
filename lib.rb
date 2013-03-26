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
            @links = page.links_with(:text => /Week \d/)
        end
        @links.each do |link|
            puts link
        end
    end


end


