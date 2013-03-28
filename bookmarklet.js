var topDivs = document.getElementsByClassName('collapsible')[0].childNodes[1].childNodes;
var innerDivs = [];
var courses = [];
var message = "";
var listItems;
var course;


for (i=0; i < topDivs.length; i++) {
        if ((topDivs[i].tagName == 'DIV') && (topDivs[i].getAttribute("style") == "")) {
                innerDivs.push(topDivs[i]);
        }       
}

listItems = innerDivs[0].childNodes[3].childNodes;

for (i=0; i < listItems.length; i++) {
        if (listItems[i].tagName == "LI") {
                course = new Object();
                course.id = listItems[i].childNodes[3].href.match(/Course%26id%3D_(\d+)/)[1];
                course.name = listItems[i].childNodes[3].text;
                courses.push(course);
        }
}

for (i=0; i < courses.length; i++) {
        message += "\n" + courses[i].name + ": " + courses[i].id;
}

console.log(message);
