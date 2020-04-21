/* Scroll Position */
// Variable & Style selected
// 0.Home Slider
var sliderHide = document.getElementById("slider-inner");
sliderHide.style.opacity = 1;

// 0.1.Home background
var sliderBack = document.getElementById("slider-back");
sliderBack.style.backgroundPosition = 0 +"%";

// 1.Home Slider
var aboutHide = document.getElementById("about-content");

// setting
var crrWin = window.scrollY;
var crrHeight = document.body.clientHeight;

// Function Access
looping();
function looping() {
    
    // scroll size
    crrWin = window.scrollY;
    crrHeight = document.body.clientHeight;

    console.log(crrWin + "  스크롤위치 " + crrHeight);
    // console.log(crrHeight/crrWin);

    // 0.Home Slider
    var result = (crrHeight/crrWin);
    if (!result) {
        result = 0;
    }
    sliderHide.style.opacity = (result-1.8).toFixed(2);

    // 0.1.Slider background
    console.log(crrWin/crrHeight);
    // crrWin
    // crrHeight
    sliderBack.style.backgroundPosition = (result).toFixed(1) +"%"

    chNum = 2.25;
    if (crrHeight/crrWin < chNum.toFixed(2)) {
        
    }
    requestAnimationFrame(looping);
}