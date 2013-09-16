TARCIS: Time And Relative Courses in Space
==========================================
Course timing automation built on top of LMS DOM and URL structure with a web crawler.

Ruby Installation Steps
--------------------

1. Go to https://github.com/helpnet/change-dates to download the program.

2. Open up a Command window (PC), or a Terminal window (Mac).

3. Go to http://www.ruby-lang.org/en/downloads/ and follow the steps to install Ruby that are appropriate for your machine.
Note that Mac users may need to go to https://github.com/kennethreitz/osx-gcc-installer in order to install the Command Line tools prior to following the steps in the website above.

4. Open up a Command window (PC) or a Terminal window (Mac). Type in the following command exactly as it appears, then press 'Enter' or 'Return'. 

	`gem install mechanize` 
	
	The installation process may take a few minutes.
	
Using the Program - Getting the Course List
--------------------

You will need to pull your course listings from Blackboard in the correct format.

1. Right-click on the file named `bookmarklet.js` in the change-dates folder, and open it with Notepad or Text Edit.

2. Copy all of the information in that file.

3. Go to the "Courses" page, and then look through the source code to find the URL for the Courses page without the Drexel Header. It may be something like https://learn.dcollege.net/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_2_1

4. To run the code, copy-paste it into the console in your browser (Firefox: `Tools > Web Developer > Console`) or install it as an actual bookmarklet by prefixing the code with `javascript:` and pasting it in as a bookmark URL.
Either way, the output will be printed in the console. LEft-click on the output, then Ctrl/Command + C to copy the information.

5. Paste the output into `change-dates/current_term/courses.txt`. Make sure that you remove any empty lines or quotation marks that might be included in the output.

Using the Program - Running the Timings
--------------------


1. Before running the program, make sure that the dates listed in `dates.txt` are correct. NOTE: The latest version of dates.txt will always be available here as soon as the schedule is determined.

2. Use the `cd` command in the Command/Terminal window to navigate to the folder where this code resides. Examples of two possibilities are below for Mac and PC. 

	PC: `cd C:/Desktop/change-dates` 
	
	Mac: `cd /Users/YOURCOMPUTERUSERNAMEHERE/Desktop/change-dates`

7. Type the following command into the Command/Terminal window and press Enter. `ruby set_timings.rb current_term/course_list.txt current_term/dates.txt`
If you leave off the `dates.txt` file, it will default to `reset.txt` which will set all the dates to `""`, effectively un-timing them.

Sit back and relax while the computer sets the term dates.

Troubleshooting/considerations
------------------------------
* This code is very brittle! It relies on consistent URLs and DOM elements which could change at anytime.
