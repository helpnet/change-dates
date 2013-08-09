TARCIS: Time And Relative Courses in Space
==========================================
Course timing automation built on top of LMS DOM and URL structure with a web crawler.

Installation & Usage
--------------------

1. Go to "https://github.com/helpnet/change-dates" to download the program.

2. Open up a Command window (PC), or a Terminal window (Mac).

3. Go to "http://www.ruby-lang.org/en/downloads/" and follow the steps to install Ruby that are appropriate for your machine.

4. Open up a Command window (PC) or a Terminal window (Mac). Type in the following command exactly as it appears, then press 'Enter' or 'Return'. 
	`gem install mechanize` 
	The installation process may take a few minutes.

5. Place current term dates.txt and your courses.txt file into the `current_term/` directory. NOTE: The latest version of dates.txt will always be available here as soon as the schedule is determined.

6. Use the `cd` command in the Command/Terminal window to navigate to the folder where this code resides. Examples of two possibilities are below for Mac and PC. 
	PC: `cd C:/Desktop/change-dates` 
	
	Mac: `cd /Users/YOURCOMPUTERUSERNAMEHERE/Desktop/change-dates`

7. Type the following command into the Command/Terminal window and press Enter. `ruby set_timings.rb current_term/course_list.txt current_term/dates.txt`

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
