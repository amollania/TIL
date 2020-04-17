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

// Main Slider Text
function oneDelay() {
    
}




// Function Assecc
allFadeAnimation();