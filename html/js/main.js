/* Function Make */
// Main Animation
var fadeCnt = 0;
var fadeAnimation = document.getElementsByClassName("animation-fade");
for(var i=0; i< fadeAnimation.length; i++) {
    fadeAnimation[i].style.opacity = 0;
}

function allFadeAnimation() {
    if(fadeCnt< 1){
        for(var i=0; i < fadeAnimation.length; i++) {
            if (fadeCnt >= 1.0) {
                fadeCnt = 1.0;
            } else {
                fadeCnt = fadeCnt + 0.01;
            }
            fadeAnimation[i].style.opacity = fadeCnt;
        }
        setTimeout(allFadeAnimation, 35);
    } else {
        fadeCnt = 0;
    }
}


// Mobile size Function
var mobileSize = 640;
var isMobile = false;
var menus = document.getElementsByClassName("menu-list");

function MobileAccess() {
    if(window.innerWidth <= mobileSize) {
        isMobile = true;
    } else {
        isMobile = false;
    }
    if (isMobile) {
        // if, this is Mobile size
        for(var i=0; i < menus.length;i++) {
            menus[i].style.width = 105+"px";
            var menusA = menus[i].lastChild;
            menusA.style.fontSize = 1.2 + "em";
        }
    } else {
        for(var i=0; i < menus.length;i++) {
            if(menus[i].style.width) {
                menus[i].style.removeProperty("width");
                var menusA = menus[i].lastChild;
                menusA.style.fontSize = 1.7 + "em";
            };
        }
    }
    requestAnimationFrame(MobileAccess);
}

// Function Assecc
allFadeAnimation();

MobileAccess();