TARCIS: Time And Relative Courses in Space
==========================================
Course timing automation built on top of LMS DOM and URL structure with a web crawler.

Installation & Usage
--------------------

`git clone` the repo. Install the bookmarklet (more on that later). Run `bundle install` to install all the gem dependencies.

Place current term dates.txt and your courses.txt file into the `current_term/` directory

The command syntax is: `ruby set_timings.rb current_term/course_list.txt current_term/dates.txt`

If you leave off the `dates.txt` file, it will default to `reset.txt` which will set all the dates to `""`, effectively un-timing them.

Sit back and relax while the computer sets the term dates.

bookmarklet.js
--------------
This bookmarklet provides some convenience functions for getting a course list with URL id's. 
1. Go to the "Courses" page, and then look through the source code to find the URL for the Courses page without the Drexel Header. It may be something like "https://learn.dcollege.net/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_2_1"
2. To run the code, copy-paste it into the console in your browser or install it as an actual bookmarklet by prefixing the code with `javascript:` and pasting it in as a bookmark URL.

Either way, the output will be printed in the console. You can copy paste this list into courses.txt

Troubleshooting/considerations
------------------------------
* This code is very brittle! It relies on consistent URLs and DOM elements which could change at anytime.
