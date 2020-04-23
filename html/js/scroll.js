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
var criCycleR = 20;
var isAboutAccess = true; // new plane
var aboutBackImg = document.getElementById("about-img");

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
    // cricle animation
    if (result >= 0.1 && result <= 1.8) {
        criCycle = criCycle + 1;
        criCycle = criCycle % 360;
        for (var i=0; i<cricle.length; i++) {
            cricle[i].style.left = criCycleR*(i+0.5)*Math.cos(criCycle*Math.PI/180) + (10+(1.2)) + "px";
            cricle[i].style.top = criCycleR*(0.5)*Math.sin(criCycle*Math.PI/180) + (20+(1.2)) + "px";
        }
    } else {

    }
    // background image effect
    if(2.0 > result && result >= 0.85 && isAboutAccess && result!=0) {
        var backgroundEffect = function() {
            var count = 0;
            aboutBackImg.lastChild.style.opacity = 0
            aboutBackImg.lastChild.style.display = "block";
            var effectAnimation = function() {
                if(count <= 1) {
                    count = count + 0.05;
                    aboutBackImg.lastChild.style.opacity = count;
                    setTimeout(effectAnimation, 1000/24);
                }
            }
            effectAnimation();
            isAboutAccess = false;
        }
        backgroundEffect();
    } else if(result >= 2.0 && !isAboutAccess || result < 0.85 && !isAboutAccess) {
        aboutBackImg.lastChild.style.opacity = 0;
        aboutBackImg.lastChild.style.display = "none";
        isAboutAccess = true;
    }

    // loop
    requestAnimationFrame(looping);
}




// 반복->
// 일회용
//     조건문 위치 && 함수 남은 카운트 ->
//         함수 실행->
//             리턴->
//             해당 함수 더이상 실행하지않도록 조건문 부합x 2번함수 카운트 채우기

    
//     조건문 위치 && 남은 함수 카운트 ->
//         다음 함수 실행->
//         리턴->
//         해당 함수 더 이상 실행x, 1번 함수 카운트 채우기
