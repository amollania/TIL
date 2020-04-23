<div id="home-content" class="content-inner">
    <div id="home-slider">
        <div id="slider-inner">
            <h4 class="text-center text-animation">대전에서 집이 내게 가져온</h4>
            <h1 class="text-center display-1 text-animation">일상변화</h1>
        </div>
        <div id="slider-back"></div>
    </div>
</div>
    
<div id="about-content" class="content-inner">
    <div id="content-body" class="container">
        <div class="row text-center">
            <h4>미디어로 따뜻한 집을 소개하는</h4>
            <h2>주택튜브</h2>

            <!-- 이미지 수정 요구 -->
            <a href="https://www.youtube.com/channel/UCo7GAOked98iFAWPLr09ROg" target="_blank"><img src="./images/youtube.png" alt="" style="width: 350px;"></a>
            <h6 style="color:#c5b0b0;">클릭시 유튜브 채널로 이동합니다.</h6>
            <!-- SVG Action -->
            <li class="cricle"><img src="./svg/cricle.svg" alt=""></li>
            <li class="cricle"><img src="./svg/cricle2.svg" alt=""></li>
            <li class="cricle"><img src="./svg/cricle3.svg" alt=""></li>
            <div id="about-img"><img src="./images/apartment.png" alt=""></div>
        </div>
    </div>
</div>

<div id="info-content" class="content-inner">
    <div id="content-body" class="container">
        <div class="row text-center">
            <h4>신속하고 간편한 요청</h4>
            <h2>신청문의</h2>
            <?php if((include 'write.php')==TRUE) {} ?>
        </div>
    </div>
</div>

<div id="write-content" class="content-inner">
    <div style="background-image: url(<?php echo $relative_path ?>images/opinion.jpg); background-attachment: fixed; background-size: cover;">
        <div id="content-body" class="container" style="padding: 100px 0;">
            <div class="row text-center">
                <h4 style="color:#fff;">귀하의 소중한 의견이 방영되는</h4>
                <h2 style="color:#fff;">방명록</h2>
                <h3 style="color:#fff;">방명록 개설중입니다.</h3>
                <?php if((include 'list.php')==TRUE) {} ?>
            </div>
        </div>
    </div>
    <h3 style="text-align:center; padding-top:120px;">방명록 개설중입니다.</h3>
</div>

<div id="sns-content" class="content-inner" style="background-image: url(<?php echo $relative_path ?>images/sns.jpg); background-attachment: fixed; background-size: cover;">
    <div id="content-body" class="container">
            <div class="row text-center">
                <h4 class="font-shadow" style="color:#fff; ">현재 우리의 소식을 들을 수 있는</h4>
                <h2 class="font-shadow" style="color:#fff;">SNS</h2>

                <li class="sns"><a href="https://www.facebook.com/" target="_blank"><img src="./svg/facebook.svg" alt=""></a></li>
                <li class="sns"><a href="https://www.instagram.com/" target="_blank"><img src="./svg/instargram.svg" alt=""></a></li>
            </div>
    </div>
</div>