/* Scroll Position for active animation */
// Variable & Style selected
// font-color change
var classMenus = document.getElementsByClassName("menu-list");

// 0.Home Slider
var sliderHide = document.getElementById("slider-inner");
sliderHide.style.opacity = 1;

// 0.1.Home background
var sliderBack = document.getElementById("slider-back");
sliderBack.style.backgroundPosition = 0 +"%";

// 1.About Slider
var aboutHide = document.getElementById("about-content");
var cricle = document.getElementsByClassName("cricle");
var criCycle = 0;
var criCycleR = 20

// 2.info Slider
var infoHide = document.getElementById("info-content");

// setting
var crrWin = window.scrollY;
var crrHeight = document.body.clientHeight;
var result = 0;

// Function Access
looping();

function looping() {
    
    // scroll size
    crrWin = window.scrollY;
    crrHeight = document.body.clientHeight;
    result = (crrWin/crrHeight);
    if (!result) {
        result = 0;
    }

    // 임시
    console.log(crrWin + "  스크롤위치 " + crrHeight);

    // MenuColor change
    if(result >= 0.5) {
        for(var i=0; i<classMenus.length; i++) {
            classMenus[i].lastChild.style.color = "#000000";
        }
    } else {
        for(var i=0; i<classMenus.length; i++) {
            classMenus[i].lastChild.style.color = "#ffffff";
        }
    }

    // 0.Home Slider
    sliderHide.style.opacity = 1.5-(result.toFixed(2)*3);
    if(result >= 0.7) {
        sliderHide.style.display = "none";
    } else {
        sliderHide.style.display = "table-cell";
    }

    // 0.1.Slider background
    if (result <= 1) {
        sliderBack.style.backgroundPosition = (result.toFixed(3))*100 +"%"
    }

    // 1.About background
    if (result >= 0.1 && result <= 1.8) {
        criCycle = criCycle + 1;
        criCycle = criCycle % 360;
        for (var i=0; i<cricle.length; i++) {
            console.log("실행");
            cricle[i].style.left = criCycleR*(i+0.5)*Math.cos(criCycle*Math.PI/180) + (10+(1.2)) + "px";
            cricle[i].style.top = criCycleR*(0.5)*Math.sin(criCycle*Math.PI/180) + (20+(1.2)) + "px";
        }
        // if (
        //     cricleTop <= 50 &&
        //     cricleLeft >= 50
        //     ) {
        // } else {
        //     cricleTop += 1;
        //     cricleLeft += 1;
        //     cricleHide.style.top = cricleTop + "px";
        //     cricleHide.style.left = cricleLeft + "px";
        // }
    } else {

    }

    // loop
    requestAnimationFrame(looping);
    
    // function cricleAnimation(centerX, centerY, radius) {
    //     centerX = 
    //     centerY = 
    //     radius = 0;
    // }
}


