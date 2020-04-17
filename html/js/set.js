// Menu Setting
var menu = document.getElementById("menu");
var menuOl = document.createElement("ol");
menuOl.setAttribute("class", "main-menu animation-fade");
menu.appendChild(menuOl);

// Menu Loop
var menuJson = {
    "menu" : [
        {"name":"home", "link":"#home", "ko": "홈"},
        {"name":"about", "link":"#about", "ko": "소개"},
        {"name":"info", "link":"#info", "ko": "안내"},
        {"name":"write", "link":"#write", "ko": "방명록"},
        {"name":"sns", "link":"#sns", "ko": "SNS"}
    ]
}

// Menu list print
for(var i=0; i < menuJson.menu.length; i++) {
    var menuLi = document.createElement("li");
    var menuA = document.createElement("a");
    var menuText = document.createTextNode(menuJson.menu[i].ko);
    menuLi.setAttribute("class", "menu-list");
    menuA.setAttribute("href", menuJson.menu[i].link);
    menuA.setAttribute("id", menuJson.menu[i].name);
    menuOl.appendChild(menuLi);
    menuLi.appendChild(menuA);
    menuA.appendChild(menuText);

}

$(document).ready(function(){
    $(menuJson.menu[0].link).click(function(){
        var offset = $(menuJson.menu[0].link+'-content').offset();
        $('html').animate({scrollTop : offset.top}, 400);
    });
});