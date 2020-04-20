/* Scroll Position */
// Variable & Style selected
// 0.Home Slider
var sliderHide = document.getElementById("slider-inner");
sliderHide.style.opacity = 1;

// 1.Home Slider
var aboutHide = document.getElementById("about-content");


// Function Access
looping();
function looping() {
    
    // scroll size
    var crrWin = window.scrollY;
    var crrHeight = document.body.clientHeight;
    console.log(crrWin + "  스크롤위치 " + crrHeight);
    console.log(crrHeight/crrWin);

    // 0.Home Slider
    var result = (crrHeight/crrWin)-1.8;
    console.log(result);
    sliderHide.style.opacity = result.toFixed(2);


    chNum = 2.25;
    if (crrHeight/crrWin < chNum.toFixed(2)) {

    }
    setTimeout(looping, 10);
}