// Menu move at [set.js]
$(document).keydown(function(event){  
    if(event.keyCode == '38') {
        pageCnt -= 1;
        if(pageCnt <= 0) {pageCnt = 0;}
        $(menuJson.menu[pageCnt].link).click();
    }

    if(event.keyCode == '40') {
        pageCnt += 1;
        if(pageCnt >= menuJson.menu.length) {pageCnt = menuJson.menu.length-1;}
        $(menuJson.menu[pageCnt].link).click();
    }
});