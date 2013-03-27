var topDivs = document.getElementsByClassName('collapsible')[0].childNodes[1].childNodes;
var innerDivs = [];

for (i=0; i < topDivs.length; i++) {
        if (topDivs[i].tagName == 'DIV') { 
                innerDivs.push(topDivs[i]);
        }
}

for (i=0; i < innerDivs.length; i++) {
        if (innerDivs[i].getAttribute == ) {
                console.log(innerDivs[i]);
        }
}

